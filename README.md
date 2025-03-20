# STM32H750 Tutorial

This site is a live tutorial for the STM32H750 microcontroller, which is part of the STM32H7 series from STMicroelectronics. These are based on the Cortex M7 core, which gives a lot more performance and expandability than the arduino and esp32 boards commonly used for embedded projects.

Because ST shares a lot of hardware between the different series of their chips, this should work without any issues for other STM32H7 chips, and with minor modification, for other STM32 series of chips.

## Getting started

To get started, clone this repo (link below) and run the corresponding "init" script for your platform. This will install the necessary pre-reqs, that are easily scriptable, and setup some useful alias commands for working with this tutorial.

For windows, instead of running init.ps1, you will want to dot source it, e.g. `. .\init.ps1`. On other platforms, running `./init.sh` should work.

To start, you'll want to navigate to the first chapter folder `Chapter1` and open up vscode. You can alternatively do this with the chapter1 alias. Navigating to the next chapter can be done in a similar way with the chapter number, or using the `next` alias.

## Table of Contents

- [Chapter 0: Getting Started with STM32H7](chapter0)
- [Chapter 1: The Event Loop](chapter1)

## Resources

- [This Repo](https://github.com/mikeliddle/stm32h7xxTutorial)
