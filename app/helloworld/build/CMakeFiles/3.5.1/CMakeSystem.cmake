set(CMAKE_HOST_SYSTEM "Linux-4.4.0-98-generic")
set(CMAKE_HOST_SYSTEM_NAME "Linux")
set(CMAKE_HOST_SYSTEM_VERSION "4.4.0-98-generic")
set(CMAKE_HOST_SYSTEM_PROCESSOR "x86_64")

include("/opt/local/src/nrf52/nrf52-freertos-helloworld/cmake/arm-toolchain.cmake")

set(CMAKE_SYSTEM "freertos")
set(CMAKE_SYSTEM_NAME "freertos")
set(CMAKE_SYSTEM_VERSION "")
set(CMAKE_SYSTEM_PROCESSOR "armel")

set(CMAKE_CROSSCOMPILING "TRUE")

set(CMAKE_SYSTEM_LOADED 1)
