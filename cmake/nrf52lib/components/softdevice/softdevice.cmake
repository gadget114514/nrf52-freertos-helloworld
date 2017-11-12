# Softdevice inclusion

if(DEFINED SOFTDEVICE)

include_directories(${NRF_COMPONENTS_DIR}/softdevice/common/softdevice_handler)

string(TOLOWER ${SOFTDEVICE} SOFTDEVICE_L)

if(NOT FLASH_START)
if(SOFTDEVICE STREQUAL "S132")
	set(FLASH_START 0x1f000)
elseif(SOFTDEVICE STREQUAL "S212")
	set(FLASH_START 0x12000)
endif()
message("Automatically selected flash start address: ${FLASH_START}")
endif(NOT FLASH_START)

# set(SOFTDEVICE_VERSION "1.0.0-3.alpha")

set(SOFTDEVICE_SOURCES
	${NRF_COMPONENTS_DIR}/softdevice/common/softdevice_handler/softdevice_handler_appsh.c
	${NRF_COMPONENTS_DIR}/softdevice/common/softdevice_handler/softdevice_handler.c
)

include_directories(
	${NRF_COMPONENTS_DIR}/softdevice/${SOFTDEVICE_L}/headers
	${NRF_COMPONENTS_DIR}/softdevice/${SOFTDEVICE_L}/headers/nrf52
	)

set(SOFTDEVICE_LD ${NRF_COMPONENTS_DIR}/softdevice/${SOFTDEVICE_L}/toolchain/armgcc/armgcc_${SOFTDEVICE_L}_${DEVICE_L}_xxaa.ld)

set(SOFTDEVICE_HEX ${NRF_COMPONENTS_DIR}/softdevice/${SOFTDEVICE_L}/hex/${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.hex)
set(SOFTDEVICE_BIN ${SOFTDEVICE_L}_${CPU_FAMILY_L}_${SOFTDEVICE_VERSION}_softdevice.bin)

add_custom_target(softdevice-bin ALL COMMAND ${OBJCOPY} -I ihex -O binary ${SOFTDEVICE_HEX} ${SOFTDEVICE_BIN})

add_library(softdevice ${SOFTDEVICE_SOURCES})

set(LIBS ${LIBS} softdevice)

endif(DEFINED SOFTDEVICE)
