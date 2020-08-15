/*

Erics Open Source ResQ Search and Rescue Tool
My Youtube Channel  : http://www.youtube.com/mkmeorg
If you use this code or personalize it etc- please consider sharing it back with the world via the forum at http://www.mkme.org/forum
Website, Forum http://mkme.org
Chat with Me: Discord http://mkme.org/discord
Store http://mkme.org/store
  
This software is based on the work of Ray Burnette: https://www.hackster.io/rayburne/esp8266-mini-sniff-f6b93a
AND Human detector by Andreas Spiess
Handy info- VIDEO: https://www.youtube.com/watch?v=fmhjtzmLrg8 explains why apple devices not connected keep spamming new MAC's
Channel -2 in serial is what m iphone beacons on when not connected- Maybe minus channels are non connected?

This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
https://creativecommons.org/licenses/by-nc/4.0/ 
 
V1 Spring 2020:
 V1.xxx standalone with oled and sd card working stable and usable
 Moving to Git HUUUUUUUUUUUUUUGE effaround as OLED and SPI wont work together- traced back to Adafruit libs and possibly RAM issue
 Switched to u8x8 lib WORKS!
 FINALLY displaying active APs and clients on OLED but this is VERY unstable.  2 uploads have caused gibberish serial output- slowed down to 57600 to test if related. 

 IDE Used: 1.8.8
 USE THIS PubClient lib- ONLY ONE THAT WORKS!!! https://github.com/heman4t/Arduino-pubsubclient
  
SD CARD STUFF
 * ERIC Confirms working using D5-D8 and no pullup 
 * 
 * This example shows how to log data from an analog sensor
 * to an SD card using the SD library.
 * The WeMos Micro SD Shield uses:
 * D5, D6, D7, D8, 3V3 and G
 * The shield uses SPI bus pins:
 * D5 = CLK
 * D6 = MISO
 * D7 = MOSI
 * D8 = CS

 
V2.1 July 2020
 GPS code incorporated and working
 High load soft resets if large # of beacons being indexed initially- seems fine after stabilising

2020-8-4
Note PCB V1.1 
 - OLED is VCC, GND then I2c- ALL my other OLEDs in the bin start with GROUND on the end.  blargh
 Of note- An oled can get hot enough to burn fingers...twice...and still work   ¯\_(ツ)_/¯
 Also check OLED VCC- looks like I may have used 5v instead of 3.3- no biggie but verify schematics someday eric....

 2020-8-4
 killed setp SD card fail return block- otherwise test stand rigs without SD will fail and hang and never sniff clients

V2.2 
 
*/


