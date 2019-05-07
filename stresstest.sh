#!/bin/bash
duration='60000' #in Seconds
save_dir='/home/FOO' #here you can change your wanted directory

echo "${save_dir}"
#stress --cpu 4 --timeout ${duration} --quiet &
echo "Zeit; Temperatur in °C; Taktfrequenz in MHz" | tee -a ${save_dir}

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

