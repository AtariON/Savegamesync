#!/bin/bash

HOST=$(head -n 1 /home/AtarionScripts/Savegamesync/USER.txt)
USER=$(sed -n '2p' /home/AtarionScripts/Savegamesync/USER.txt)
PASSWD=$(sed -n '3p' /home/AtarionScripts/Savegamesync/USER.txt)
DIRECTORY="psp"

#ftp 

ftp -inv $HOST <<EOF
user $USER $PASSWD
mkdir $DIRECTORY
cd /$DIRECTORY/
lcd /home/pi/RetroPie/roms/$DIRECTORY/
mget *.sav *.srm *.state *.state1 *.state2 *.state3 *.state4 *.state5 *.state6 *.state7 *.state8 *.state9 *.state10 *.state11 *.state12 *.state13 *.state14 *.state15 *.auto *.zip
EOF

#zip
cd /
unzip -o /home/pi/RetroPie/roms/$DIRECTORY/$DIRECTORY.zip && rm /home/pi/RetroPie/roms/$DIRECTORY/$DIRECTORY.zip 
sleep 4
