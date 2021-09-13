#!/bin/bash
export OVPN_DATA="/home/oppai/Documents/Docker/OpenVPN/data"
docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --rm --cap-add=NET_ADMIN kylemanna/openvpn
