# RESQ Open Source Wifi based Search and Rescue Devices
Moving super secret source to Git for sharing on Hackaday- time to give ths project away  Show it some love with a like on Hackaday IO here: https://hackaday.io/project/172090-resq-search-and-rescue-tools

Buy a DIY kit here: https://store.mkme.org/?product_cat=custom

This open source project uses beacon packet sniffing from any commercially available aircraft/drone or manned aircraft OR by a handheld YAGI antenna unit to locate people on the ground such as lost hikers, 
campers or even poachers on game preserves etc This will work even in areas where their cellphones cannot connect to any cell tower- handy.  The aircraft dtects the AP beacon from their cellular phone, records the GPS coordinates for later ground use and transmits an alert to search teams on the ground
<p align="center">
<br>
 <img src="https://github.com/MKme/ResQ/blob/master/Photos/Laser%20Cut%20Cases/IMG_0831.jpg" width="700"/>
 <br>

<br>
<br>
🐦 <a href="https://twitter.com/mkmeorg">Twitter</a>
| 📺 <a href="https://www.youtube.com/mkmeorg">YouTube</a>
| 🌍 <a href="http://www.mkme.org">mkme.org</a><br>
Support this project and become a patron on <a href="http://mkme.org/patreon">Eric's Patreon</a>.<br>
Website, Forum and store are at http://mkme.org <br>
Chat with Me: <a href="https://discord.gg/j9S4Fgv">Discord</a></b>
</p>


# Links for more information
Hackaday Project: https://hackaday.io/project/172090-resq-open-source-search-and-rescue-tool

ResQ Tool Forum Thread For Discussion with Eric - http://mkme.org/forum/viewtopic.php?f=28&t=1130

# FULL video tutorials:

### Full playlist (all related videos/tutorials):

https://www.youtube.com/playlist?list=PLxyM2a_cfnzifVreG8aKurH-9nNYl8QLr

# Main Overview:
<img src="https://github.com/MKme/ResQ/blob/master/Reference%20Materials/Flow%20and%20Reference%20Diagrams/Main%20Sequence%20.png" width="900"/>

# System Overview 
<img src="https://github.com/MKme/ResQ/blob/master/Reference%20Materials/Flow%20and%20Reference%20Diagrams/Flow%20Diagram.png" width="500"/>

# Kanban Board- Current Status of ResQ
 
<img src="https://github.com/MKme/ResQ/blob/master/Reference%20Materials/Flow%20and%20Reference%20Diagrams/Kanban/kanban.png" width="900"/>

#  Bill of Materials 

This list is shortened for brevity - Full BOM in excel doc in BOM folder

|     Component    | Source  |
| ---------- |----------------|
|D1 Mini Pro | https://amzn.to/2ZQArbl
|Custom PCB |  https://store.mkme.org/?product_cat=custom
|D1 Mini With antenna included| https://amzn.to/2ZNQEy1
|SD Card Reader| https://amzn.to/2XPDv6B
|0.96" OLED Display| https://amzn.to/3cCHvvj
|2.4 GHz Yagi Antenna| https://amzn.to/3gwLso9
|BN220 GPS| https://amzn.to/2ZPXUJH
|SMA adapter| https://amzn.to/3ezOpT8
|LORA Modules| https://amzn.to/2zB61ze
|18650 LiOn cells | https://amzn.to/2ZSoMsz


# Wiring 
See schematic and PCB gerber files for detailed view but this is the summary
 <img src="https://github.com/MKme/ResQ/blob/master/PCB/V2.1%20KiCad%20Version/V2.1%20schematic%20as%20ordered%20.PNG" width="900"/>

### SPI SD Card to WEMOS D1  Wiring
| Pin On SD Reader | Pin on D1  |
| ---------- |----------------|
| SCK  | D5 |
| MISO| D6 |
| MOSI  | D7 |
| CS  | D8  |
|GND   | GND |
|VCC  | 3.3V ONLY!  |

### 0.96" OLED to WEMOS D1 
| Pin On OLED | Pin on D1  |
| ---------- |----------------|
| SDA  | D2 |
| SCL| D1 |
|GND   | GND |
|VCC  | 3.3V or 5V (depends on display)  |

### BN220 GPS Module
| Pin On GPS | Pin on Wemos D1  |
| ---------- |----------------|
| TX | 4 (2 in Arduino code) |
| RX | 3 (0 in Arduino code) |
|GND   | GND |
|VCC  | 3.3V |

 <img src="https://github.com/MKme/ResQ/blob/master/Photos/BN220%20Pinout%20.jpg" width="700"/>

# Enclosure/CAD Files Notes
- V1.4 Air unit case is first compatible enclusure for V1.1 PCBs/Gerbers as manufactured/supplied
- All boards and enclusures will follow version 1.XX will be compatible with all 1.XX PCBs and onward to 2.xx etc
- This project is my first made with Fusion 360 
- This was made from the awesome Adafruit Tutorial here (Thanks Noe!) https://www.youtube.com/watch?v=VVmOtM60VWw
- The box is fully parametric in Fusion so you can easily modify it as your needs/expansion or future changes to this project- HANDY!

# PCB Notes
## V1.1 
First to be manufactured (PCBWay)
- OLED is powered by 5V not 3.3V (just note in case yours is not 5V tolerant)
- OLED Wiring startes with VCC on the end then GND- Apparently almost every other OLED in the world outside my shop starts with GND then VCC
- OLED can be wired backwards as above point and burn your fingers....twice.... but still works after.... sigh....

