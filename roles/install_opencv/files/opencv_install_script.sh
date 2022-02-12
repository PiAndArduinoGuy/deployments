#!/bin/bash
# fast build tool to be used by cmake
sudo apt -y install ninja-build

#  cmake to configure installation, GCC for compilation
sudo apt-get -y install cmake
sudo apt-get -y install gcc g++

# python3 and python2 dev and numpy for building python bindings
sudo apt-get -y install python3-dev python3-numpy
sudo apt-get -y install python-dev python-numpy

# for GTK GUI, camera and media support
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get -y install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install libgtk2.0-dev

# download opencv version 4.5.2
cd /usr/local/applications/
sudo apt-get install git
git clone https://github.com/opencv/opencv.git
git checkout 4.5.2

# install opencv
cd opencv
mkdir "build"
cd build
cmake ../
make
sudo make install