/** -- Created on 2025-03-12 --
 * Copyright 2025 mikeliddle
 * Updated by mikeliddle on 2025-03-12
 * License: MIT
 * File: stm32h7xx_it.c
**/
#include "main.h"
#include "stm32h7xx_it.h"
void NMI_Handler(void)
{
   while (1)
  {
  }
}
void HardFault_Handler(void)
{
  while (1)
  {
  }
}
void MemManage_Handler(void)
{
  while (1)
  {
  }
}
void BusFault_Handler(void)
{
  while (1)
  {
  }
}
void UsageFault_Handler(void)
{
  while (1)
  {
  }
}
void SVC_Handler(void)
{
}
void DebugMon_Handler(void)
{
}
void PendSV_Handler(void)
{
}
void SysTick_Handler(void)
{
  HAL_IncTick();
}
