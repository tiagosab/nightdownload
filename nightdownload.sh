#!/bin/bash

DEBUG=0

thisour=$(date +%H)

if [ $DEBUG ]
then
  echo "Hour of start: $thisour"
fi

if [[ $thisour =~ ^0[2-5]$ ]] 
then
  timeleft="$((6-$thisour))h"
else
  echo "Error getting date: hour" $thisour "not in range to start."
  if [ $DEBUG ]
  then
    timeleft="5m"
    echo "Run for ${timeleft} minutes."
  else
    exit 3
  fi
fi

COMMAND="timeout -k 10m ${timeleft} run-parts /etc/nightdownload.d"
if [ $DEBUG ]
  then
    echo "${COMMAND}"
fi
${COMMAND}
