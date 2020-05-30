# RESQ Open Source Wifi based Search and Rescue Device
Moving super secret source to Git for sharing on Hackaday- time to give ths project away 


This open source project uses AP beacon packet sniffing from any commercially available aircraft/drone or manned aircraft to locate people on the ground such as lost hikers, 
campers etc. This will work even in areas where their cellphones cannot connect to any cell tower- handy.  The aircraft dtects the AP beacon from their cellular phone, records the GPS coordinates for later ground use and transmits an alert to search teams on the ground
<p align="center">
<br>
 <img src="https://github.com/MKme/ResQ/blob/master/Photos/NanoTalonprogramming.jpg" width="700"/>
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
Hackaday Project: 

ResQ Tool Forum Thread For Discussion with Eric - http://mkme.org/forum/viewtopic.php?f=28&t=1130

SD Card interface: http://mkme.org/forum/viewtopic.php?f=14&t=1126&p=1430#p1430

# FULL Video Tutorials:

### ResQ Components/build:

D1 mini Pro External Antenna (you need to mod the board for the external to work)  https://youtu.be/hXRcJXMjlyg

SD Card Use: https://youtu.be/y-P627KBLBw

### Drone/Aircraft Builds:

Nano Talon Build Pt 1 https://youtu.be/BveRkukH6Sg

Nano Talon Build Pt 2 https://youtu.be/9segL9kFlmg

Nano Talon Build Pt 3 https://youtu.be/56KqzPDGRqc

Nano Talon Build Pt 4 https://youtu.be/-qZ3yurwyJo

Adding 3DR telemetry radio to iNav RC plane https://youtu.be/XCQz9AeE2qA

# BOM:

D1 Mini Pro : https://amzn.to/2ZQArbl

With antenna included: https://amzn.to/2ZNQEy1

SD Card Reader https://amzn.to/2XPDv6B

0.96" OLED Display https://amzn.to/3cCHvvj

2.4 GHz Yagi Antenna https://amzn.to/3gwLso9

SMA adapter https://amzn.to/3ezOpT8

nrf24l01 https://amzn.to/3exhePP

LORA Modules https://amzn.to/2zB61ze

# Wiring 

### SPI SD Card to WEMOS D1 Mini Wiring
| Pin On SD Reader | Pin on D1 Mini |
| ---------- |----------------|
| SCK  | D5 |
| MISO| D6 |
| MOSI  | D7 |
| CS  | D8  |
|GND   | GND |
|VCC  | 3.3V ONLY!  |

### 0.96" OLED to WEMOS D1 Mini 
| Pin On OLED | Pin on D1 Mini |
| ---------- |----------------|
| SDA  | D2 |
| SCL| D1 |
|GND   | GND |
|VCC  | 3.3V or 5V (depends on display)  |

# Reference Material

Credit to Andreas Spiess projects here (father of all ESP projects) : https://www.youtube.com/channel/UCu7_D0o48KbfhpEohoP7YSQ

More videos and information at http://youtube.com/mkmeorg or http://www.mkme.org

Support this project and become a patron on <a href="http://mkme.org/patreon">Eric's Patreon</a>.<br>
Website, Forum and store are at http://mkme.org <br>
Chat with Me: <a href="https://discord.gg/j9S4Fgv">Discord</a></b>

