# rpi-stresstest
CPU Stresstest for Raspberry Pi´s

This is a bash based script. 
It´s maxing all cores to the highest frequency over a set time (in seconds) 
and saves the results in a CSV-file.

I tested the script on the Pi 3b and b+.


This repo is usefull for monitoring temperatures over a certain amount of time.

How to:
  
  install this git-repo:
  
         git clone https://github.com/junglert/rpi-stresstest.git

  
  let the script do its magic:
  
      Exec the script, you may have to change the dependencies with 
        
         chmod 777 ./stresstest.sh
  
      Enter the wanted time in seconds.
      Enter the filename .
      
      
Future plans:

  -user input for time and file ✔
  
  -script creates own alias
  
  -help-page
  
  -testing on other Pi´s
