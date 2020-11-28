# Automated Keylogger #
This directory is composed of `.autologger.sh` and `.logger.tar`. The `.autologger.sh` installs dependencies on the Linux machine, extracts the `.logger.tar` content, and runs the programs with a timer. When the timer is running, the python programs will log events from keystrokes in the background and will send it to a designated server. Once the timer finishes, the keylogger erases itself to leave no evidence on the machine.

# Disclaimer #
This is intended for security practice and shall not be used for malicious attacks. In no way what so ever should this be used under an illegal act. If you choose to use this repository, I am not responsible for your actions. This logger only works on Linux and will have other implementations done with Windows 10 and Mac. The current username and password needs to be changed for the sftp server that receives the logs.

## Usage ##

#### 1. Clone this repository and unzip and run the following command to start keylogging: ####
```
sudo bash .autologger.sh
```
*Note: This will not send to a designated server unless you unpackage the `.logger.tar` file and change the username and password in the `.eventtranslater.py` for your sftp server to receive logs.*
