/** -- Created on 2025-03-25 --
 * Copyright 2025 Mike Liddle
 * Updated by Mike Liddle on 2025-03-26
 * License: MIT
 * File: main.c
**/

#include "main.h"

static void MX_GPIO_Init(void);

int main(void) {
    // This is a simple C program that prints "Hello, World!" to the console.
    while (1) {
        // The program will run indefinitely, blinking the LED on and off.
        HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_3);  // Toggle the LED pin
        HAL_Delay(1000);  // Delay for 1000 milliseconds
    }
    return 0;
}

static void MX_GPIO_Init(void) {
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    // Enable GPIO clock for the GPIO bank we are using (GPIOE)
    __HAL_RCC_GPIOE_CLK_ENABLE();

    // Configure GPIO pin for LED
    // Set the LED pin to low to start
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_3, GPIO_PIN_RESET);
    // Pin 3 for the bank
    GPIO_InitStruct.Pin = GPIO_PIN_3;
    // Push-pull output mode, we are using this pin for output
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    // No pull-up or pull-down resistors, this will be useful for input.
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    // Low speed since we are just using this to blink an LED.
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    // Initialize the GPIO pin in Bank E
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

    // If you had more pins to initialize, that would happen here.
}

// The HAL requires us to define an error handler function. Right now we aren't doing much with this.
void Error_Handler(void) {
    __disable_irq();
    while (1) {
    }
  }
