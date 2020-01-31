#!/bin/bash
#author: Johannes Unglert
#mail:
#date: 07.05.2019
#license: GPL-3.0
#summary: this bash script utilizes all cores of the RaspberryPi

stresstest(){ #function for stressing the pi
    echo "
    Checking if stress is installed 
    if not, it´s going to be installed
    "
    downloadstress
    
    echo -e "
     \e[1mStarting rpi-stresstest\e[21m
    "
    echo "------------------------------------------------"

    read -p "Runtime in seconds: " duration #in seconds
    echo "
    "
    read -p "Filename.csv: " save_dir #filename as a csv
    echo "
    "

    stress --cpu 4 --timeout ${duration} --quiet &
    echo "Time       Temperature in °C   Frequency in MHz  on $(date)" | tee -a ${save_dir}

        for (( i=1; i<=${duration}; i++ ))
        do
            cputemp=$(cat /sys/class/thermal/thermal_zone*/temp)
	    temp=$((cputemp/1000))
            time=$(date +%T)
            cpufrequency=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)
            frequency=$((cpufrequency/1000))
            echo -e "${time}   \e[32m${temp}                  \e[96m${frequency} \e[39m" | tee -a ${save_dir}
            sleep 1
        done
     echo "------------------------------------------------"
    echo -e "
    -> stresstest successfully completed \e[32m\u2714 \e[39m
    "
}


downloadstress(){
	dpkg -s stress &> /dev/null
	
	if [ $? -ne 0 ]
	then
		echo -e "	-> installing stress"
		apt-get install -y stress
		echo -e "installed stress \e[32m\u2714 \e[39m"
	else
		echo -e "	-> stress is already installed \e[32m\u2714 \e[39m"
	fi		
}


showhelp(){ #function for the help-page
echo '
This script utilizes all cores of the RaspberryPi to the max.
It´s working on RaspberryPi Zero W, Pi 1, 2b, 3b and b+ and Pi 4b.

You need to exec this script with sudo ./stresstest.sh due to
the fact that the command that reads the CPU frequency has
to be executed as root.

 -s or --start = start script and fill out the needed informations
 -h or --help = help page
     '
}


showusage(){ #function for the usage-page
echo '
Usage: 1. sudo ./stresstest.sh -s or --start  | start the script      
       2. ./stresstest.sh -h or --help        | show help page
       3. ./stresstest.sh 	              | show the usage
    '
}


if [ "$1" == "-s" ] || [ "$1" == "--start" ];then #checking if input is -s or --start --> starting script
stresstest
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ];then #checking if input is -h or --help --> show help-page
showhelp
fi

if [ -z "$1" ];then #checking if input is blank --> show usage 
showusage
fi
