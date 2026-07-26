#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n${redColour}[!] Saliendo...${endColour}"
  tput cnorm; exit 1
}

trap ctrl_c SIGINT

function ScanSubDomain(){
  tput civis
  echo -e "\n${blueColour}[+]${grayColour} Basic Active Scanner of subdomains with GoBuster${endColour}\n"
  gobuster dns $addCmmand $wordlist -d $url $threads
  tput cnorm
}

function helpPanel(){
  echo -e "\n${blueColour}[!]${grayColour} Modo de uso: -u https://target.htb/ ${endColour}"
  echo -e """\n${blueColour}[*]${grayColour} -u = URL TARGET 
    -t = threads
    -f = Any filter to apply > Default Hide Code 404
    -w = wordlist to Use > Default 'subdomains-top1million-110000'
    ${endColour}"""
  tput cnorm; exit 1
}

while getopts "u:f:w:t:h" arg; do
  case $arg in
    u) url="$OPTARG";;
    f) filter="$OPTARG";;
    w) wordlist="$OPTARG";;
    t) threads="$OPTARG";;
    h) helpPanel;;
  esac 
  done
  
  if [[ $url ]]; then
    if [[ $filter ]]; then
      addCommand=$filter
    fi
    if [[ $threads ]]; then
      threads="-t $threads"
    else
      pass
    fi
    if [[ $wordlist ]]; then
      wordlist="-w $wordlist"
    else
      wordlist="-w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-110000.txt"
    fi
    ScanSubDomain
  else
    echo -e "\n${redColour}[!] Please enter the TARGET URL${endColour}"
    helpPanel
  fi
