#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"

#define SENDER // Comment this and define LISTENER for receiver code
//#define LISTENER // Comment this and define SENDER for transmitter code

BLECharacteristic *pCharacteristic;
bool deviceConnected = false, newData = false;
std::string txValue;
std::string rxValue;

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/

#define SERVICE_UUID "68ada7aa-b288-11ec-b909-0242ac120002" // UART service UUID
#define CHARACTERISTIC_UUID_RX "72ede450-b288-11ec-b909-0242ac120002"
#define CHARACTERISTIC_UUID_TX "8af3b624-b288-11ec-b909-0242ac120002"

std::string data;
RF24 radio(4, 5);
const uint64_t pipe_ = 0xE8E8F0F0E1LL;

class MyServerCallbacks : public BLEServerCallbacks // Connection callback
{
  void onConnect(BLEServer *pServer)
  {
    deviceConnected = true;
  };

  void onDisconnect(BLEServer *pServer)
  {
    deviceConnected = false;
  }
};

class MyCallbacks : public BLECharacteristicCallbacks // Data receive callback
{
  void onWrite(BLECharacteristic *pCharacteristic)
  {
    rxValue = pCharacteristic->getValue();
    data = rxValue;
    newData = true;
  }
};

void setup()
{
  Serial.begin(115200);

  /* ---- nRF24L01 radio setup begin ---- */
  radio.begin();
  radio.setChannel(23); // Frequency = (2400+channel_number)MHz
  // radio.setPayloadSize(7);  // Comment this for not limiting payload for all transmissions
  radio.setDataRate(RF24_1MBPS); // 250KBPS | 1MBPS | 2MBPS
#ifdef SENDER
  radio.openWritingPipe(pipe_);
#endif
#ifdef LISTENER
  radio.openReadingPipe(1, pipe_);
  radio.startListening();
#endif
  /* ---- nRF24L01 radio setup end ---- */

  /* -------------- Bluetooth Low Energy setup begin -------------- */
  BLEDevice::init("ESP32_FS");                    // Create the BLE Device
  BLEServer *pServer = BLEDevice::createServer(); // Create the BLE Server
  pServer->setCallbacks(new MyServerCallbacks());
  BLEService *pService = pServer->createService(SERVICE_UUID); // Create the BLE Service
  pCharacteristic = pService->createCharacteristic(            // Create a BLE Characteristic for sending
      CHARACTERISTIC_UUID_TX,
      BLECharacteristic::PROPERTY_NOTIFY);
  pCharacteristic->addDescriptor(new BLE2902());
  BLECharacteristic *pCharacteristic = pService->createCharacteristic( // Create a BLE Characteristic for receiving
      CHARACTERISTIC_UUID_RX,
      BLECharacteristic::PROPERTY_WRITE);
  pCharacteristic->setCallbacks(new MyCallbacks());
  pService->start();                  // Start the service
  pServer->getAdvertising()->start(); // Start advertising
  Serial.println("Waiting a client connection to notify...");
  /* -------------- Bluetooth Low Energy setup end -------------- */
}

void loop()
{

#ifdef SENDER
  if (deviceConnected)
  {
    if (newData)
    {
      Serial.println("Radio Sending ...");
      radio.write(&data, sizeof(data));
      newData = false;
      delay(1000);
    }
  }
#endif

#ifdef LISTENER
  if (radio.available())
  {
    Serial.println("Radio Receiving ...");
    radio.read(&data, sizeof(data));
    Serial.println(data);
    newData = true;
    delay(10);
  }
  else
  {
    Serial.println("No radio available");
  }
  if (deviceConnected)
  {
    if (newData)
    {
      txValue = data;
      pCharacteristic->setValue(txString);
      pCharacteristic->notify(); // Send the value to the app!
      newData = false;
    }
  }
#endif
}