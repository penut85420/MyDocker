#!/bin/bash
docker build -t tensorflow:v1 ./tf1/ --no-cache
docker build -t tensorflow:v2 ./tf2/ --no-cache
# docker build -t torch:v1.7 ./torch --no-cache
