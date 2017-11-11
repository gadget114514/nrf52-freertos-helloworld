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