/*

 Moving to Git HUUUUUUUUUUUUUUGE effaround as OLED and SPI wont work together
 traced back to Adafruit libs and possibly RAM issue
 Switched to u8x8 lib WORKS!
 FINALLY displaying active APs and clients on OLED but this is VERY unstable.  2 uploads have caused gibberish serial output- slowed down to 57600 to test if related. 

 
  
  Erics NOTE: USE THIS IDE 1.8.8 -----------------------
  ^^^^^^^^^^^^^^^^^^^^^^^ Pay attention
  USE THIS PubClient lib- ONLY ONE THAT WORKS!!! https://github.com/heman4t/Arduino-pubsubclient
VIDEO: https://www.youtube.com/watch?v=fmhjtzmLrg8 explains why apple devices not connected keep spamming new MAC's
Channel -2 in serial is what m iphone beacons on when not connected- Maybe minus channels are non connected?
Add sound buzzer- sweeps higher pitch as more clients found
  
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

 

  This software is based on the work of Ray Burnette: https://www.hackster.io/rayburne/esp8266-mini-sniff-f6b93a
  AND
  Human detector by Andreas Spiess
*/


//Adding OLED Functions ERIC
#include <Arduino.h>
#include <U8x8lib.h>
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
U8X8_SSD1306_128X64_NONAME_SW_I2C u8x8(/* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);   // OLEDs without Reset of the Display
//End OLED add for this section ERIC


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

// uint8_t channel = 1;
unsigned int channel = 1;
int clients_known_count_old, aps_known_count_old;
unsigned long sendEntry, deleteEntry;
char jsonString[JBUFFER];


String device[MAXDEVICES];
int nbrDevices = 0;
int usedChannels[15];

#ifndef CREDENTIALS
#define mySSID "*****"
#define myPASSWORD "******"
#endif

StaticJsonBuffer<JBUFFER>  jsonBuffer;



void setup() {
  //OLED init
  u8x8.begin();
  u8x8.setPowerSave(0);
 //oled end init 
  
  Serial.begin(57600);
  Serial.println(F("Based on the work of Andreas Spiess and..."));
  Serial.println(F("Based on the work of Ray Burnette http://www.hackster.io/rayburne/projects"));

//Serial from SD Example
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }
  Serial.print("Initializing SD card...");
  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    return;
  }
  Serial.println("card initialized.");
//End SD Example 

//Splash Screen
  u8x8.clear(); 
  u8x8.setFont(u8x8_font_chroma48medium8_r);
  u8x8.println("Initializing...");
  u8x8.println("");
  u8x8.println("ResQ Tool V1.0");
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
  u8x8.clear(); 

  u8x8.setFont(u8x8_font_chroma48medium8_r);
  u8x8.println("Active:");
  u8x8.println("");
  u8x8.print("Clients: ");
  u8x8.println(clients_known_count);
  u8x8.println("");
    u8x8.print("APs: ");
  u8x8.println(aps_known_count);
 //"%4d Devices/Clients\n",aps_known_count + clients_known_count)
//u8x8.printf("%4d Devices/Clients\n",aps_known_count + clients_known_count); // show count
//u8x8.printf("%4d Devices/Clients\n",aps_known_count + clients_known_count); // show count

  
  channel = 1;
  boolean sendMQTT = false;
  wifi_set_channel(channel);
  while (true) {
    nothing_new++;                          // Array is not finite, check bounds and adjust if required
    if (nothing_new > 200) {                // monitor channel for 200 ms
      nothing_new = 0;
      channel++;
      if (channel == 15) break;             // Only scan channels 1 to 14
      wifi_set_channel(channel);
    }
    delay(1);  // critical processing timeslice for NONOS SDK! No delay(0) yield()

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


void connectToWiFi() {
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

void purgeDevice() {
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
                    }
         // if the file isn't open, pop up an error:
          else {
               Serial.println("error opening datalog.txt");
          }
 //END Adding SD write for belnacons-------------------------------- 
   
  }

  // show Clients
  for (int u = 0; u < clients_known_count; u++) {
    Serial.printf("%4d ",u); // Show client number
    Serial.print("C ");
    Serial.print(formatMac1(clients_known[u].station));

//---------------------Adding SD Write
    //Eric Adding SD Card Write here so we gat MAC 
        File dataFile = SD.open("datalog.txt", FILE_WRITE);
        // if the file is available, write to it:
         if (dataFile) {
          dataFile.print("Client;");
          dataFile.print(formatMac1(clients_known[u].station));
          dataFile.print(";RSSI;");
          dataFile.print(clients_known[u].rssi);
          dataFile.print(";channel;");
          dataFile.println(clients_known[u].channel);
          dataFile.close();
          Serial.print("----MAC Written To SD ---- ");
                    }
         // if the file isn't open, pop up an error:
          else {
               Serial.println("error opening datalog.txt");
          }
 //END Adding SD--------------------------------  

Serial.print(" RSSI ");
    Serial.print(clients_known[u].rssi);
    Serial.print(" channel ");
    Serial.println(clients_known[u].channel);
  }
}
