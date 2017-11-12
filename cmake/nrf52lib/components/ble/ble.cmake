# BLE Module

include_directories(
	${NRF_COMPONENTS_DIR}/ble/common
	)

# Add source files
set(BLE_SOURCES
	${NRF_COMPONENTS_DIR}/ble/common/ble_advdata.c
	${NRF_COMPONENTS_DIR}/ble/common/ble_conn_params.c
	${NRF_COMPONENTS_DIR}/ble/common/ble_conn_state.c
	${NRF_COMPONENTS_DIR}/ble/common/ble_srv_common.c
)

# Add modules
foreach(MODULE IN ITEMS ${BLE_MODULES})
	message("Added ble module: ${MODULE} at: ${NRF_COMPONENTS_DIR}/ble/${MODULE}")
	file(GLOB_RECURSE CURRENT_SOURCES ${NRF_COMPONENTS_DIR}/ble/${MODULE}/*.c)
	set(BLE_SOURCES ${BLE_SOURCES} ${CURRENT_SOURCES})
	include_directories(${NRF_COMPONENTS_DIR}/ble/${MODULE})
endforeach(MODULE IN ITEMS ${BLE_MODULES})

# Add services
foreach(SERVICE IN ITEMS ${BLE_SERVICES})
	message("Added ble service: ${SERVICE} at: ${NRF_COMPONENTS_DIR}/ble/${SERVICE}")
	file(GLOB_RECURSE CURRENT_SOURCES ${NRF_COMPONENTS_DIR}/ble/ble_services/${SERVICE}/*.c)
	set(BLE_SOURCES ${BLE_SOURCES} ${CURRENT_SOURCES})
	include_directories(${NRF_COMPONENTS_DIR}/ble/ble_services/${SERVICE})
endforeach(SERVICE IN ITEMS ${BLE_SERVICES})

# Create ble library
add_library(ble ${BLE_SOURCES})

set(LIBS ${LIBS} ble)
