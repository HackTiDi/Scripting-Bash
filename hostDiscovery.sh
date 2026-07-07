#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1
}

trap ctrl_c SIGINT

function localScan(){
  for i in $(seq 1 254); do 
      timeout 1 bash -c  "ping -c 1 ${1}${i}" &>/dev/null && echo -e "\n[+] Host $1$i - Activo" &
  done
}

tput civis
if [ $1 ]; then
  localScan $1 
else
  echo -e "\n [!] Uso del programa: $0 <Ip-address sin ultimos dos digitos> Ex: $0 192.168.100.\n"
fi

wait
tput cnorm