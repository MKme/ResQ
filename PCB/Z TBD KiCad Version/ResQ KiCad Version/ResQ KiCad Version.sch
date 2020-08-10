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
L Connector:Conn_01x06_Female J4
U 1 1 5F31DE3A
P 9050 5400
F 0 "J4" H 9078 5376 50  0000 L CNN
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
Text GLabel 8850 5200 0    50   Input ~ 0
3V3
Text GLabel 8850 5700 0    50   Input ~ 0
GND
Text GLabel 8250 5700 2    50   Input ~ 0
CS
Text GLabel 8250 5600 2    50   Input ~ 0
MOSI
Text GLabel 8250 5500 2    50   Input ~ 0
MISO
Text GLabel 8250 5400 2    50   Input ~ 0
CLK
Text GLabel 7950 4400 1    50   Input ~ 0
3V3
Text GLabel 8850 6050 0    50   Input ~ 0
GND
Text GLabel 8850 6350 0    50   Input ~ 0
3V3
Text GLabel 8850 6150 0    50   Input ~ 0
D4
Text GLabel 8250 5300 2    50   Input ~ 0
D4
Text GLabel 8250 5200 2    50   Input ~ 0
D3
Text GLabel 8850 6250 0    50   Input ~ 0
D3
$Comp
L power:GND #PWR02
U 1 1 5F34FDAC
P 7850 6100
F 0 "#PWR02" H 7850 5850 50  0001 C CNN
F 1 "GND" H 7855 5927 50  0000 C CNN
F 2 "" H 7850 6100 50  0001 C CNN
F 3 "" H 7850 6100 50  0001 C CNN
	1    7850 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5F321884
P 9050 6150
F 0 "J5" H 9078 6126 50  0000 L CNN
F 1 "GPS" H 9078 6035 50  0000 L CNN
F 2 "" H 9050 6150 50  0001 C CNN
F 3 "~" H 9050 6150 50  0001 C CNN
	1    9050 6150
	1    0    0    -1  
$EndComp
NoConn ~ 7450 4900
NoConn ~ 7450 5200
NoConn ~ 7450 5300
Wire Wire Line
	7950 4400 7950 4500
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5F322635
P 6800 5700
F 0 "J2" H 6828 5726 50  0000 L CNN
F 1 "Spare 1" H 6828 5635 50  0000 L CNN
F 2 "" H 6800 5700 50  0001 C CNN
F 3 "~" H 6800 5700 50  0001 C CNN
	1    6800 5700
	1    0    0    -1  
$EndComp
Text GLabel 6600 5800 0    50   Input ~ 0
D0
Text GLabel 6600 5700 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5F3230C4
P 6800 5350
F 0 "J1" H 6828 5376 50  0000 L CNN
F 1 "Spare 2" H 6828 5285 50  0000 L CNN
F 2 "" H 6800 5350 50  0001 C CNN
F 3 "~" H 6800 5350 50  0001 C CNN
	1    6800 5350
	1    0    0    -1  
$EndComp
Text GLabel 6600 5250 0    50   Input ~ 0
3V3
Text GLabel 6600 5350 0    50   Input ~ 0
GND
Text GLabel 6600 5600 0    50   Input ~ 0
3V3
Text GLabel 6600 5450 0    50   Input ~ 0
A0
Wire Wire Line
	6650 4500 6600 4500
Text GLabel 6600 4550 3    50   Input ~ 0
GND
$Comp
L power:GND #PWR01
U 1 1 5F34EF30
P 6450 4500
F 0 "#PWR01" H 6450 4250 50  0001 C CNN
F 1 "GND" V 6455 4372 50  0000 R CNN
F 2 "" H 6450 4500 50  0001 C CNN
F 3 "" H 6450 4500 50  0001 C CNN
	1    6450 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT1
U 1 1 5F31A8A9
P 6850 4500
F 0 "BT1" H 6958 4546 50  0000 L CNN
F 1 "5V" H 6958 4455 50  0000 L CNN
F 2 "" V 6850 4560 50  0001 C CNN
F 3 "~" V 6850 4560 50  0001 C CNN
	1    6850 4500
	0    1    1    0   
$EndComp
Text GLabel 7750 4350 1    50   Input ~ 0
5V
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 5F31691B
P 7850 5300
F 0 "U1" H 7450 4650 50  0000 C CNN
F 1 "WeMos_D1_mini" H 7450 4550 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 7850 4150 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 6000 4150 50  0001 C CNN
	1    7850 5300
	1    0    0    -1  
$EndComp
Text GLabel 7100 4400 1    50   Input ~ 0
5V
Wire Wire Line
	6600 4500 6600 4550
Text Notes 6350 4300 0    50   ~ 0
Vin 4-6V
Wire Wire Line
	7100 4400 7100 4500
Wire Wire Line
	7100 4500 7050 4500
Connection ~ 6600 4500
Wire Wire Line
	6450 4500 6600 4500
Wire Notes Line
	6250 4150 6250 4850
Wire Notes Line
	6250 4850 7250 4850
Wire Notes Line
	7250 4850 7250 4150
Wire Notes Line
	7250 4150 6250 4150
Text GLabel 8250 5100 2    50   Input ~ 0
SDA
Wire Notes Line
	6250 5050 6250 5900
Wire Notes Line
	6250 5900 7250 5900
Wire Notes Line
	7250 5900 7250 5050
Wire Notes Line
	7250 5050 6250 5050
Text Notes 6300 5150 0    50   ~ 0
Spare IO
Wire Notes Line
	8600 5850 9450 5850
Wire Notes Line
	9450 5050 8600 5050
Wire Notes Line
	8600 5950 8600 6500
Wire Notes Line
	8600 6500 9450 6500
Wire Notes Line
	9450 6500 9450 5950
Wire Notes Line
	9450 5950 8600 5950
Wire Notes Line
	8600 4400 8600 4950
Wire Notes Line
	9350 4400 8600 4400
Wire Notes Line
	9350 4950 9350 4400
Wire Notes Line
	8600 4950 9350 4950
Text GLabel 8250 5000 2    50   Input ~ 0
SCL
Text GLabel 8850 4850 0    50   Input ~ 0
SDA
Text GLabel 8850 4750 0    50   Input ~ 0
SCL
Text GLabel 8850 4550 0    50   Input ~ 0
3V3
Text GLabel 8850 4650 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5F31F299
P 9050 4650
F 0 "J3" H 9078 4626 50  0000 L CNN
F 1 "OLED" H 9078 4535 50  0000 L CNN
F 2 "" H 9050 4650 50  0001 C CNN
F 3 "~" H 9050 4650 50  0001 C CNN
	1    9050 4650
	1    0    0    -1  
$EndComp
Text GLabel 8250 4800 2    50   Input ~ 0
A0
Text GLabel 8250 4900 2    50   Input ~ 0
D0
Wire Notes Line
	9450 5050 9450 5850
Wire Notes Line
	8600 5050 8600 5850
Wire Wire Line
	7750 4350 7750 4500
$EndSCHEMATC
