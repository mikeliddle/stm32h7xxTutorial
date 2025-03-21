/** -- Created on 2025-03-12 --
 * Copyright 2025 mikeliddle
 * Updated by mikeliddle on 2025-03-12
 * License: MIT
 * File: stm32h7xx_it.h
**/
#ifndef __STM32H7xx_IT_H
#define __STM32H7xx_IT_H

#ifdef __cplusplus
extern "C" {
#endif
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

#ifdef __cplusplus
}
#endif

#endif /* __STM32H7xx_IT_H */
