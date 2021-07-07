#!/bin/bash
trap 'printf "\n\noh, I am slain"; exit' INT

printf "\n\e[32m############################################\n"
printf "#### MY TOOLS \ NETWORK \ IP SCANNER #######\n"
printf "############################################\e[0m\n\n"

if [ "$1" == "" ] 
then
  echo "Usage: $0 ip subnet to scan. eg '$0 192.168.1.'. \n\t Use -d to display debug info"
  exit 1
fi

# : ${1?"Usage: $0 ip subnet to scan. eg '$0 192.168.1.'. Use -d to display debug info"}

subnet=$1
( printf "Scanning ${subnet}0 - 255 \n\n")
for addr in `seq 0 1 255 `; do
  printf "Scanning $subnet$addr ... "
  ping -c 3 -t 5 $subnet$addr > /dev/null
  RESPONSE_CODE=$?
  if [ "$2" == "-d" ] 
  then 
    printf " ($RESPONSE_CODE) "
  fi
  if [ $RESPONSE_CODE -eq 0 ] 
  then
    printf "is \e[32mAlive\e[0m\n"
  else
    printf "is \e[31mDead\e[0m\n"
  fi
done

wait
echo 'scan done'
