/** -- Created on 2025-03-19 --
 * Copyright 2025 Mike Liddle
 * Updated by Mike Liddle on 2025-03-19
 * License: MIT
 * File: main.c
**/
// main.h is a dependency of the HAL (see the error_handler function)
// standard practice in C is to try to include dependencies at a header
// level instead of a source level. This is a good practice to follow.
#include "main.h"

// Functions used in main and defined in this file need a declaration prior to main in the file.
static void MX_GPIO_Init(void);

int main(void) {
    // Initialize the Hardware Abstraction Layer (HAL) so we can use it.
    // This is provided as part of our STM32 libraries we are including in main.h
    HAL_Init();
    // Initialize GPIO
    MX_GPIO_Init();

    // Create an array of events we can check
    uint32_t* events = {0};
    events[0] = 0; // Initialize the event counter

    // normally you'll want to check if an event has been added to the array, but
    // to keep things simple we're just going to wait until a count is hit.
    uint32_t triggerValue = 1000000;
    while (1) {
        if (events[0] == triggerValue) {
            events[0] = 0; // Reset the event
            HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_3); // Toggle the LED pin
        } else {
            // Increment the event counter
            events[0]++;
        }
    }

    // We won't get here because of the while loop above.
    return 0;
}

static void MX_GPIO_Init(void)
{
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
void Error_Handler(void)
{
  __disable_irq();
  while (1)
  {
  }
}
