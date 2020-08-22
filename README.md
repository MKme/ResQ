# RESQ Open Source Wifi based Search and Rescue Devices
Moving super secret source to Git for sharing on Hackaday- time to give ths project away  Show it some love with a like on Hacaday IO here: https://hackaday.io/project/172090-resq-search-and-rescue-tools


This open source project uses AP beacon packet sniffing from any commercially available aircraft/drone or manned aircraft OR by a handheld YAGI antenna unit to locate people on the ground such as lost hikers, 
campers or even poachers on game preserves etc This will work even in areas where their cellphones cannot connect to any cell tower- handy.  The aircraft dtects the AP beacon from their cellular phone, records the GPS coordinates for later ground use and transmits an alert to search teams on the ground
<p align="center">
<br>
 <img src="https://github.com/MKme/ResQ/blob/master/Photos/IMG_0349.jpg" width="700"/>
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

SD Card interface: http://mkme.org/forum/viewtopic.php?f=14&t=1126&p=1430#p1430

# FULL video tutorials:

### Full playlist (all related videos/tutorials):

https://www.youtube.com/playlist?list=PLxyM2a_cfnzifVreG8aKurH-9nNYl8QLr

### ResQ Components/build:

D1 mini Pro External Antenna (you need to mod the board for the external to work)  https://youtu.be/hXRcJXMjlyg

SD Card Use: https://youtu.be/y-P627KBLBw

### Drone/Aircraft Builds and Tuning:

Nano Talon Build Pt 1 https://youtu.be/BveRkukH6Sg

Nano Talon Build Pt 2 https://youtu.be/9segL9kFlmg

Nano Talon Build Pt 3 https://youtu.be/56KqzPDGRqc

Nano Talon Build Pt 4 https://youtu.be/-qZ3yurwyJo

Adding 3DR telemetry radio to the Nano Talon for autonymous flight control https://youtu.be/XCQz9AeE2qA

Making a DIY 18650 2S1P battery pack for >1hr duration flight missions https://youtu.be/XwAqgR_XsYw

### System Overview 
<img src="https://github.com/MKme/ResQ/blob/master/Photos/Flow%20Diagram.png" width="500"/>



### Truncated Bill of Materials (Full BOM in Folder):
|     Component    | Source  |
| ---------- |----------------|
|D1 Mini Pro | https://amzn.to/2ZQArbl
|Custom PCB |  http://store.mkme.org/product/resq-printed-circuit-board-v1-1/
|D1 Mini With antenna included| https://amzn.to/2ZNQEy1
|SD Card Reader| https://amzn.to/2XPDv6B
|0.96" OLED Display| https://amzn.to/3cCHvvj
|2.4 GHz Yagi Antenna| https://amzn.to/3gwLso9
|BN880 GPS| https://amzn.to/2ZPXUJH
|SMA adapter| https://amzn.to/3ezOpT8
|nrf24l01| https://amzn.to/3exhePP
|LORA Modules| https://amzn.to/2zB61ze
|Nano Talon PNP AMAZON|https://amzn.to/33RWkJg 
|Nano Talon PNP Bangood|https://www.banggood.com/ZOHD-Nano-Talon-860mm-Wingspan-AIO-HD-V-Tail-EPP-FPV-RC-Airplane-PNP-With-Gyro-p-1168297.html?rmmds=search&p=S808226360906201609Z&custlinkid=482321&cur_warehouse=CN
|F722 Wing Flight Controller| https://amzn.to/2ZSoMsz
|18650 LiOn cells | https://amzn.to/2ZSoMsz


# Wiring 
See schematic and PCB gerber files for detailed view but this is the summary
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
- OLED is now powered 3.3V 
- OLED VCC and Grnd reversed to accomodate the much more common pin layout 
- Spare Signal wires now routed and dont need bodge wires if used
- Serial lines broken out for teletry transmission via LORA radio (or other UART radio module)

# Camera Expansion Module (Winter 2020 ETA)

I would like to develop the expansion module to automatically capture images when target is aquired. This is planned to simply use an ESP32 with camera
module. With the single GPIO I will use this as an interrupt driven signal to wake the ESP from deep-sleep then begin capturing images to the SD card
I may do other methods but for now it makes sense in my mind to use the ESP32 due to weight and power considerations. In deep sleep this should be a simple addition
to the air unit whihc will draw virtually no powe runtil capture is needed. 

The images can be used to correlate with the satellite imagery or existing aircraft FPV DVR footage.  It may be handy to have standalone images to quikly review any target detected. 

# Reference & Press Coverage
Hackaday Article: https://hackaday.com/2020/08/12/resq-hunts-for-lost-hikers-from-the-air/

More videos and information at http://youtube.com/mkmeorg or http://www.mkme.org
Support this project and become a patron on <a href="http://mkme.org/patreon">Eric's Patreon</a>.<br>
Website, Forum and store are at http://mkme.org <br>
Chat with Me: <a href="https://discord.gg/j9S4Fgv">Discord</a></b>

Credit to Andreas Spiess projects here (father of all ESP projects) : https://www.youtube.com/channel/UCu7_D0o48KbfhpEohoP7YSQ


This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
https://creativecommons.org/licenses/by-nc/4.0/
