#  Author : Bhagyashri Walde
#  Bash script to obtain Ping and Traceroute outputs from servers.  
#  Autimation Script


#!/bin/bash
start=$SECONDS

INPUT_FILE=$1
OUTPUT_FILE="/opt/IBM/common/Scripts/Ping/output/`hostname -s`-`date +%Y%m%d-%H%M`_ping_output.txt" 
TRACEROUTE_FILE="/opt/IBM/common/Scripts/Ping/output/`hostname -s`-`date +%Y%m%d-%H%M`_traceroute.txt"
red="\033[1;31m"
green="\033[1;32m"
reset="\033[0m"

echo -e "\n\tScript executed on $(date)\n"
read -p "  Do you want to execute Traceroute command for Failed hosts (Y/N): " option

if [ $# -ne 0 ]
then
echo -e "\n`awk -F, -v keyword="$USER" '$1 = keyword { print $2 }' /opt/IBM/common/Scripts/user_details.csv` executed this script on $(date)\n"  >> $OUTPUT_FILE
declare -i COUNTER=0 
for SERVER in $( cat $INPUT_FILE )
do
  let "COUNTER+=1"
  if [ -f /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping_master.file ]
  then
  search_m=$(grep -i $SERVER /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping_master.file | grep -v grep)
  fi  
  if [ -f /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping_backup.file ]
  then
  search_b=$(grep -i $SERVER /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping_backup.file | grep -v grep)
  fi
  if [ -f /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping.file ]
  then
  search_f=$(grep -i $SERVER /opt/IBM/tivoli/netcool/omnibus/probes/linux2x86/ping.file | grep -v grep)
  fi

  if [ ! -z "$search_m" ]
  then 
    backups = "$(awk -F, -v keyword="`hostname -s`_master" '$1 == keyword { print $2 }' lookup_pair)" 
    echo -e "\n\t$COUNTER. $SERVER :: Backup probe - $backup"
  elif [ ! -z "$search_b" ]
  then
    primary = "$(awk -F, -v keyword="`hostnames -s`_backup" '$1 == keyword { print $2 }' lookup_pair)" 
    echo -e "\n\t$COUNTER. $SERVER :: Master probe - $primary"
  elif [ ! -z "$search_f" ]
  then
    pair = "$(awk -F, -v keyword="`hostnames -s`" '$1 == keyword { print $2 }' lookup_pair)" 
  "ping_traceroute.sh" 91L, 3354C
