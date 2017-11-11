cmake_minimum_required (VERSION 2.8)

list (APPEND CMAKE_MODULE_PATH
      "${CMAKE_SOURCE_DIR}/cmake"
      "${CMAKE_SOURCE_DIR}/cmake/modules"
      "${CMAKE_SOURCE_DIR}/cmake/platforms")

    set(TARGET freertosnrf52)
    set(NRFSDK here1)
    set(BASELOC here2)    
    
    
project ($(TARGET) C ASM)

include (CheckIncludeFiles)
include (CheckCSourceCompiles)
include (collect)
include (options)
include (depends)

foreach(_inc_path ${CMAKE_INCLUDE_PATH})
  collect (PROJECT_INC_DIRS "${_inc_path}")
endforeach()

enable_testing ()



# source file
add_executable(nrf52

  # startup
  lib/components/toolchain/gcc/gcc_startup_nrf52.S

  # nrf52 port
  freertos/source/queue.c
  freertos/source/tasks.c
  freertos/source/croutine.c
  freertos/source/timers.c
  freertos/source/list.c
  freertos/source/portable/MemMang/heap_1.c
  freertos/source/event_groups.c
  freertos/portable/GCC/nrf52/port.c
  freertos/portable/CMSIS/nrf52/port_cmsis.c
  freertos/portable/CMSIS/nrf52/port_cmsis_systick.c

  # driver
  lib/components/drivers_nrf/clock/nrf_drv_clock.c
  lib/components/drivers_nrf/common/nrf_drv_common.c
  
  # platform
  lib/components/libraries/util/app_error.c
  lib/components/libraries/util/nrf_assert.c
  lib/components/libraries/util/app_error_weak.c
  lib/components/libraries/util/sdk_errors.c
  lib/components/libraries/util/app_util_platform.c
  lib/components/libraries/util/sdk_mapped_flags.c

  lib/components/toolchain/system_nrf52.c
  
  # app
  app/app.c
  app/printf.c
)

# device selection in nrf52.h

# Set device
    if(NOT DEVICE)
      set(DEVICE nRF52832)
      set(BOARD BOARD_PCA10036)
      set(SOFTDEVICE S132)
    endif()


    add_definitions(-DNRF52 -D_LITTLE_ENDIAN=1 -DNDEBUG -D__HEAP_SIZE=0)

    set(CMAKE_C_FLAGS "-ffreestanding -mcpu=cortex-m4 -mthumb -mthumb-interwork -mfloat-abi=softfp -mfpu=fpv4-sp-d16 -ffunction-sections -fdata-sections -g -std=c99 -T ../lib/components/softdevice/s132/toolchain/armgcc/armgcc_s132_nrf52832_xxaa.ld -L ../lib/components/toolchain/gcc")
    
# include directories
# freertos
include_directories(freertos/source/include)
#include_directories(freertos/config)

# nrf52
include_directories(lib/components/libraries/util)

include_directories(lib/components/device)  # nrf.h
include_directories(lib/components/softdevice/s132/headers)  # s132
include_directories(freertos/portable/GCC/nrf52) # nrf52
include_directories(freertos/portable/CMSIS/nrf52) # nrf52
include_directories(lib/components/toolchain/cmsis/include)  # CM4
include_directories(lib/components/toolchain) # system nrf52

# peripheral
include_directories(lib/components/drivers_nrf/hal) # nrf_rtc.h
include_directories(lib/components/drivers_nrf/clock) # nrf_drv_clock.h
include_directories(lib/components/drivers_nrf/common) # nrf_drv_clock.h

# app
include_directories(app)
include_directories(app/blinky_freertos/pca10040/blank/config)
include_directories(app/blinky_freertos/config/blinky_FreeRTOS_pca10040) # FreeRTOSConfig.h
include_directories(lib/components/libraries/log)
include_directories(lib/components/libraries/log/src)



