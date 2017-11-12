# Library Module

# Add source files

set(NRF_LIB_SOURCES "")

foreach(LIBRARY IN ITEMS ${LIBRARIES})
	# Hacks for libraries that include things they shouldn't
	if("${LIBRARY}" STREQUAL "timer")
		# TODO: add other timer components if definitions exist
		set(NRF_LIB_SOURCES 
			${NRF_LIB_SOURCES} 
			${NRF_COMPONENTS_DIR}/libraries/timer/app_timer.c
			)
		include_directories(${NRF_COMPONENTS_DIR}/libraries/timer)
	else()
		message("Added library: ${LIBRARY} at: ${NRF_COMPONENTS_DIR}/libraries/${LIBRARY}")
		file(GLOB_RECURSE CURRENT_SOURCES ${NRF_COMPONENTS_DIR}/libraries/${LIBRARY}/*.c)
		set(NRF_LIB_SOURCES ${NRF_LIB_SOURCES} ${CURRENT_SOURCES})
		include_directories(${NRF_COMPONENTS_DIR}/libraries/${LIBRARY})
	endif()
endforeach(LIBRARY IN ${LIBRARIES})

# Create ble library
add_library(libraries ${NRF_LIB_SOURCES})

set(LIBS ${LIBS} libraries)
