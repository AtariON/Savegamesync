#!/bin/bash
echo "$(date)"
COLUMNS=$(tput cols) 
red=`tput setaf 1`
green=`tput setaf 2`
white=`tput setaf 7`
reset=`tput sgr0`





title="              :: ::::: ::              "
title1="              :: ::::: ::              "
title2="              :: ::::: ::              "
title3="              :: ::::: ::              "
title4="              :: ::::: ::              "
title5="                                       "
title6="                                       "
title7="             .:: ::::: ::.             "
title8="            .::: ::::: :::.            "
title9="           .:::' ::::: ':::.           "
title10="          .::::' ::::: '::::.          "
title11="         .::::'  :::::  '::::.         "
title12="       .:::::'   :::::   ':::::.       "
title13="     .::::::'    :::::    '::::::.     "
title14="...:::::::'      :::::      ':::::::..."
title15=":::::::''        :::::        '':::::::"
title16="::::''           :::::           ''::::"
title18="         SAVGAMESYNC FTP UPLOADER      " 
title17="                AtariON                " 
title19="" 

echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title ${reset}" 
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title1 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title2 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title3 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title4 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title5"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green}$title6 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title7 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${white} $title8 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green} $title9 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${white} $title10 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green} $title11 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title12 ${reset}" 
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title13 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title14 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title15 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${red} $title16 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${white} $title18 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${white} $title17 ${reset}"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "${green} $title19 ${reset}" &
echo
echo
echo

sleep 1

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

mainmenu=${1:-"mainmenu"}
submenu=${1:-"submenu"}
submenu2=${1:-"submenu2"}


EOF

mainmenu:


HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=32
BACKTITLE="FTP UP,- DOWNLOAD for Savegames and States"
TITLE="Savegamesync"
MENU="Choose one of the following options:"

OPTIONS=( 1 "All Systems SAVES DOWNLOAD"
          2 "All Systems SAVES UPLOAD"
          3 "Separate Systems SAVES DOWNLOAD"
          4 "Separate Systems SAVES UPLOAD"
          5 "Show FTP Files"
          6 "Change user data"
          7 "Exit"
          )



CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in

        6)
            echo "Change user data" &&
            sleep 1 &&
            sudo nano "/home/AtarionScripts/Savegamesync/USER.txt"
            echo "DONE!" &&
            jumpto $mainmenu
            ;;


        7)
            echo "Exit"       
            ;;


        5)
            echo "Show FTP Files" &&
            sleep 1 &&
            sudo bash "/home/AtarionScripts/Savegamesync/LS.sh"
            echo "DONE!" &&
            sleep 10 &&
            read -n 1 -s -r -p "Press any key to continue" &&
            jumpto $mainmenu
            ;;
        3)
            submenu:

            OPTIONS1=( 1 "Atari 2600 SAVES DOWNLOAD"
                       2 "Atari 7800 SAVES DOWNLOAD"
                       3 "Atari LYNX SAVES DOWNLOAD"
                       4 "Gameboy SAVES DOWNLOAD"
                       5 "Gameboy Color SAVES DOWNLOAD"
                       6 "Gameboy Advance SAVES DOWNLOAD"
                       7 "Intellivision SAVES DOWNLOAD"
                       8 "N64 SAVES DOWNLOAD"
                       9 "NES SAVES DOWNLOAD"
                      10 "NeoGeo SAVES DOWNLOAD"
                      11 "NGPC SAVES DOWNLOAD"
                      12 "Odyssey2 / Videopac SAVES DOWNLOAD"
                      13 "PC Engine SAVES DOWNLOAD"
                      14 "Playstation SAVES DOWNLOAD"
                      15 "PSP SAVES DOWNLOAD"
                      16 "Sega Game Gear SAVES DOWNLOAD"
                      17 "Sega Mastersystem SAVES DOWNLOAD"
                      18 "Sega Megadrive SAVES DOWNLOAD"
                      19 "Sega32x SAVES DOWNLOAD"
                      20 "SG-1000 SAVES DOWNLOAD"
                      21 "SNES SAVES DOWNLOAD"
                      22 "Virtual Boy SAVES DOWNLOAD"
                      23 "Vectrex SAVES DOWNLOAD"
                      24 "Go Back"
                      )


            CHOICE1=$(dialog --clear \
                            --backtitle "$BACKTITLE" \
                            --title "$TITLE" \
                            --menu "$MENU" \
                            $HEIGHT $WIDTH $CHOICE_HEIGHT \
                            "${OPTIONS1[@]}" \
                            2>&1 >/dev/tty)

            clear
            case $CHOICE1 in

                1)
        	    echo "Atari 2600 SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARI2600SAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                2)
        	    echo "Atari 7800 SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARI7800SAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                3)
        	    echo "Atari LYNX SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARILYNXSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                4)
        	    echo "Gameboy SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                5)
        	    echo "Gameboy Color SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBCSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                6)
        	    echo "Gameboy Advance SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBASAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                7)
        	    echo "Intellivision SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/IntellivisionSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                8)
        	    echo "N64 SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/N64SAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                9)
        	    echo "NES SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NESSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                10)
        	    echo "NeoGeo SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NEOGEOSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                11)
        	    echo "NGPC SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NGPCSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                12)
        	    echo "Odyssey2 / Videopac SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/Odyssey2SAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                13)
        	    echo "PC Engine SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PCESAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                14)
        	    echo "Playstation SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PSXSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                15)
        	    echo "PSP SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PSPSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                16)
        	    echo "Sega Game Gear SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GGSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                17)
        	    echo "Sega Mastersystem SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/MASTERSYSTEMSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                18)
        	    echo "Sega Megadrive SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/MEGADRIVESAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                19)
        	    echo "Sega32x SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SEGA32XSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                20)
        	    echo "SG-1000 SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SG-1000SAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                21)
        	    echo "SNES SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SNESSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                22)
        	    echo "Virtual Boy SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/VBSSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                23)
        	    echo "Vectrex SAVES DOWNLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/VectrexSAVESDOWNLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu
                    ;;
                24)
                    jumpto $mainmenu
                    ;;

                esac
            ;;


        4)
            submenu2:

            OPTIONS2=( 1 "Atari 2600 SAVES UPLOAD"
                       2 "Atari 7800 SAVES UPLOAD"
                       3 "Atari LYNX SAVES UPLOAD"
                       4 "Gameboy SAVES UPLOAD"
                       5 "Gameboy Color SAVES UPLOAD"
                       6 "Gameboy Advance SAVES UPLOAD"
                       7 "Intellivision SAVES UPLOAD"
                       8 "N64 SAVES UPLOAD"
                       9 "NES SAVES UPLOAD"
                      10 "NeoGeo SAVES UPLOAD"
                      11 "NGPC SAVES UPLOAD"
                      12 "Odyssey2 / Videopac SAVES UPLOAD"
                      13 "PC Engine SAVES UPLOAD"
                      14 "Playstation SAVES UPLOAD"
                      15 "PSP SAVES UPLOAD"
                      16 "Sega Game Gear SAVES UPLOAD"
                      17 "Sega Mastersystem SAVES UPLOAD"
                      18 "Sega Megadrive SAVES UPLOAD"
                      19 "Sega32x SAVES UPLOAD"
                      20 "SG-1000 SAVES UPLOAD"
                      21 "SNES SAVES UPLOAD"
                      22 "Virtual Boy SAVES UPLOAD"
                      23 "Vectrex SAVES UPLOAD"
                      24 "Go Back"
                      )

            CHOICE2=$(dialog --clear \
                            --backtitle "$BACKTITLE" \
                            --title "$TITLE" \
                            --menu "$MENU" \
                            $HEIGHT $WIDTH $CHOICE_HEIGHT \
                            "${OPTIONS2[@]}" \
                            2>&1 >/dev/tty)

            clear
            case $CHOICE2 in

                1)
        	    echo "Atari 2600 SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARI2600SAVESUPLOAD.sh"
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                2)
        	    echo "Atari 7800 SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARI7800SAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                3)
        	    echo "Atari LYNX SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/ATARILYNXSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                4)
        	    echo "Gameboy SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                5)
        	    echo "Gameboy Color SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBCSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                6)
        	    echo "Gameboy Advance SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GBASAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                7)
        	    echo "Intellivision SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/IntellivisionSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                8)
        	    echo "N64 SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/N64SAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                9)
        	    echo "NES SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NESSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                10)
        	    echo "NeoGeo SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NEOGEOSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                11)
        	    echo "NGPC SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/NGPCSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                12)
        	    echo "Odyssey2 / Videopac SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/Odyssey2SAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                13)
        	    echo "PC Engine SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PCESAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                14)
        	    echo "Playstation SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PSXSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                15)
        	    echo "PSP SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/PSPSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                16)
        	    echo "Sega Game Gear SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/GGSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                17)

        	    echo "Sega Mastersystem SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/MASTERSYSTEMSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                18)
        	    echo "Sega Megadrive SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/MEGADRIVESAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                19)
        	    echo "Sega32x SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SEGA32XSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                20)
        	    echo "SG-1000 SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SG-1000SAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                21)
        	    echo "SNES SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/SNESSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                22)
        	    echo "Virtual Boy SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/VBSSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                23)
        	    echo "Vectrex SAVES UPLOAD" &&
        	    sleep 2 &&
                    sudo bash "/home/AtarionScripts/Savegamesync/VectrexSAVESUPLOAD.sh" &&
        	    echo "DONE!" &&
        	    sleep 5 &&
                    jumpto $submenu2
                    ;;
                24)
                    jumpto $mainmenu
                    ;;

                esac
            ;;

        1)
	    echo "All Systems SAVES DOWNLOAD" &&
            sleep 2 &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARI2600SAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARI7800SAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARILYNXSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBCSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBASAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/IntellivisionSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/N64SAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NESSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NEOGEOSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NGPCSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/Odyssey2SAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PCESAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PSXSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PSPSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GGSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/MASTERSYSTEMSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/MEGADRIVESAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SEGA32XSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SG-1000SAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SNESSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/VBSAVESDOWNLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/VectrexSAVESDOWNLOAD.sh" &&
            echo "DONE!" &&
            sleep 5 &&
            jumpto $mainmenu
            ;;


        2)
	    echo "All Systems SAVES UPLOAD" &&
            sleep 2 &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARI2600SAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARI7800SAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/ATARILYNXSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBCSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GBASAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/IntellivisionSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/N64SAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NESSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NEOGEOSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/NGPCSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/Odyssey2SAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PCESAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PSXSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/PSPSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/GGSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/MASTERSYSTEMSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/MEGADRIVESAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SEGA32XSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SG-1000SAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/SNESSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/VBSAVESUPLOAD.sh" &&
            sudo bash "/home/AtarionScripts/Savegamesync/VectrexSAVESUPLOAD.sh" &&
            echo "DONE!" &&
            sleep 5 &&
            jumpto $mainmenu
            ;;


esac

