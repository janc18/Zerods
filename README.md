# Master debug Raspberry Pi

Hello everyone, this project comes with the idea when, i have to use a laptop every day to go to a place
just to program a microcontroller using the Arduino IDE, but one thing that tires me is having to carry 
the case of my laptop with my Lenovo 14 "and accessories, this problem can be fixed by just using a more ergonomic laptop sleeve, or using a backpack **but** this project may have more important features when finished like: 
- More battery life compared to a netbook or laptop of mid-range
- Versatility
- Low space consumption
- Modular capabilies
- With the FPGA you can have a lot of peripherials 
- Cheap to make
- New keyboard design

## Principal list of components

- Raspberry Pi Zero
- Mi Powerbank 3
- TFT screen 4,3"
- EP4CE6E22C8N FPGA Development Board


## Software

To make the OS, will be based in ArchArm without desktop environment to keep a responsive time and save resorces of Raspberry pi, the OS will come with all depencies and packages to start to programming and debug, with some scripts precharged, like: reading voltage, reading stream data(USART,I²c,SPI), and signal generator using the FPGA

## Hardware

At the hardware level will contain
- HUB interface to connect microcontrollers, USB sticks, keyboard, etc. (with its own power rail because some devices can consume more current)
- GPIO protection for Raspberry pi (overvoltage, overcurrent, fuses, etc.)
- Keyboard with some kind of microcontroller with HID
- In this case, I think the power bank has good features that you can see [here](https://www.mi.com/global/10000mAh-mi-18w-fast-charge-power-bank-3)
- A Step-up DC-DC to supply the screen (12v), the screen is a common TFT LCD that has two composite video inputs
All of this will come on a custom PCB

## And to put all this together

**A 3D printed case**

Modularity comes with these two main parts
1. Core (Raspberry pi, screen, power suply and FPGA)
2. Interface (It can be a keyboard or custom keyboard(you will see the design later), Controller with analog sticks, sockets for connecting signals.
