FROM python:latest

MAINTAINER Amanvir Mundra

RUN         apt-get update && \
            apt-get install -y \
			build-essential \
			cmake \
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

RUN         pip install numpy dlib

WORKDIR /
RUN 		git clone https://github.com/opencv/opencv.git \
			&& mkdir /opencv/build \
			&& cd /opencv/build \
			&& cmake ../ \ 
			&& make install 
