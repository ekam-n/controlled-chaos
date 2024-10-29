# Controlled Chaos

## Overview
Controlled Chaos is an innovative group project developed by a team of four, featuring an Arduino-based remote-controlled (RC) car. This project combines hardware and software components to create an engaging interactive experience, where users can control the car using a PS5 controller and participate in a time trial game that integrates quizzes.

## Features
- **RC Car Control**: The car is equipped with an Arduino board, Bluetooth module, and DC motors, enabling smooth and responsive control via a PS5 controller.
- **Time Trial Game**: Users navigate the car around a custom track, where completion of each lap triggers an infrared sensor.
- **Interactive Quiz**: Each lap completion activates an electronic quiz displayed on a connected laptop, making the gameplay more engaging.
- **Touch Sensors**: Players can answer quiz questions using touch sensors, enhancing interactivity.

## Technical Details
- **Hardware**:
  - Arduino Board
  - Bluetooth Module
  - DC Motors
  - Infrared Sensor
  - Touch Sensors
  - PS5 Controller

- **Software**:
  - The RC car connects to the PS5 controller using the [USB Host Shield 2.0 library](https://github.com/felis/USB_Host_Shield_2.0).
  - Game logic, infrared sensor logic, and touch sensor integration were implemented to create a cohesive gaming experience.

**Note**: The code posted here is not usable without the attached hardware (Arduinos and sensors). It is shared solely to display the code.

## My Role
In this project, I was responsible for the majority of the technical aspects, which included:
- Coding the connection logic between the RC car and the PS5 controller.
- Coding the PS5 controller to car-motors logic
- Implementing the logic for the infrared sensor and touch sensors.
- Developing part of the game logic to ensure a seamless gameplay experience.

## Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/ControlledChaos.git
