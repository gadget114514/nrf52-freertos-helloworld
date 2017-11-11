#/bin/rm -rf /opt/local/src/nrf52/workspace/build/*
cmake .. -DCMAKE_TOOLCHAIN_FILE:PATH=../cmake/arm-toolchain.cmake
