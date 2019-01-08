#!/bin/bash

A=$( temper-poll | grep -i "device #0" )

echo $A

set -f                      # avoid globbing (expansion of *).

array=(${A})
# for i in "${!array[@]}"; do    echo "$i=>${array[i]}"; done

CEL=${array[2]/°C/}

# echo "celsius: $CEL"

if [[ "$CEL" == "" ]]; then
echo "error read temp"
exit 1
fi

DATE=$( date +%Y-%m-%dT%H:%M:%S )

MQTT_MSG="{\"timestamp\":\"$DATE\",\"temp\":\"$CEL\"}"

MQTT_HOST=hwr-pi.fritz.box
MQTT_TOPIC=temp/hwr

mosquitto_pub -h "$MQTT_HOST" -m "$MQTT_MSG" -t "$MQTT_TOPIC"

