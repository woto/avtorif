#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

FILES=`ls -1 ../emex/*`

for i in $FILES
do
  # remove all blanks and store them OUT
  #echo "$i"
  OUT=$(echo $i | sed 's/|/#/g')
  #else execute command such as mv or cp or rm
  [ "$i" != "$OUT" ] && $(mv  "$i"  /mnt/emex/Корнев/server-price/emex/"$OUT")
done

IFS=$SAVEIFS
