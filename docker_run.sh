#!/bin/sh/

docker build -t dhe/ubuntu_dev_${1} .

docker run -it \
        --gpus all \
        -v /data:/data \
        --network=host \
        --privileged \
        --security-opt seccomp=unconfined \
        dhe/ubuntu_dev_${1}
         # --shm-size=2018m \


# docker run -it \
#         --gpus all \
#         -v /tmp/.X11-unix:/tmp/.X11-unix \
#         -v /data:/data \
#         -p 6080:80 \
#         --privileged \
#         --network=host \
#         sapeoninc/ubuntu_dev_${1}