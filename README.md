## Copy from nordic sdk to setup

```
cp -rp nRF5_SDK_12.3.0_d7731ad/external/freertos freertos
mkdir lib
cp -rp nRF5_SDK_12.3.0_d7731ad/components  lib
```


## To build bin

```
mkdir build
cd build
sh ../cmake.sh
make
```

- config with NRF52832, S132 



## Status

- App source (empty main function) can be compiled and linked
- Binary not run yet


## TODO
- using UART 
