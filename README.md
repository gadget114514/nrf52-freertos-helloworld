## nRF52832 app development boilerplate

boilerplate repository for app development with cmake, freertos, gcc on nRF52832.



## Config for your SDK location

- config SDK_ROOT in CMakeLists.txt: the path where ths sdk is located.
- config REP_ROOT in CMakeLists.txt: the path where the repository is located.

## To build bin

```
cd app/helloworld
mkdir build
cd build
sh ../cmake.sh
make
```

- config with CPU NRF52832, SOFTDEVICE S132, NRF_SD_API_VERSION 3


## Status

- App source (empty main function) can be compiled and linked
- Binary not run and verified yet

Please inform me whether the app using this repository can run on nRF52832

|App name|Required Function|Status|Board|Verified Date|
|--------|-------|------|------|----|
|HelloWorld|UART|Not yet|NA|NA|
|Blinky|GPIO|Not yet|NA|NA|
|BLE Adv|BLE|Not yet|NA|NA|

## TODO
- using UART 


# Reference

- https://github.com/ryankurte/nrf52-base.git

```
The MIT License (MIT)

Copyright (c) 2015 Ryan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

