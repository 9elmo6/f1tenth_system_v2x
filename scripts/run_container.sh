#!/usr/bin/env bash

# create workspace on host, in home directory
mkdir -p /Users/elmoghazy96/Projects/IoTLabTenth/f1tenth_ws

# give docker permission to use X
sudo xhost +si:localuser:root

# run container with privilege mode, host network, display, and mount workspace on host
sudo docker run  -it --privileged --network host -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev:/dev \
    --mount type=volume,dst=/f1tenth_ws,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=/Users/elmoghazy96/Projects/IoTLabTenth/f1tenth_ws \
    theelmo96/f1tenth_upgrade:v1.3
