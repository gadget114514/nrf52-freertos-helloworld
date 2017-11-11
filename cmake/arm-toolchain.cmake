SET(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armel)
set(CROSS_PREFIX arm-none-eabi-)
set(CROSS_TOOLCHAIN_PATH /opt/local/src/nrf52/gcc-arm-none-eabi-6-2017-q2-update)

# specify the cross-toolchain (compiler, header and library directories)
set(CMAKE_SYSTEM_NAME freertos)
set(CMAKE_SYSTEM_PROCESSOR armel)
set(CMAKE_C_COMPILER ${CROSS_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${CROSS_PREFIX}g++)
set(CMAKE_INCLUDE_PATH ${CROSS_TOOLCHAIN_PATH}/include)
set(CMAKE_LIBRARY_PATH ${CROSS_TOOLCHAIN_PATH}/lib)
set(CMAKE_INSTALL_PREFIX ${CROSS_TOOLCHAIN_PATH}/)

#set(CMAKE_FIND_ROOT_PATH ${ARMADEUS_ROOT_CTC} ${CMAKE_INCLUDE_PATH})

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH ${CROSS_TOOLCHAIN_PATH})

# for libraries and headers in the target directories

#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


# no test

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)



set(CMAKE_C_OUTPUT_EXTENSION .o)
