# rpi-stresstest
CPU Stresstest for Raspberry Pi´s

This is a bash based script. 
It´s maxing all cores to the highest frequency over a set time (in seconds) 
and saves the results in a CSV-file.

I tested this script on the Pi Zero W, Pi 1b, 2b, 3b, b+ and Pi 4b.

This repo is usefull for monitoring cpu temperatures of your Pi over a certain amount of time.

**Check out the [Wiki](https://github.com/junglert/rpi-stresstest/wiki) and the [manual](https://github.com/junglert/rpi-stresstest/wiki/How-to)**
***
# How to:
  
  Install this git-repo:
  
         git clone https://github.com/junglert/rpi-stresstest.git

    
  Exec the script, you may have to change the permissions with 
        
         chmod +x stresstest.sh
         
  After you changed the permissions execute the script:
        
          ./stresstest.sh
          
  You will notice, that the script is not executing, instead the script is showing its usage:   
   
          Usage: 1. sudo ./stresstest -s or --start  | to start the script     
                 2. ./stresstest -h or --help        | for help page
                 3. ./stresstest.sh                  | for usage
    
  Starting the script:    
        
          sudo ./stresstest -s or --start
  
  After you started the script, it will automatically check if stress is installed.
  If stress is not installed, it´s going to be installed.
  If stress is installed the script will go on with the following prompts:
      
        Runtime in seconds:     Enter the amount of time, in seconds, that you want the script to run
        Filename.csv:           Enter your filename with .csv at the end 
                                (the file is created in the source folder of the script)
  
  Enter your wanted amount of time and a name.
  
  The script will now start to stress your Raspberry Pi and log all stats into a CSV-file.
      
  ***    
   # Future plans:
   
   - changing temperature command to something else that does not need sudo

   - user input for time and file ✔
   
   - automatically installes stress if not already installed ✔
  
   - ~~script creates own alias~~ maybe in the near future, have to find a good way to implement
  
   - help-page ✔
  
   - testing on other Pi´s ✔
   
      - RaspberryPi 4 ✔
      - RaspberryPi 3b and b+ ✔
      - RaspberryPi 2b ✔
      - RaspberryPi 1b ✔
      - RaspberryPi Zero W ✔
     
   - creating a wiki / manual ✔
    
