#!/bin/bash

export PASSWORD=xtwRvolfpaALTEvR
export DAEMON_NUMBER=4

for (( i=0; i<$DAEMON_NUMBER; i++))
do
  docker run -itd --rm --privileged \
      -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
      --name judgehost-$i \
      --link domserver:domserver \
      --hostname judgedaemon-$i \
      -e DAEMON_ID=$i \
      -e JUDGEDAEMON_PASSWORD=$PASSWORD \
      -e CONTAINER_TIMEZONE=Asia/Taipei \
      -e DOMSERVER_BASEURL=https://nlp4.cse.ntou.edu.tw:12345/ \
      domjudge/judgehost:latest
done
