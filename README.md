# ESP32_Wireless_Communication
This project aims to make it possible to send a 500Kb file over a distance of 100m, through a completely wireless system. For these purposes, an ESP32 microcontroller, an LM2596 switching power supply and an nRF24L01 radio frequency module were chosen (The choices were made through decision matrices available in this repository). The software is generic, so it is only necessary to modify a "#define" at the beginning of the code to switch between transmitter and receiver. After loading the software, the system works as follows: Each PCB is powered by a 12~24V battery at a distance of 100m from each other. For the file to be available on the transmitter, just connect your smartphone or laptop via bluetooth and send the file, as soon as the ESP32 recognizes that a file has arrived, it sends it via radio to the receiver, which will update the data whenever there is a new reception, and if any device is connected, the receiver sends the file via bluetooth. This project does not include an Android application specifically for sending files, although the idea is to always send the file as a string, with the first byte always referring to the file format, so that a proper conversion can happen on the other side.
