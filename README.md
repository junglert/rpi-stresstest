# rpi-stresstest
CPU Stresstest for Raspberry Pi´s

This is a bash based script. It´s maxing all cores to the highest frequency over a set time (in seconds) 
and saves the results in a CSV-file.

This repo is usefull for monitoring temperatures over a certain amount of time.

How to:
  
  install this git-repo:
  
     git clone https://github.com/junglert/rpi-stresstest.git

  
  let the script do its magic:
  
      Enter the wanted time (in seconds) in the "duration =’FOO’" variable.
      Enter your wanted directory in the "save_dir='/home/FOO" variable.
      
      Exec the script.


Future plans:

  -user input for time and directory ✔
  
  -script creates own alias
  
  -help-page
