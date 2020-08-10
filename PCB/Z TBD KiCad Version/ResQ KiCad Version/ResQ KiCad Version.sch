EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5F31DE3A
P 9050 5400
F 0 "J?" H 9078 5376 50  0000 L CNN
F 1 "SD Card" H 9078 5285 50  0000 L CNN
F 2 "" H 9050 5400 50  0001 C CNN
F 3 "~" H 9050 5400 50  0001 C CNN
	1    9050 5400
	1    0    0    -1  
$EndComp
Text GLabel 8850 5300 0    50   Input ~ 0
CS
Text GLabel 8850 5400 0    50   Input ~ 0
MOSI
Text GLabel 8850 5600 0    50   Input ~ 0
MISO
Text GLabel 8850 5500 0    50   Input ~ 0
CLK
Text GLabel 8200 5100 2    50   Input ~ 0
SDA
Text GLabel 8200 5000 2    50   Input ~ 0
SCL
Text GLabel 8850 5200 0    50   Input ~ 0
3V3
Text GLabel 8850 5700 0    50   Input ~ 0
GND
Text GLabel 8200 4900 2    50   Input ~ 0
D0
Text GLabel 8200 4800 2    50   Input ~ 0
A0
Text GLabel 8200 5700 2    50   Input ~ 0
CS
Text GLabel 8200 5600 2    50   Input ~ 0
MOSI
Text GLabel 8200 5500 2    50   Input ~ 0
MISO
Text GLabel 8200 5400 2    50   Input ~ 0
CLK
Text GLabel 8850 4950 0    50   Input ~ 0
SDA
Text GLabel 8850 4850 0    50   Input ~ 0
SCL
Text GLabel 7900 4400 1    50   Input ~ 0
3V3
Text GLabel 8850 5950 0    50   Input ~ 0
GND
Text GLabel 8850 6250 0    50   Input ~ 0
3V3
Text GLabel 8850 4650 0    50   Input ~ 0
3V3
Text GLabel 8850 4750 0    50   Input ~ 0
GND
Text GLabel 8850 6050 0    50   Input ~ 0
D4
Text GLabel 8200 5300 2    50   Input ~ 0
D4
Text GLabel 8200 5200 2    50   Input ~ 0
D3
Text GLabel 8850 6150 0    50   Input ~ 0
D3
$Comp
L power:GND #PWR?
U 1 1 5F34FDAC
P 7800 6100
F 0 "#PWR?" H 7800 5850 50  0001 C CNN
F 1 "GND" H 7805 5927 50  0000 C CNN
F 2 "" H 7800 6100 50  0001 C CNN
F 3 "" H 7800 6100 50  0001 C CNN
	1    7800 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F31F299
P 9050 4750
F 0 "J?" H 9078 4726 50  0000 L CNN
F 1 "OLED" H 9078 4635 50  0000 L CNN
F 2 "" H 9050 4750 50  0001 C CNN
F 3 "~" H 9050 4750 50  0001 C CNN
	1    9050 4750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F321884
P 9050 6050
F 0 "J?" H 9078 6026 50  0000 L CNN
F 1 "GPS" H 9078 5935 50  0000 L CNN
F 2 "" H 9050 6050 50  0001 C CNN
F 3 "~" H 9050 6050 50  0001 C CNN
	1    9050 6050
	1    0    0    -1  
$EndComp
NoConn ~ 7400 4900
NoConn ~ 7400 5200
NoConn ~ 7400 5300
Wire Wire Line
	7900 4400 7900 4500
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F322635
P 6750 5500
F 0 "J?" H 6778 5526 50  0000 L CNN
F 1 "Spare 1" H 6778 5435 50  0000 L CNN
F 2 "" H 6750 5500 50  0001 C CNN
F 3 "~" H 6750 5500 50  0001 C CNN
	1    6750 5500
	1    0    0    -1  
$EndComp
Text GLabel 6550 5600 0    50   Input ~ 0
D0
Text GLabel 6550 5500 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F3230C4
P 6750 5150
F 0 "J?" H 6778 5176 50  0000 L CNN
F 1 "Spare 2" H 6778 5085 50  0000 L CNN
F 2 "" H 6750 5150 50  0001 C CNN
F 3 "~" H 6750 5150 50  0001 C CNN
	1    6750 5150
	1    0    0    -1  
$EndComp
Text GLabel 6550 5050 0    50   Input ~ 0
3V3
Text GLabel 6550 5150 0    50   Input ~ 0
GND
Text GLabel 6550 5400 0    50   Input ~ 0
3V3
Text GLabel 6550 5250 0    50   Input ~ 0
A0
Wire Wire Line
	6700 4350 6650 4350
Text GLabel 6650 4400 3    50   Input ~ 0
GND
$Comp
L power:GND #PWR?
U 1 1 5F34EF30
P 6500 4350
F 0 "#PWR?" H 6500 4100 50  0001 C CNN
F 1 "GND" V 6505 4222 50  0000 R CNN
F 2 "" H 6500 4350 50  0001 C CNN
F 3 "" H 6500 4350 50  0001 C CNN
	1    6500 4350
	0    1    1    0   
$EndComp
$Comp
L Device:Battery BT?
U 1 1 5F31A8A9
P 6900 4350
F 0 "BT?" H 7008 4396 50  0000 L CNN
F 1 "5V" H 7008 4305 50  0000 L CNN
F 2 "" V 6900 4410 50  0001 C CNN
F 3 "~" V 6900 4410 50  0001 C CNN
	1    6900 4350
	0    1    1    0   
$EndComp
Text GLabel 7700 4500 1    50   Input ~ 0
5V
$Comp
L MCU_Module:WeMos_D1_mini U?
U 1 1 5F31691B
P 7800 5300
F 0 "U?" H 7400 4650 50  0000 C CNN
F 1 "WeMos_D1_mini" H 7400 4550 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 7800 4150 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 5950 4150 50  0001 C CNN
	1    7800 5300
	1    0    0    -1  
$EndComp
Text GLabel 7100 4350 1    50   Input ~ 0
5V
Wire Wire Line
	6650 4350 6650 4400
Connection ~ 6650 4350
Wire Wire Line
	6650 4350 6500 4350
$EndSCHEMATC
