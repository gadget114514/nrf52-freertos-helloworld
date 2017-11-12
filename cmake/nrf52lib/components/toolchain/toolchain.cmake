# Softdevice inclusion

include_directories(
	${NRF_COMPONENTS_DIR}/toolchain
	${NRF_COMPONENTS_DIR}/toolchain/gcc
	)

set(TOOLCHAIN_SOURCES
	${NRF_COMPONENTS_DIR}/toolchain/system_${CPU_FAMILY_L}.c
)

set(STARTUP_FILE ${NRF_COMPONENTS_DIR}/toolchain/gcc/gcc_startup_${CPU_FAMILY_L}.S)

set(LINKER_TEMPLATE_LOC ${NRF_COMPONENTS_DIR}/toolchain/gcc/)

set(BASE_LD ${NRF_COMPONENTS_DIR}/toolchain/gcc/${CPU_FAMILY_L}_xxaa.ld)

add_library(toolchain ${STARTUP_FILE} ${TOOLCHAIN_SOURCES})

set(LIBS ${LIBS} toolchain)
