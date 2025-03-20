/** -- Created on 2025-03-12 --
 * Copyright 2025 mikeliddle
 * Updated by mikeliddle on 2025-03-12
 * License: MIT
 * File: main.h
**/
// This define makes it so only one instance of this file exists at compile time.
// You'll see "function redefined" compiler errors if you don't do this right.
#ifndef __MAIN_H
#define __MAIN_H

// make this file work well with C++ as well as C
#ifdef __cplusplus
extern "C" {
#endif

// Include the HAL header
#include "stm32h7xx_hal.h"
// Declare that we are implementing the error handler that the HAL requires.
void Error_Handler(void);


#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