## V2.1 
Project files done in KiCAD
- OLED is now powered 3.3V not 5V
- OLED VCC and Grnd reversed to accomodate the much more common pin layout 
-Pullup resistor added for SPI line
- Spare Signal wires now routed and dont need bodge wires if used
- Serial lines broken out for teletry transmission via LORA radio (or other UART radio module)

# Camera Expansion Module

ResQ Camera expansion module automatically captures images when target is aquired. This uses an ESP32 with camera
module. With the single GPIO I use this as an interrupt driven signal to wake the ESP from deep-sleep then begin capturing images to the SD card

The images can be used to correlate with the satellite imagery or existing aircraft FPV DVR footage.  It may be handy to have standalone images to quikly review any target detected. 

The code and enclosure files are now posted to this repo for all to use. Refer to the assembly manual for details. 

 <img src="https://github.com/MKme/ResQ/blob/master/Photos/ResQ%20Cam%20Photos/IMG_1038.jpg" width="700"/>

# ResQ Sentry

Sentry is a ResQ variant which includes the existing hardware plus the camera module inside a case which then becomes a stationary camera for monitoring human traffic in any area. Any time a new cell phone MAC address is detected- the camera module is triggered and captures still images of the area. 

 <img src="https://github.com/MKme/ResQ/blob/master/Photos/Sentry/IMG_0949.jpg" width="700"/>
 
This can be used in game preserves to catch poachers, private property surveillance, restricted areas, and many more! 

The GPS is still used to allow for accurate date/time stamps without the need for adding a real time clock. Time function will work without clear line of site to any satellites (it works indoors just fine).

2 different enclosures are provided:

- 	3D printable .stl version
-  Laser cut version (.svg files)

1. Install the ResQ hardware along with the camera in to the Sentry enclosure (camera through front hole)

2. Power the Sentry with an appropriate battery supply (5VDC to the ResQ) 

3. Add an appropriate solar charging system if desired (I bought this panel for $21 CAD) https://amzn.to/3hOA5qX

# Reviewing a Search Result Data Recording

All data is stored to the SD card while the unit is powered on. Perform your search then afterward- remove the SD card and download the contents to your PC. The file is datalog.txt 

You can manually review the hits and plot them one by one in Google Maps or your preffered map software or you can do them all at once: 

1. Download the datalog.txt file, 

2. Rename from datalog.txt to datalog.csv

3. Open in excel - Add a row above the data and within that row add the text LAT, LONG and MAC  above the corresponding columns for each (this will tell Google what each column is)

4. Delete all other columns as we wont need those

5. Upload to Google maps as done here https://www.youtube.com/watch?v=SLMzhOoA29M  NOTE: Google seems to limit the plots to 2000 entries so ensure your CSV file only has less than 2000 lines. 

Now You can then see all the MAC addresses plotted on a map- HANDY! 

<img src="https://github.com/MKme/ResQ/blob/master/Photos/MAP%20Success%208-30-2020%20Test%20.png" width="700"/>

# Reference & Press Coverage
Hackaday Article: https://hackaday.com/2020/08/12/resq-hunts-for-lost-hikers-from-the-air/

Hackaday Prize 2020 Finalist status: https://hackaday.io/contest/171491-supplyframe-designlab-2020-hackaday-prize/log/183401-2020-hackaday-prize-finalists

Hackster I.O Article: https://www.hackster.io/news/resq-aims-to-help-find-lost-hikers-by-capturing-wifi-beacon-frames-6608e10e4b22

Adafruit Article: https://blog.adafruit.com/2020/08/17/resq-hunts-for-lost-hikers-from-the-airdrone-droneday/

More videos and information at http://youtube.com/mkmeorg or http://www.mkme.org
Support this project and become a patron on <a href="http://mkme.org/patreon">Eric's Patreon</a>.<br>
Website, Forum and store are at http://mkme.org <br>
Chat with Me: <a href="https://discord.gg/j9S4Fgv">Discord</a></b>

### ResQ Components/build:

D1 mini Pro External Antenna (you need to mod the board for the external to work)  https://youtu.be/hXRcJXMjlyg

SD Card Use: https://youtu.be/y-P627KBLBw
SD Card interface: http://mkme.org/forum/viewtopic.php?f=14&t=1126&p=1430#p1430


### Drone/Aircraft Builds and Tuning:

Nano Talon Build Pt 1 https://youtu.be/BveRkukH6Sg

Nano Talon Build Pt 2 https://youtu.be/9segL9kFlmg

Nano Talon Build Pt 3 https://youtu.be/56KqzPDGRqc

Nano Talon Build Pt 4 https://youtu.be/-qZ3yurwyJo

Adding 3DR telemetry radio to the Nano Talon for autonymous flight control https://youtu.be/XCQz9AeE2qA

Making a DIY 18650 2S1P battery pack for >1hr duration flight missions https://youtu.be/XwAqgR_XsYw

### Attribution

This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
https://creativecommons.org/licenses/by-nc/4.0/
See notes.h and comments in main code for detailed lineage/license info

Credit M. Ray Burnette for publication as WiFi Sniffer 20161013 (MIT) 
Source https://www.hackster.io/rayburne/esp8266-mini-sniff-f6b93a  
Ray's example helped this whole project by providing a base to work and expand from.  Ray your code caused me to pull my hair out and jump for joy many many nights. You rock. I apologise for the current mess that once resembled some of your code :) 

Credit to Andreas Spiess for inspiring all of us to use ESP8266 boards more in our projects (Andreas=father of all ESP projects) : https://www.youtube.com/channel/UCu7_D0o48KbfhpEohoP7YSQ


