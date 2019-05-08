#!/bin/bash
read -p "Runtime in seconds: " duration #in seconds
read -p "Filename.csv: " save_dir #filename as a csv

#echo "${save_dir}"
#stress --cpu 4 --timeout ${duration} --quiet &
echo "Time; Temperature in °C; Frequency in MHz" | tee -a ${save_dir}

for (( i=1; i<=${duration}; i++ ))
do
        temptest=$(cat /sys/class/thermal/thermal_zone*/temp)
        #temptest=$((temptest/10))
        time=$(date +%T)
        frequency=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)
        frequency=$((frequency/1000))
        echo "${time}; ${temptest}; ${frequency}" | tee -a ${save_dir}
        sleep 1 
done

