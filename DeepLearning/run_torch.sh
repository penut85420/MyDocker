#!/bin/bash

export CERT_PATH=/home/oppai/Documents/Docker/nginx-certbot/data/certbot/
export WORK_DIR=/home/oppai/Documents/Jupyter

docker run \
    --rm -it \
    --name torch-jupyter \
    --gpus all \
    -p 8883:8888 \
    -u $(id -u):$(id -g) \
    -v $WORK_DIR:/workspace \
    -v $CERT_PATH:/cert \
    torch:v1.7
