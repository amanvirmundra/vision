FROM python:latest

MAINTAINER Amanvir Mundra

RUN         apt-get update && \
            apt-get install -y \
	    build-essential \
	    pkg-config \
	    wget \
	    git \
	    libjpeg-dev libtiff-dev libjasper-dev libpng-dev \
	    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
	    libgtk2.0-dev \
	    libatlas-base-dev gfortran \
            python \
	    python-dev \
	    python-pip \
            python3 \
	    python3-dev \
	    python3-pip 

WORKDIR /
RUN         mkdir /cmake \
	    && cd /cmake \
	    && wget https://cmake.org/files/v3.11/cmake-3.11.1.tar.gz \
	    && tar -xzvf cmake-3.11.1.tar.gz \
	    && cd cmake-3.11.1/ \
	    && ./bootstrap \
	    && make -j4 \
	    && make install

RUN         pip install numpy dlib

RUN 	    git clone https://github.com/opencv/opencv.git \
            && cd opencv \
	    && git https://github.com/opencv/opencv_contrib \
	    && mkdir build \
	    && cd build \
	    && cmake -D CMAKE_BUILD_TYPE=RELEASE \
	    -D CMAKE_INSTALL_PREFIX=/usr/local \
	    -D INSTALL_C_EXAMPLES=ON \
	    -D INSTALL_PYTHON_EXAMPLES=ON \
	    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	    -D BUILD_EXAMPLES=ON .. \
	    && make -j4 \
	    && make install 
