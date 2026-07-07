#!/bin/bash

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo...\n ${endColour}"
  exec 3<&-; exec 3>&-; tput cnorm; exit 1
}

# Ctrl + C
trap ctrl_c SIGINT


declare -a ports=( $(seq 1 65535) )

function checkPort(){
  
  # host = $1 | $1 = ip | $2 = puerto
  (exec 3<> /dev/tcp/$1/$2) 2>/dev/null
  
  if [ $? -eq 0 ]; then
    echo -e "\n${greenColour}[+] El puerto ${blueColour}$port ${greenColour}esta Abierto${endColour}"
  fi

  exec 3<&-
  exec 3>&-
}

tput civis

if [ $1 ]; then
  for port in ${ports[@]}; do 
    checkPort $1 $port &
  done
else
  echo -e "\n${grayColour} [!] Uso del programa: ${blueColour}$0 <ip-address>${endColour}"
fi

wait

tput cnorm