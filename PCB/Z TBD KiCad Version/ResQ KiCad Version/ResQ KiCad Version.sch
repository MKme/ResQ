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
P 9100 5100
F 0 "J?" H 9128 5076 50  0000 L CNN
F 1 "SD Card" H 9128 4985 50  0000 L CNN
F 2 "" H 9100 5100 50  0001 C CNN
F 3 "~" H 9100 5100 50  0001 C CNN
	1    9100 5100
	1    0    0    -1  
$EndComp
Text GLabel 8900 5000 0    50   Input ~ 0
CS
Text GLabel 8900 5100 0    50   Input ~ 0
MOSI
Text GLabel 8900 5300 0    50   Input ~ 0
MISO
Text GLabel 8900 5200 0    50   Input ~ 0
CLK
Text GLabel 8200 5100 2    50   Input ~ 0
SDA
Text GLabel 8200 5000 2    50   Input ~ 0
SCL
Text GLabel 8900 4900 0    50   Input ~ 0
3V3
Text GLabel 8900 5400 0    50   Input ~ 0
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
Text GLabel 8900 4650 0    50   Input ~ 0
SDA
Text GLabel 8900 4550 0    50   Input ~ 0
SCL
Text GLabel 7900 4400 1    50   Input ~ 0
3V3
Text GLabel 8900 5650 0    50   Input ~ 0
GND
Text GLabel 9850 4600 0    50   Input ~ 0
A0
Text GLabel 8900 5950 0    50   Input ~ 0
3V3
Text GLabel 9850 4850 0    50   Input ~ 0
3V3
Text GLabel 8900 4350 0    50   Input ~ 0
3V3
Text GLabel 8900 4450 0    50   Input ~ 0
GND
Text GLabel 8900 5750 0    50   Input ~ 0
D4
Text GLabel 8200 5300 2    50   Input ~ 0
D4
Text GLabel 8200 5200 2    50   Input ~ 0
D3
Text GLabel 8900 5850 0    50   Input ~ 0
D3
Wire Wire Line
	7600 4500 7600 4350
Connection ~ 7600 4500
Wire Wire Line
	7600 4500 7700 4500
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
P 9100 4450
F 0 "J?" H 9128 4426 50  0000 L CNN
F 1 "OLED" H 9128 4335 50  0000 L CNN
F 2 "" H 9100 4450 50  0001 C CNN
F 3 "~" H 9100 4450 50  0001 C CNN
	1    9100 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F321884
P 9100 5750
F 0 "J?" H 9128 5726 50  0000 L CNN
F 1 "GPS" H 9128 5635 50  0000 L CNN
F 2 "" H 9100 5750 50  0001 C CNN
F 3 "~" H 9100 5750 50  0001 C CNN
	1    9100 5750
	1    0    0    -1  
$EndComp
Text GLabel 9850 4500 0    50   Input ~ 0
GND
Text GLabel 9850 4400 0    50   Input ~ 0
3V3
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F3230C4
P 10050 4500
F 0 "J?" H 10078 4526 50  0000 L CNN
F 1 "Spare 2" H 10078 4435 50  0000 L CNN
F 2 "" H 10050 4500 50  0001 C CNN
F 3 "~" H 10050 4500 50  0001 C CNN
	1    10050 4500
	1    0    0    -1  
$EndComp
NoConn ~ 7400 4900
NoConn ~ 7400 5200
NoConn ~ 7400 5300
Text GLabel 7600 4350 1    50   Input ~ 0
5V
Wire Wire Line
	7900 4400 7900 4500
Wire Wire Line
	7300 4500 7600 4500
$Comp
L Device:Battery BT?
U 1 1 5F31A8A9
P 7100 4500
F 0 "BT?" H 7208 4546 50  0000 L CNN
F 1 "5V" H 7208 4455 50  0000 L CNN
F 2 "" V 7100 4560 50  0001 C CNN
F 3 "~" V 7100 4560 50  0001 C CNN
	1    7100 4500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F34EF30
P 6700 4500
F 0 "#PWR?" H 6700 4250 50  0001 C CNN
F 1 "GND" H 6705 4327 50  0000 C CNN
F 2 "" H 6700 4500 50  0001 C CNN
F 3 "" H 6700 4500 50  0001 C CNN
	1    6700 4500
	1    0    0    -1  
$EndComp
Text GLabel 6700 4500 0    50   Input ~ 0
GND
Wire Wire Line
	6900 4500 6700 4500
Text GLabel 9850 4950 0    50   Input ~ 0
GND
Text GLabel 9850 5050 0    50   Input ~ 0
D0
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F322635
P 10050 4950
F 0 "J?" H 10078 4976 50  0000 L CNN
F 1 "Spare 1" H 10078 4885 50  0000 L CNN
F 2 "" H 10050 4950 50  0001 C CNN
F 3 "~" H 10050 4950 50  0001 C CNN
	1    10050 4950
	1    0    0    -1  
$EndComp
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
$EndSCHEMATC
