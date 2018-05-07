FROM python:latest

MAINTAINER Amanvir Mundra

RUN         apt-get update && \
            apt-get install -y \
			build-essential \
			wget \
			git \
			libopenblas-dev \
			liblapack-dev \
            libx11-dev \
			libgtk-3-dev \
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

RUN 		git clone https://github.com/opencv/opencv.git \
			&& mkdir /opencv/build \
			&& cd /opencv/build \
			&& cmake ../ \ 
			&& make install 
