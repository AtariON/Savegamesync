#!/bin/bash

HOST=$(head -n 1 /home/AtarionScripts/Savegamesync/USER.txt)
USER=$(sed -n '2p' /home/AtarionScripts/Savegamesync/USER.txt)
PASSWORD=$(sed -n '3p' /home/AtarionScripts/Savegamesync/USER.txt)


ftp -inv $HOST <<EOF
user $USER $PASSWORD
ls
EOF

