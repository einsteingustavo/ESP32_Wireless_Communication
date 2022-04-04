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
L ESP32DOIT:ESP32_DevKit_V1_DOIT U1
U 1 1 62488435
P 2150 2600
F 0 "U1" H 2150 4181 50  0000 C CNN
F 1 "ESP32_DevKit_V1_DOIT" H 2150 4090 50  0000 C CNN
F 2 "ESP32DOIT:esp32_devkit_v1_doit" H 1700 3950 50  0001 C CNN
F 3 "https://aliexpress.com/item/32864722159.html" H 1700 3950 50  0001 C CNN
	1    2150 2600
	1    0    0    -1  
$EndComp
$Comp
L RF:NRF24L01_Breakout U2
U 1 1 6248DE4A
P 5250 1450
F 0 "U2" H 5630 1496 50  0000 L CNN
F 1 "NRF24L01_Breakout" H 5630 1405 50  0000 L CNN
F 2 "nRF24L01:NRF24L01Module" H 5400 2050 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 5250 1350 50  0001 C CNN
	1    5250 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1200 2650 1200
Text GLabel 2650 1200 2    50   Input ~ 0
3v3
Wire Wire Line
	2050 1200 1650 1200
Text GLabel 1650 1200 0    50   Input ~ 0
5V
Text GLabel 5250 850  1    50   Input ~ 0
3v3
Text GLabel 5250 2050 3    50   Input ~ 0
GND
Text GLabel 2150 4000 3    50   Input ~ 0
GND
Text GLabel 2050 4000 3    50   Input ~ 0
GND
Text GLabel 2750 1800 2    50   Input ~ 0
CE
Text GLabel 2750 1900 2    50   Input ~ 0
CSN
Text GLabel 4750 1650 0    50   Input ~ 0
CE
Text GLabel 4750 1450 0    50   Input ~ 0
CSN
Text GLabel 2750 3000 2    50   Input ~ 0
MOSI
Text GLabel 2750 2700 2    50   Input ~ 0
MISO
Text GLabel 4750 1150 0    50   Input ~ 0
MOSI
Text GLabel 4750 1250 0    50   Input ~ 0
MISO
Text GLabel 4750 1350 0    50   Input ~ 0
SCK
Text GLabel 2750 2600 2    50   Input ~ 0
SCK
Text Label 7400 7500 0    50   ~ 0
ESP32_File_Sender
Text Label 8150 7650 0    50   ~ 0
02_04_2022
Text Label 10600 7650 0    50   ~ 0
1
Wire Notes Line
	3850 450  3850 4650
Wire Notes Line
	3800 2500 6700 2500
Wire Notes Line
	450  4650 6700 4650
Wire Notes Line
	6700 500  6700 4650
Text GLabel 4450 3100 0    50   Input ~ 0
12V
Text GLabel 5550 3100 2    50   Input ~ 0
5V
Text GLabel 5550 3450 2    50   Input ~ 0
GND
Text GLabel 4450 3450 0    50   Input ~ 0
GND
$Comp
L LM2596:LM2596-Baja U3
U 1 1 6249F338
P 4550 3550
F 0 "U3" H 5000 4265 50  0000 C CNN
F 1 "LM2596-Baja" H 5000 4174 50  0000 C CNN
F 2 "LM2596_MINI:LM2596" H 5000 3750 50  0001 C CNN
F 3 "" H 5000 3750 50  0001 C CNN
	1    4550 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 624A29C2
P 5050 4050
F 0 "J1" H 5078 4026 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5078 3935 50  0000 L CNN
F 2 "Connector_JST:JST_EH_S2B-EH_1x02_P2.50mm_Horizontal" H 5050 4050 50  0001 C CNN
F 3 "~" H 5050 4050 50  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
Text GLabel 4850 4050 0    50   Input ~ 0
12V
Text GLabel 4850 4150 0    50   Input ~ 0
GND
$EndSCHEMATC
