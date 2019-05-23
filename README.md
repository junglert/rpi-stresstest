# rpi-stresstest
CPU Stresstest for Raspberry Pi´s

This is a bash based script. 
It´s maxing all cores to the highest frequency over a set time (in seconds) 
and saves the results in a CSV-file.

I tested the script on the Pi 3b and b+.


This repo is usefull for monitoring temperatures over a certain amount of time.

# How to:
  
  install this git-repo:
  
         git clone https://github.com/junglert/rpi-stresstest.git

  install the needed package:
      
         sudo apt-get install stress
    
  Exec the script, you may have to change the permissions with 
        
         chmod 777 ./stresstest.sh
         
  After you changed the permissions exec the script:
        
          ./stresstest.sh
          
  You will notice, that the script is not executing, instead the script is showing its usage:   
   
          Usage: 1. stresstest -s        
                 2. "stresstest -h" for help page
                 3. "stresstest" for usage
    
  Starting the script:    
        
          sudo ./stresstest -s
  
  
  After that the shell should prompt 2 phrases:
      
        Runtime in seconds:     Enter the amount of time, in seconds, that you want the script to run
        Filename.csv:           Enter your filename with .csv at the end 
                                (the file is created in the source folder of the script)
      
      
   # Future plans:

   -user input for time and file ✔
  
   -script creates own alias
  
   -help-page ✔
  
   -testing on other Pi´s ✔ 
   
     -RaspberryPi 3b and b+ ✔
     -RaspberryPi 2b ✔
     -RaspberryPi 1 ✔
      
    
