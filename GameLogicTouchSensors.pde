import processing.serial.*;
Serial port;

PFont arial;  //Create a font object to display text

long previousMillis = 0;

static long interval = 100;

long currentMillis = millis();

//input sensor values
int valP_ir;
int val_touchRED;
int val_touchBLUE;
int val_touchYELLOW;
int val_touchGREEN;

//value for infrared sensor
int detected = 0;
int gameTimer = 1000;

byte[] inBuffer = new byte[1023];

void setup() {
  size(1000, 700); //size of window
  arial = loadFont("ArialMT-24.vlw"); //font
  //println(Serial.list());
  port = new Serial(this, "/dev/cu.usbserial-10", 9600); //set port
}


void draw() {

  if (0 < port.available() && (currentMillis - previousMillis < interval)) { // If data is available to read,
    port.readBytesUntil('&', inBuffer);  //read in all data until '&' is encountered

    if (inBuffer != null) {
      String myString = new String(inBuffer);


      //p is all sensor data (with a's and b's) ('&' is eliminated)
      String[] p = splitTokens(myString, "&");
      println(p);
      if (p.length < 2) return;  //exit this function if packet is broken

      //get ir reading
      // Handle the data
      String[] ir = splitTokens(p[0], "e");
      int valP_ir = int(ir[1]);

      if (valP_ir == 1) {
        
        detected = 1;
        //delay(1000); 
      }

      //else detected = 0;

      //get touch readings
      String[] touch_sensorRED = splitTokens(p[0], "a");
      val_touchRED= int(touch_sensorRED[1]);
      //println("RED " + val_touchRED);


      String[] touch_sensorBLUE = splitTokens(p[0], "b");
      val_touchBLUE= int(touch_sensorBLUE[1]);
      //print("BLUE " + val_touchBLUE);

      String[] touch_sensorYELLOW = splitTokens(p[0], "c");
      val_touchYELLOW= int(touch_sensorYELLOW[1]);
      //print("YELLOW " + val_touchYELLOW);

      String[] touch_sensorGREEN = splitTokens(p[0], "d");
      val_touchGREEN= int(touch_sensorGREEN[1]);
      //print("GREEN " + touch_sensorGREEN);

      background(255); //Clear background
      fill(0);
      stroke(0);

      ////direction arrow - joy stick
      //pushMatrix();
      //translate(850, 550);
      //rotate(radians(0)); // add rotation here
      //stroke(0);
      //strokeWeight(1);
      //noFill();
      //circle(0, 0, 200);
      //noStroke();
      //fill(255, 0, 0);
      //rect(-10, -50, 20, 100);
      //triangle(-30, -50, 30, -50, 0, -90);
      //fill(0);
      //circle(0, 0, 15);
      //popMatrix();

      //touch sensor
      
      textSize(45);
      text(millis()/60000+":"+(millis()%60000)/1000,800,600);
      
      //port.write(2);


      if (detected == 0) {
        
        

        noFill();

        rect(50, 50, 600, 350);

        pushMatrix();
        translate(50, 450);
        rotate(radians(0)); // add rotation here
        stroke(0);
        strokeWeight(1);
        noFill();
        rect(0, 0, 600, 200);
        noStroke();
        fill(255, 0, 0);
        if (val_touchRED==0) {
          
          fill(255, 0, 0);
          
        }
        else fill(0);
        rect(40, 50, 100, 100);
        if (val_touchBLUE==0) {
          
          fill(255, 0, 0);
          port.write('2');
          
        }
        else fill(0);
        rect(180, 50, 100, 100);
        if (val_touchYELLOW==0) fill(255, 0, 0);
        else fill(0);
        rect(320, 50, 100, 100);
        if (val_touchGREEN==0) fill(255, 0, 0);
        else fill(0);
        rect(460, 50, 100, 100);
        popMatrix();

        //infrared sensor
        pushMatrix();
        translate(650, 150);
        
        fill(0,255,0);
        text("No Obstacle",60,0);
        text("Detected",90,40);
        
        //stroke(0);
        //strokeWeight(1);
        //if (valP_ir == 1) {
        //  fill(255);
        //} else {
        //  fill(0, 0, 0);
        //}
        //circle(0, 0, 200);
        popMatrix();

        // Scoreboard

        fill(0);
        textSize(30);
        text("HIGHEST SCORES:", 80, 100);

        text("1) Lightning", 100, 150);
        text("2:14", 550, 150);

        text("2) Francesco", 100, 190);
        text("2:31", 550, 190);

        text("3) Cruz", 100, 230);
        text("2:40", 550, 230);

        text("4) Mater", 100, 270);
        text("3:01", 550, 270);

        text("5) Jackson", 100, 310);
        text("3:03", 550, 310);
      } else {

        //challenge
        pushMatrix();
        
        fill(255,0,0);
        text("OBSTACLE DETECTED!",250,100);
        
        stroke(0);
        strokeWeight(1);
        noFill();
        rect(100, 150, 800, 250);
        fill(0);
        if (detected == 1) {
          
          //cancel function to motors??
          
          textFont(arial);
          textSize(40);
          text("Follow the pattern on the touch pads", 190, 190);

          fill(0, 255, 0);
          text("RED", 180, 290);

          fill(230, 200, 0);
          text("BLUE", 330, 290);

          fill(0, 0, 255);
          text("YELLOW", 480, 290);

          fill(255, 0, 0);
          text("GREEN", 690, 290);
          //have timer so players can read instructions
          //timer in between fills to flash the diff colours
          //final text / fill box to let the players do it

          pushMatrix();
          translate(50, 450);
          rotate(radians(0)); // add rotation here
          stroke(0);
          strokeWeight(1);
          noFill();
          rect(0, 0, 600, 200);
          noStroke();
          fill(255, 0, 0);
          if (val_touchRED==0) fill(255, 0, 0);
          else fill(0);
          rect(40, 50, 100, 100);
          if (val_touchBLUE==0) fill(255, 0, 0);
          else fill(0);
          rect(180, 50, 100, 100);
          if (val_touchYELLOW==0) fill(255, 0, 0);
          else fill(0);
          rect(320, 50, 100, 100);
          if (val_touchGREEN==0) {
            
            fill(255, 0, 0); 
            detected = 0;
            //port.write(2);
            //valP_ir = 0;
            //port.write('\n');
            //println(port.read());
            //delay(100);
            
          }
          else fill(0);
          rect(460, 50, 100, 100);
          
          popMatrix();
        }
        popMatrix();
      }
    }
  }
}