//Adding OLED Functions ERIC
#include <Arduino.h>
#include <U8x8lib.h>
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
U8X8_SSD1306_128X64_NONAME_SW_I2C u8x8(/* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);   // OLEDs without Reset of the Display
//End OLED add for this section ERIC

//GPS req's added
#include <SoftwareSerial.h>
#include <TinyGPS++.h>
TinyGPSPlus gps;  // The TinyGPS++ object
SoftwareSerial ss(2, 0);
float latitude , longitude;
int year , month , date, hour , minute , second;
String date_str , time_str , lat_str , lng_str;
int pm;
//End GPS

#include <SPI.h>
#include <SD.h>
// change this to match your SD shield or module;
// WeMos Micro SD Shield V1.0.0: D8
// LOLIN Micro SD Shield V1.2.0: D4 (Default)
const int chipSelect = D4;


#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
// #include <credentials.h>
#include <set>
#include <string>
#include "./functions.h"
#include "./mqtt.h"

#define disable 0
#define enable 1
#define SENDTIME 30000
#define MAXDEVICES 60
#define JBUFFER 15+ (MAXDEVICES * 40)
#define PURGETIME 60000 //was 600000  Shortened to test purge- WORKS!!!
#define MINRSSI -70

int SDOK = 1;

// uint8_t channel = 1;
unsigned int channel = 1;
int clients_known_count_old, aps_known_count_old;
unsigned long sendEntry, deleteEntry;
char jsonString[JBUFFER];// working 

String device[MAXDEVICES];
int nbrDevices = 0;
int usedChannels[15];

#ifndef CREDENTIALS  //don't need this anymore- only for initial tests
#define mySSID "*****"
#define myPASSWORD "******"
#endif

StaticJsonBuffer<JBUFFER>  jsonBuffer;

void setup() {
  //GPS Init
  ss.begin(9600); // software serial
  
  //OLED init
  u8x8.begin();
  u8x8.setPowerSave(0);
 //oled end init 
 Serial.begin(9600); //hardware serial 

//Serial from SD Example
  while (!Serial) {
    ; // wait for serial port to connect. 
  }
  Serial.print("Initializing SD card...");
  // see if the card is present and can be initialized:

  //Uncomment out this if block if you desire to STOP if there is an SD card problem 
 if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    SDOK=0; //set sd status to crud 
    // don't do anything more:
    //return;
  }
  Serial.println("card initialized.");
 
//End SD Example 

//Splash Screen
  u8x8.clear(); 
  u8x8.setFont(u8x8_font_chroma48medium8_r);
  u8x8.println("Initializing...");
  u8x8.println("");
  u8x8.println("ResQ Tool V2.1"); // YAY 2.1 works
  u8x8.println("www.mkme.org");
  
//Dont remember if this delay is needed
delay(3000); 

  wifi_set_opmode(STATION_MODE);            // Promiscuous works only with station mode
  wifi_set_channel(channel);
  wifi_promiscuous_enable(disable);
  wifi_set_promiscuous_rx_cb(promisc_cb);   // Set up promiscuous callback
  wifi_promiscuous_enable(enable);
}


void loop() {
  
 //Do display stuff right at the start- easy tracking/changing 
  u8x8.clear(); 
  u8x8.setFont(u8x8_font_chroma48medium8_r);
  u8x8.print("SD Status:");
  if (SDOK==1) {u8x8.println("OK");}
  if (SDOK==0) {u8x8.println("FAIL");}
  
  //u8x8.println("");
  u8x8.print("Clients: ");
  u8x8.println(clients_known_count);
  //u8x8.println("");
  u8x8.print("APs: ");
  u8x8.println(aps_known_count);
  u8x8.println("");
  //u8x8.print("Time:");
  u8x8.println(time_str);
  u8x8.print("Lat");
  u8x8.println(lat_str);
  u8x8.print("Lon");
  u8x8.println(lng_str);
//moved dont ask or try again
//"%4d Devices/Clients\n",aps_known_count + clients_known_count)
//u8x8.printf("%4d Devices/Clients\n",aps_known_count + clients_known_count); // show count
//u8x8.printf("%4d Devices/Clients\n",aps_known_count + clients_known_count); // show count
  
  channel = 1;
  boolean sendMQTT = false;
  wifi_set_channel(channel);
  while (true) {
    nothing_new++;                         
    if (nothing_new > 200) {                // check
      nothing_new = 0;
      channel++;
      if (channel == 15) break;             // can channels 1 to 14
      wifi_set_channel(channel);
    }
    delay(1);  // do not try to remove this

    if (clients_known_count > clients_known_count_old) {
      clients_known_count_old = clients_known_count;
      sendMQTT = true;

      //ERIC READDED BELOW FROM ORIGINAL SKETCH
       Serial.println("\n-------------------------------------------------------------------------------------\n");
      for (int u = 0; u < clients_known_count; u++) print_client(clients_known[u]);
      for (int u = 0; u < aps_known_count; u++) print_beacon(aps_known[u]);
      Serial.println("\n-------------------------------------------------------------------------------------\n");
     //ERIC READDED ABOVE FROM ORIGINAL SKETCH
    
    }
    
    if (aps_known_count > aps_known_count_old) {
      aps_known_count_old = aps_known_count;
      sendMQTT = true;
    }
    if (millis() - sendEntry > SENDTIME) {
      sendEntry = millis();
      sendMQTT = true;
    }
  }
  purgeDevice();
  if (sendMQTT) {
    showDevices();
    //sendDevices();
  }

}


void connectToWiFi() { //na anymore remove Eric to remove when he's not lazy...never
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(mySSID);

  WiFi.mode(WIFI_STA);
  WiFi.begin(mySSID, myPASSWORD);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void purgeDevice() { //off with their heads
  
  for (int u = 0; u < clients_known_count; u++) {
    if ((millis() - clients_known[u].lastDiscoveredTime) > PURGETIME) {
      Serial.print("purge Client" );
      Serial.println(u);
      for (int i = u; i < clients_known_count; i++) memcpy(&clients_known[i], &clients_known[i + 1], sizeof(clients_known[i]));
      clients_known_count--;
      break;
    }
  }
  for (int u = 0; u < aps_known_count; u++) {
    if ((millis() - aps_known[u].lastDiscoveredTime) > PURGETIME) {
      Serial.print("purge Beacon" );
      Serial.println(u);
      for (int i = u; i < aps_known_count; i++) memcpy(&aps_known[i], &aps_known[i + 1], sizeof(aps_known[i]));
      aps_known_count--;
      break;
    }
  }
}


void showDevices() {

 
  Serial.println("");
  Serial.println("");
  Serial.println("-------------------Devices Detected Currently-------------------");
  Serial.printf("%4d Devices + Clients.\n",aps_known_count + clients_known_count); // show count

  // show Beacons
  for (int u = 0; u < aps_known_count; u++) {
    Serial.printf( "%4d ",u); // Show beacon number
    Serial.print("B ");
    Serial.print(formatMac1(aps_known[u].bssid));
    Serial.print(" RSSI ");
    Serial.print(aps_known[u].rssi);
    Serial.print(" Channel ");
    Serial.println(aps_known[u].channel);


//---------------------Adding SD Write For Beacons
   File dataFile = SD.open("datalog.txt", FILE_WRITE);
   // if the file is available, write to it:
    if (dataFile) {
    dataFile.print("Beacon;");
    dataFile.print(formatMac1(aps_known[u].bssid));
    dataFile.print(";RSSI;");
    dataFile.print(aps_known[u].rssi);
    dataFile.print(";Channel;");
    dataFile.println(aps_known[u].channel);
    dataFile.close();
    Serial.println("----Beacon Written To SD ---- ");
    SDOK=1;//Flag SD card is working status
                    }
         // if the file isn't open, pop up an error:
          else {
               Serial.println("error opening datalog.txt");
               SDOK=0;// flag sd status as fail
          }
 //END Adding SD write for belnacons-------------------------------- 
   //Eric fix up sloppy SD work- its bad
  }

  // show Clients
  for (int u = 0; u < clients_known_count; u++) {
    Serial.printf("%4d ",u); // Show client number
    Serial.print("C ");
    Serial.print(formatMac1(clients_known[u].station));



    

 //---Do tha GPS thangz

  while (ss.available() > 0) //while data is available
    if (gps.encode(ss.read())) //read gps data
    {
      Serial.println("----TRIED TO READ GPS---");
    
      if (gps.location.isValid()) //check whether gps location is valid
      {
        Serial.println("--LOCATION===VALID -- ");
        latitude = gps.location.lat();
        lat_str = String(latitude , 6); // latitude location is stored in a string
        longitude = gps.location.lng();
        lng_str = String(longitude , 6); //longitude location is stored in a string
      }
      if (gps.date.isValid()) //check whether gps date is valid
      {
        date_str = "";
        date = gps.date.day();
        month = gps.date.month();
        year = gps.date.year();
        if (date < 10)
          date_str = '0';
        date_str += String(date);// values of date,month and year are stored in a string
        date_str += " / ";

        if (month < 10)
          date_str += '0';
        date_str += String(month); // values of date,month and year are stored in a string
        date_str += " / ";
        if (year < 10)
          date_str += '0';
        date_str += String(year); // values of date,month and year are stored in a string
      }
      if (gps.time.isValid())  //check whether gps time is valid
      {
        time_str = "";
        hour = gps.time.hour();
        minute = gps.time.minute();
        second = gps.time.second();
        minute = (minute + 30); // converting to IST
        if (minute > 59)
        {
          minute = minute - 60;
          hour = hour + 1;
        }
        hour = (hour + 5) ;
        if (hour > 23)
          hour = hour - 24;   // converting to IST
        if (hour >= 12)  // checking whether AM or PM
          pm = 1;
        else
          pm = 0;
        hour = hour % 12;
        if (hour < 10)
          time_str = '0';
        time_str += String(hour); //values of hour,minute and time are stored in a string
        time_str += " : ";
        if (minute < 10)
          time_str += '0';
        time_str += String(minute); //values of hour,minute and time are stored in a string
        time_str += " : ";
        if (second < 10)
          time_str += '0';
        time_str += String(second); //values of hour,minute and time are stored in a string
        if (pm == 1)
          time_str += " PM ";
        else
          time_str += " AM ";
      }
    }

  

//---------------------Adding SD Write
    //Eric Adding SD Card Write here so we gat MAC 
        File dataFile = SD.open("datalog.txt", FILE_WRITE);
        // if the file is available, write to it:
         if (dataFile) {
          dataFile.print("Time;");
          dataFile.print(time_str);
          dataFile.print(";Lat;");
          dataFile.print(lat_str);
          dataFile.print(";Lon;");
          dataFile.print(lng_str);
          dataFile.print(";Client;");
          dataFile.print(formatMac1(clients_known[u].station));
          dataFile.print(";RSSI;");
          dataFile.print(clients_known[u].rssi);
          dataFile.print(";channel;");
          dataFile.println(clients_known[u].channel);
          
          dataFile.close();
          Serial.print("----MAC Written To SD ---- "); //serial debugz
          Serial.print("Time:");
          Serial.println(time_str);
          Serial.print("Lat");
          Serial.println(lat_str);
          Serial.print("Lon");
          Serial.println(lng_str);
          SDOK=1;//Flag SD card is working status
                    }
         // if the file isn't open, pop up an error:
          else {
               Serial.println("error opening datalog.txt");
               SDOK=0; //flag SD status fail
          }
 //END Adding SD--------------------------------  
//yeah brilliant doing sd functions twice- fix it yourself as Im done :)
Serial.print(" RSSI ");
    Serial.print(clients_known[u].rssi);
    Serial.print(" channel ");
    Serial.println(clients_known[u].channel);
  }
}
