#!/bin/bash
HOST=$(head -n 1 /home/AtarionScripts/Savegamesync/USER.txt)
USER=$(sed -n '2p' /home/AtarionScripts/Savegamesync/USER.txt)
PASSWD=$(sed -n '3p' /home/AtarionScripts/Savegamesync/USER.txt)
DIRECTORY="psp"

#zip
cd /home/pi/RetroPie/roms/$DIRECTORY/
zip -r -v -o psp.zip /home/pi/RetroPie/roms/$DIRECTORY/PSP
sleep 4


#ftp

ftp -inv $HOST <<EOF
user $USER $PASSWD
mkdir $DIRECTORY
cd /$DIRECTORY/
lcd /home/pi/RetroPie/roms/$DIRECTORY/
mput *.sav *.srm *.state *.state1 *.state2 *.state3 *.state4 *.state5 *.state6 *.state7 *.state8 *.state9 *.state10 *.state11 *.state12 *.state13 *.state14 *.state15 *.auto *.zip
EOF


#zip2
rm /home/pi/RetroPie/roms/psp/psp.zip
