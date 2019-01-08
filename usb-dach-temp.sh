#!/bin/bash

A=$( temper-poll | grep -i "device #0" )

#echo $A

set -f                      # avoid globbing (expansion of *).

array=(${A})
#for i in "${!array[@]}"
#do
#    echo "$i=>${array[i]}"
#done

CEL=${array[2]/°C/}

#echo $CEL

DATE=$(  date +%Y-%m-%dT%H:%M:%S )

MQTT_MSG="{\"timestamp\":\"$DATE\",\"temp\":\"$CEL\"}"

mosquitto_pub -h hwr-pi.fritz.box -m "$MQTT_MSG" -t "temp/dachboden"



