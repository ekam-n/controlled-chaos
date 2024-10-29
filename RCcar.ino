//Source Code
#include <PS5BT.h>
#include <usbhub.h>

// Satisfy the IDE, which needs to see the include statement in the ino too.
#ifdef dobogusinclude
#include <spi4teensy3.h>
#endif
#include <SPI.h> 

const int PWM_A = 3;
const int AI2  = 4;       //control pin for first motor
const int AI1 = 5;       //control pin for first motor

const int BI1 = 8;        //control pin for second motor
const int BI2 = 7;        //control pin for second motor
const int PWM_B = 6;


USB Usb;
//USBHub Hub1(&Usb); // Some dongles have a hub inside
BTD Btd(&Usb); // You have to create the Bluetooth Dongle instance like so

/* You can create the instance of the PS5BT class in two ways */
// This will start an inquiry and then pair with the PS5 controller - you only have to do this once
// You will need to hold down the PS and Share button at the same time, the PS5 controller will then start to blink rapidly indicating that it is in pairing mode
PS5BT PS5(&Btd, PAIR);

// After that you can simply create the instance like so and then press the PS button on the device
//PS5BT PS5(&Btd);

bool printAngle, printTouch;
uint8_t oldL2Value, oldR2Value;

void setup() {

  pinMode(PWM_A, OUTPUT);  
  pinMode(AI2, OUTPUT);
  pinMode(AI1, OUTPUT);  
  pinMode(BI1, OUTPUT);
  pinMode(BI2, OUTPUT);
  pinMode(PWM_B, OUTPUT);


  // Initialize motors in a stopped state
  digitalWrite(AI1, LOW);
  digitalWrite(AI2, LOW);
  analogWrite(PWM_A, 0);

  digitalWrite(BI1, LOW);
  digitalWrite(BI2, LOW);
  analogWrite(PWM_B, 0);

  Serial.begin(9600);

  #if !defined(__MIPSEL__)
    while (!Serial); // Wait for serial port to connect - used on Leonardo, Teensy and other boards with built-in USB CDC serial connection
  #endif

  if (Usb.Init() == -1) {
    Serial.print(F("\r\nOSC did not start"));
    while (1); // Halt
  }
    Serial.print(F("\r\nPS5 Bluetooth Library Started"));
}

void loop() {

  Usb.Task();

  if (PS5.connected()) {

    if (PS5.getAnalogHat(LeftHatY) > 240) {
      // move motor A forward
      digitalWrite(AI2, HIGH);
      digitalWrite(AI1, LOW);
      analogWrite(PWM_A, 255);  // Full speed

      // move motor B forward
      digitalWrite(BI2, LOW);
      digitalWrite(BI1, HIGH);
      analogWrite(PWM_B, 255);  // Full speed

      // Serial.println("Moving Backwards");

    } 
    
    else if (PS5.getAnalogHat(LeftHatY) < 10) {
      // move motor A backward
      digitalWrite(AI2, LOW);
      digitalWrite(AI1, HIGH);
      analogWrite(PWM_A, 255);  // Full speed

      // move motor B backward
      digitalWrite(BI2, HIGH);
      digitalWrite(BI1, LOW);
      analogWrite(PWM_B, 255);  // Full speed

      // Serial.println("Moving Forwards");

    } else if (PS5.getAnalogHat(LeftHatX) > 240) {
      // move motor A backward
      digitalWrite(AI2, LOW);
      digitalWrite(AI1, HIGH);
      analogWrite(PWM_A, 255);  // Full speed

      // move motor B backward
      digitalWrite(BI2, LOW);
      digitalWrite(BI1, HIGH);
      analogWrite(PWM_B, 255);  // Full speed

      // Serial.println("Turning Right");
    }

    else if (PS5.getAnalogHat(LeftHatX) < 10) {
      // move motor A backward
      digitalWrite(AI2, HIGH);
      digitalWrite(AI1, LOW);
      analogWrite(PWM_A, 255);  // Full speed

      // move motor B backward
      digitalWrite(BI2, HIGH);
      digitalWrite(BI1, LOW);
      analogWrite(PWM_B, 255);  // Full speed

      // Serial.println("Turning Left");
    }
    
    else if (PS5.getAnalogHat(LeftHatX) > 10 && PS5.getAnalogHat(LeftHatX) < 240 && PS5.getAnalogHat(LeftHatY) > 10 && PS5.getAnalogHat(LeftHatY) < 240) {
      // Stop motors
      digitalWrite(AI1, LOW);
      digitalWrite(AI2, LOW);
      analogWrite(PWM_A, 0);

      digitalWrite(BI2, LOW);
      digitalWrite(BI1, LOW);
      analogWrite(PWM_B, 0);

      // Serial.println("Stop");
    }
  }
}
