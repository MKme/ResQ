# PCB and Schematics Guide 

### Welcome to Erics land of Printed Circuit Boards where everyone leaves with a shiny new project board or schematic! 

 <img src="https://github.com/MKme/ResQ/blob/master/Photos/Schematic/Schematic%20V2.1%20fixed%20%20Color.PNG" width="900"/>

Here we have a variety of selections for your ResQ build.  

# PCB History

## V1.1 
First to be manufactured (PCBWay)
- OLED is powered by 5V not 3.3V (just note in case yours is not 5V tolerant)
- OLED Wiring startes with VCC on the end then GND- Apparently almost every other OLED in the world outside my shop starts with GND then VCC
- OLED can be wired backwards as above point and burn your fingers....twice.... but still works after.... sigh....
- Extra unused I/O is broken out (you have to add jumper wires for signal if you want to add anything) but not routed- they are fully functional in V2 and beyond

## V2.1 
Project files done in KiCAD
- OLED is now powered 3.3V not 5V
- OLED VCC and Grnd reversed to accomodate the much more common pin layout 
-Pullup resistor added for SPI line
- Spare Signal wires now routed and dont need bodge wires if used
- Serial lines broken out for teletry transmission via LORA radio (or other UART radio module)
- Ordered from PCBWay Sept 6th 2020 

### TIPS- 

-  I have the PCBs avaialble on my website here: http://store.mkme.org/product-category/custom/
-  You can also make your own PCB under $10 at PCBWay, JLCPCB or other board house of your choice!  Just upload the gerbers I have provuided here and you are all set!



## Enclosure/CAD Files Notes

V1.4 Air unit case is first compatible enclusure for V1.1 PCBs/Gerbers as manufactured/supplied

All boards and enclusures will follow version 1.XX will be compatible with all 1.XX PCBs and onward to 2.xx etc

