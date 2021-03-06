# PCB and Schematics Guide 

### Welcome to Erics land of Printed Circuit Boards where everyone leaves with a shiny new project board or schematic! 

 <img src="https://github.com/MKme/ResQ/blob/master/PCB/V2.1%20KiCad%20Version/V2.1%20schematic%20as%20ordered%20.PNG" width="900"/>

Here we have a variety of selections for your ResQ build.  

# PCB History

## V1.1 
First to be manufactured (PCBWay)
- OLED is powered by 5V not 3.3V (just note in case yours is not 5V tolerant)
- OLED Wiring startes with VCC on the end then GND- Apparently almost every other OLED in the world outside my shop starts with GND then VCC
- OLED can be wired backwards as above point and burn your fingers....twice.... but still works after.... sigh....
- Extra unused I/O is broken out (you have to add jumper wires for signal if you want to add anything) but not routed- they are fully functional in V2 and beyond
<img src="https://github.com/MKme/ResQ/blob/master/PCB/V1.1%20PCB%20Files%20and%20Gerbers/ResQ%20PCB%20V1.1%20Routing%20PCB%202%20%20_pcb.png" width="500"/>

## V2.1 
Project files done in KiCAD and provided here for you!
- OLED is now powered 3.3V not 5V
- OLED VCC and Grnd reversed to accomodate the much more common pin layout 
- Pullup resistor added for SPI line
- Spare Signal wires now routed and dont need bodge wires if used
- Support for external camera expansion module added
- Serial lines broken out for teletry transmission via LORA radio (or other UART radio module)
- Ordered from PCBWay Sept 6th 2020 
<img src="https://github.com/MKme/ResQ/blob/master/PCB/V2.1%20KiCad%20Version/PCB%20Final%20in%20KiCad.PNG" width="900"/>

## V2.2

- Nothing yet and hopefully don't need it :)

## TIPS- 

-  I have the PCBs avaialble on my website here: http://store.mkme.org/product-category/custom/
-  You can also make your own PCB under $10 at PCBWay, JLCPCB, OSHPark or other board house of your choice!  Just upload the Gerbers I have provided here and you are all set!



## Notes and Handy Informationz

V1.4 Air unit case is first compatible enclusure for V1.1 PCBs/Gerbers as manufactured/supplied

All boards and enclusures will follow version 1.XX will be compatible with all 1.XX PCBs and onward to 2.xx etc

