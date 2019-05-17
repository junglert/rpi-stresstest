#!/bin/bash

showhelp(){ #function for the help-page
echo '
This script utilizes all cores of the RaspberryPi to the max.

 -s = start script and fill out the needed informations
 -h = help page
     '
}

showusage(){ #function for the usage-page
echo '
Usage: 1. stresstest -s start the script      
       2. "stresstest -h" for help page
       3. only the name of the script "./stresstest.sh" is showing the usage
    '
}

stresstest(){ #function for stressing the pi
    read -p "Runtime in seconds: " duration #in seconds
    read -p "Filename.csv: " save_dir #filename as a csv

    stress --cpu 4 --timeout ${duration} --quiet &
    echo "Time; Temperature in °C; Frequency in MHz" | tee -a ${save_dir}

        for (( i=1; i<=${duration}; i++ ))
        do
            temptest=$(cat /sys/class/thermal/thermal_zone*/temp)
            time=$(date +%T)
            frequency=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)
            frequency=$((frequency/1000))
            echo "${time}; ${temptest}; ${frequency}" | tee -a ${save_dir}
            sleep 1 
        done
}

if [ "$1" == "-s" ];then #checking if input is -s --> starting script
stresstest
fi

if [ "$1" == "-h" ];then #checking if input is -h --> show help-page
showhelp
fi

if [ -z "$1" ];then #checking if input is blank --> show usage
showusage
fi
