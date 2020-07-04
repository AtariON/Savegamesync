#!/bin/bash

HOST=$(head -n 1 /home/AtarionScripts/Savegamesync/USER.txt)
USER=$(sed -n '2p' /home/AtarionScripts/Savegamesync/USER.txt)
PASSWORD=$(sed -n '3p' /home/AtarionScripts/Savegamesync/USER.txt)
DIRECTORY="neogeo"

ftp -inv $HOST <<EOF
user $USER $PASSWORD

mkdir $DIRECTORY
mkdir $DIRECTORY/fba
mkdir $DIRECTORY/fbneo

cd /$DIRECTORY/fba/
lcd /home/pi/RetroPie/roms/$DIRECTORY/fba/
mget *fs *hi *.sav *.srm *.state *.state1 *.state2 *.state3 *.state4 *.state5 *.state6 *.state7 *.state8 *.state9 *.state10 *.state11 *.state12 *.state13 *.state14 *.state15 *.auto

cd /$DIRECTORY/fbneo/
lcd /home/pi/RetroPie/roms/$DIRECTORY/fbneo/
mget *fs *hi *.sav *.srm *.state *.state1 *.state2 *.state3 *.state4 *.state5 *.state6 *.state7 *.state8 *.state9 *.state10 *.state11 *.state12 *.state13 *.state14 *.state15 *.auto

EOF
