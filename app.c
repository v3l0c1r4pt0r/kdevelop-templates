#include <osapi.h>
#include <os_type.h>
#include <user_interface.h>
#include <driver/uart.h>
#include "user_config.h"

#define user_procTaskPrio        0
#define user_procTaskQueueLen    1
os_event_t    user_procTaskQueue[user_procTaskQueueLen];
static void user_procTask(os_event_t *events);

void ICACHE_FLASH_ATTR
uart0_tx_buffer(uint8 *buf, uint16 len);

#define debug(x) uart0_tx_buffer(x, strlen(x))

static void ICACHE_FLASH_ATTR
user_procTask(os_event_t *events)
{
    os_delay_us(10);

    system_os_post(user_procTaskPrio, 0, 0 );
}

//Init function
void ICACHE_FLASH_ATTR
user_init()
{
    uart_init(BIT_RATE_115200, BIT_RATE_115200);
    debug("Program started\r\n");

    //Start os task
    system_os_task(user_procTask, user_procTaskPrio,user_procTaskQueue, user_procTaskQueueLen);

    system_os_post(user_procTaskPrio, 0, 0 );
}
