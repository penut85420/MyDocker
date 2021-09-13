#!/bin/bash
# if [ "$1" != "1" || "$1" != "2" ]; then
#     echo 'usage: run-tf.sh [tf-version]'
#     exit 0
# fi
export CERT_PATH=/home/oppai/Documents/Docker/nginx-certbot/data/certbot/
export WORK_DIR=/home/oppai/Documents/Jupyter
docker run \
    --rm -itd \
    --name tf$1-jupyter \
    --gpus all \
    -u $(id -u):$(id -g) \
    -p 888$1:8888 \
    -v $WORK_DIR:/tf \
    -v $CERT_PATH:/cert \
    tensorflow:v$1
