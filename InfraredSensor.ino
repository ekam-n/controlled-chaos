int redSensor = 11;
int blueSensor = 10;
int yellowSensor = 9;
int greenSensor = 8;

int irSensor = 6;

int sensingRED;
int sensingBLUE;
int sensingYELLOW;
int sensingGREEN;

int irValue = 0;

int LED = 13;

void setup() {
  //pinMode(led, OUTPUT);
  Serial.begin(9600);  // Start serial communication at 9600 bps

  pinMode(LED,13);

}


void loop() {

  // Serial.print("print");
   
  sensingRED = digitalRead(redSensor);
  sensingBLUE = digitalRead(blueSensor);
  sensingYELLOW = digitalRead(yellowSensor);
  sensingGREEN = digitalRead(greenSensor);

  // irValue = digitalRead(irSensor);

  if (digitalRead(irSensor) == HIGH) irValue = 0;
  else irValue = 1;

  Serial.print("a");  //character 'a' will delimit the reading from the light sensor
  Serial.print(sensingRED);
  Serial.print("a");
  Serial.println();

  Serial.print("b");  //character 'a' will delimit the reading from the light sensor
  Serial.print(sensingBLUE);
  Serial.print("b");
  Serial.println();

  Serial.print("c");  //character 'a' will delimit the reading from the light sensor
  Serial.print(sensingYELLOW);
  Serial.print("c");
  Serial.println();

  Serial.print("d");  //character 'a' will delimit the reading from the light sensor
  Serial.print(sensingGREEN);
  Serial.print("d");
  Serial.println();

  Serial.print("e");  //character 'a' will delimit the reading from the light sensor
  Serial.print(irValue);
  Serial.print("e");
  Serial.println();


  Serial.print("&");
  Serial.println();

  if (irValue == 1) digitalWrite(LED, HIGH);
  else digitalWrite(LED, LOW);

  delay(100);

}