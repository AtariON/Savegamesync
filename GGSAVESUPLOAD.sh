#!/bin/bash

HOST=$(head -n 1 /home/AtarionScripts/Savegamesync/USER.txt)
USER=$(sed -n '2p' /home/AtarionScripts/Savegamesync/USER.txt)
PASSWORD=$(sed -n '3p' /home/AtarionScripts/Savegamesync/USER.txt)
DIRECTORY="gamegear"

ftp -inv $HOST <<EOF
user $USER $PASSWORD
mkdir $DIRECTORY
cd /$DIRECTORY/
lcd /home/pi/RetroPie/roms/$DIRECTORY/
mput *.sav *.srm *.state *.state1 *.state2 *.state3 *.state4 *.state5 *.state6 *.state7 *.state8 *.state9 *.state10 *.state11 *.state12 *.state13 *.state14 *.state15 *.auto
EOF
