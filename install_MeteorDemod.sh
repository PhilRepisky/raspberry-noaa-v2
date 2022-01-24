#!/bin/bash

cd ~
sudo apt-get update
sudo apt install python3-dev python3-pip
sudo apt install cmake build-essential pkg-config git
sudo apt install libatlas-base-dev liblapacke-dev gfortran
git clone https://github.com/opencv/opencv.git
cd opencv/
mkdir build && cd build
cmake ../  -DBUILD_LIST=core,imgproc,imgcodecs -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_SHARED_LINKER_FLAGS=-latomic
make -j4
sudo make install

cd ~
cp -r ~/raspberry-noaa-v2/software/MeteorDemod ~
cd MeteorDemod
mkdir build && cd build
cmake ../
make -j4
sudo make install
sudo chown $USER:$USER -R ~/.config/meteordemod

cd ~
