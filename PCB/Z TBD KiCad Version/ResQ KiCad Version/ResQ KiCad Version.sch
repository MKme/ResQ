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
L MCU_Module:WeMos_D1_mini U?
U 1 1 5F31691B
P 7250 4750
F 0 "U?" H 7250 3861 50  0000 C CNN
F 1 "WeMos_D1_mini" H 7250 3770 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 7250 3600 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 5400 3600 50  0001 C CNN
	1    7250 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT?
U 1 1 5F31A8A9
P 6900 3600
F 0 "BT?" H 7008 3646 50  0000 L CNN
F 1 "5V" H 7008 3555 50  0000 L CNN
F 2 "" V 6900 3660 50  0001 C CNN
F 3 "~" V 6900 3660 50  0001 C CNN
	1    6900 3600
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5F31DE3A
P 8250 4200
F 0 "J?" H 8278 4176 50  0000 L CNN
F 1 "SD Card" H 8278 4085 50  0000 L CNN
F 2 "" H 8250 4200 50  0001 C CNN
F 3 "~" H 8250 4200 50  0001 C CNN
	1    8250 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F31F299
P 8250 4800
F 0 "J?" H 8278 4776 50  0000 L CNN
F 1 "OLED" H 8278 4685 50  0000 L CNN
F 2 "" H 8250 4800 50  0001 C CNN
F 3 "~" H 8250 4800 50  0001 C CNN
	1    8250 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 5F321884
P 8250 5400
F 0 "J?" H 8278 5376 50  0000 L CNN
F 1 "GPS" H 8278 5285 50  0000 L CNN
F 2 "" H 8250 5400 50  0001 C CNN
F 3 "~" H 8250 5400 50  0001 C CNN
	1    8250 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F322635
P 9400 5400
F 0 "J?" H 9428 5426 50  0000 L CNN
F 1 "Spare 1" H 9428 5335 50  0000 L CNN
F 2 "" H 9400 5400 50  0001 C CNN
F 3 "~" H 9400 5400 50  0001 C CNN
	1    9400 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5F3230C4
P 9400 4900
F 0 "J?" H 9428 4926 50  0000 L CNN
F 1 "Spare 2" H 9428 4835 50  0000 L CNN
F 2 "" H 9400 4900 50  0001 C CNN
F 3 "~" H 9400 4900 50  0001 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3600 6750 3950
Wire Wire Line
	6750 3950 7150 3950
$Comp
L power:GND #PWR?
U 1 1 5F34EF30
P 7300 3650
F 0 "#PWR?" H 7300 3400 50  0001 C CNN
F 1 "GND" H 7305 3477 50  0000 C CNN
F 2 "" H 7300 3650 50  0001 C CNN
F 3 "" H 7300 3650 50  0001 C CNN
	1    7300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3600 7300 3600
Wire Wire Line
	7300 3600 7300 3650
$Comp
L power:GND #PWR?
U 1 1 5F34FDAC
P 6650 5700
F 0 "#PWR?" H 6650 5450 50  0001 C CNN
F 1 "GND" H 6655 5527 50  0000 C CNN
F 2 "" H 6650 5700 50  0001 C CNN
F 3 "" H 6650 5700 50  0001 C CNN
	1    6650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 5700 7250 5700
Wire Wire Line
	7250 5700 7250 5550
Text GLabel 5250 4550 0    50   Input ~ 0
CS
Text GLabel 5250 4700 0    50   Input ~ 0
MOSI
Text GLabel 5250 4850 0    50   Input ~ 0
MISO
Text GLabel 5250 5000 0    50   Input ~ 0
CLK
Text GLabel 5250 5200 0    50   Input ~ 0
SCA
Text GLabel 5250 5350 0    50   Input ~ 0
SCL
Text GLabel 5250 5500 0    50   Input ~ 0
3V3
Text GLabel 5250 5650 0    50   Input ~ 0
GND
Text GLabel 5250 5800 0    50   Input ~ 0
5V
Text GLabel 5250 5950 0    50   Input ~ 0
D0
Text GLabel 5250 6100 0    50   Input ~ 0
A0
Text GLabel 5900 4350 0    50   Input ~ 0
CS
Text GLabel 5900 4500 0    50   Input ~ 0
MOSI
Text GLabel 5900 4650 0    50   Input ~ 0
MISO
Text GLabel 5900 4800 0    50   Input ~ 0
CLK
Text GLabel 5900 5000 0    50   Input ~ 0
SCA
Text GLabel 5900 5150 0    50   Input ~ 0
SCL
Text GLabel 5900 5300 0    50   Input ~ 0
3V3
Text GLabel 5900 5450 0    50   Input ~ 0
GND
Text GLabel 5900 5600 0    50   Input ~ 0
5V
Text GLabel 5900 5750 0    50   Input ~ 0
D0
Text GLabel 5900 5900 0    50   Input ~ 0
A0
$EndSCHEMATC
