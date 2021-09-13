#!/bin/bash
export OVPN_DATA="$PWD/data"
if [ "$1" = "init" ]; then
    docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://nlp4.cse.ntou.edu.tw
    docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
elif [ "$1" = "run" ]; then
    docker run -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --rm --cap-add=NET_ADMIN kylemanna/openvpn
elif [ "$1" = "gen" ]; then
    if [ "$2" = "" ]; then
        echo "usage: $0 gen [clientname]"
        exit 0
    fi
    docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $2 nopass
    docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $2 > $2.ovpn
else
    echo "usage: $0 [init|run|gen]"
fi
