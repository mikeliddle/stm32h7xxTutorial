# Chapter 0: Getting Started with STM32H7

This chapter will cover getting your MCU connected to your computer, how to use this tutorial, some basics around the build tools and vs code.

## STM32H750 - Weact Studio board

In making this course, I will be using the Weact Studio STM32H750 board. They can be found for really cheap on aliexpress, and have the functionality we will cover here. The Pin mappings (like built-in LED, LCD, SD card, etc) may be slightly different on other boards, but the core ideas will be the same, and the pinout reference should clear up any confusion there.

This board doesn't come with the headers soldered on, but I recommend soldering on some headers to make it easier to connect peripherals. You will need to solder the debug headers at the top of the board to connect with the ST-Link programmer. The board has a usb-c port attached, but I was not able to get debugging working over this port. You can flash firmware to the device and power it from there, but debugging is easier with the ST-Link programmer and debug headers.

## Software Setup

Provided in this repo is a an init script which will install some of the dependencies. This will not install STM's software, which requires you to download it from their site for your platform [https://www.st.com/en/development-tools/stm32cubeclt.html](https://www.st.com/en/development-tools/stm32cubeclt.html). The main piece of software we need is the STM32CubeCLT. I used windows to build this tutorial, and did a system-wide install, so my files are located here: `C:/ST/STM32CubeCLT_1.18.0`. If you don't install system-wide, or use a different system, you'll want to update that path to match your install location. These references are all in .vscode/c_cpp_properties.json and .vscode/settings.json. This will be referenced for the build task.

## First Flash

To get started, attach the ST-Link programmer to the debug headers on the board. Make sure you align the wires properly so that 3.3V is connected to 3.3V, GND to GND, SWDIO to SWDIO, and SWCLK to SWCLK. Once you've done this, plug the usb dongle into your computer and you will see a red light illuminate on the board signalling the board has power. Open up the chapter 1 folder in vscode, configure cmake for debug (there should be a pop-up), and then run the build and debug task from the debug menu. This will build the project, flash it to the MCU, and start the debugger. You will likely see a breakpoint hit right away in main, so you'll want to hit "resume" to see the blink example execute. The expected behavior for the WeAct board is that the blue LED will blink off and on a couple times a second.

## Using The Debugger

Now is a good time to play around setting breakpoints, using the step over/into, and pause functions of the debugger and get familiar with it. You can also start modifying the code in that example to see what happens when you get a build error, or change some of the logic in there. Restarting the launch task doesn't trigger the rebuild, you'll need to re-run the task to accomplish that.

Once you've become familiar with this, proceed to [Chapter 1](/Chapter1).
