##TODO: Installtion Script
#!/bin/sh

echo "

██╗░░░░██╗░░░░██╗  ░█████╗░░██╗░░░░░░░██╗░█████╗░  ░░░░░░
╚═╝░░░██╔╝░░░██╔╝  ██╔══██╗░██║░░██╗░░██║██╔══██╗  ░░░░░░
░░░░░██╔╝░░░██╔╝░  ██║░░██║░╚██╗████╗██╔╝██║░░██║  █████╗
░░░░██╔╝░░░██╔╝░░  ██║░░██║░░████╔═████║░██║░░██║  ╚════╝
██╗██╔╝░░░██╔╝░░░  ╚█████╔╝░░╚██╔╝░╚██╔╝░╚█████╔╝  ░░░░░░
╚═╝╚═╝░░░░╚═╝░░░░  ░╚════╝░░░░╚═╝░░░╚═╝░░░╚════╝░  ░░░░░░

░█████╗░██╗░░░██╗████████╗░█████╗░██████╗░░█████╗░███╗░░░███╗
██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗████╗░████║
███████║██║░░░██║░░░██║░░░██║░░██║██████╔╝██║░░██║██╔████╔██║
██╔══██║██║░░░██║░░░██║░░░██║░░██║██╔══██╗██║░░██║██║╚██╔╝██║
██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝██║░░██║╚█████╔╝██║░╚═╝░██║
╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝

"
sleep 6

clear

echo "
█▀▄ █▀▀ █░█ █ █▀▀ █▀▀   █▀ █░█ █▀█ ▀█▀ █▀▄ █▀█ █▀▀ ▀█
█▄▀ ██▄ ▀▄▀ █ █▄▄ ██▄   █▄ █▀█ █▄█ ░█░ █▄▀ █▄█ █▄█ ▄█

█░█ █▀▀ █▀█ █▀ █ █▀█ █▄░█   ▄▀ █▀█ ░ ▀█ ▀▄
▀▄▀ ██▄ █▀▄ ▄█ █ █▄█ █░▀█   ▀▄ █▄█ ▄ █▄ ▄▀

"
sleep 3

clear

echo"
╭━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭┳━━━╮╱╭╮
┃╭╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╭━╮┃╱┃┃
┃╰╯╰┳╮╱╭╮╭━━┳╮╭╮╭┳━╯┃┃┃┃┣━╯┣┳━╮╭━━╮
┃╭━╮┃┃╱┃┃┃╭╮┃╰╯╰╯┃╭╮┃┃┃┃┃╭╮┣┫╭╮┫╭╮┃
┃╰━╯┃╰━╯┃┃╰╯┣╮╭╮╭┫╰╯┃╰━╯┃╰╯┃┃┃┃┃╰╯┃
╰━━━┻━╮╭╯┃╭━╯╰╯╰╯╰━━┻━━━┻━━┻┻╯╰┻━━╯
╱╱╱╱╭━╯┃╱┃┃
╱╱╱╱╰━━╯╱╰╯"

sleep 3 && clear

##### MENU

PS3='Please enter your choice:'
options=("How it Works" "Install" "Flash" "payload" "Exit")
select opt in "${options[@]}"; do
    case $opt in
    "How it Works")
        echo "This is Magic"
        ;;
    "Install")
        cd platform-tools

        ./fastboot reboot fastboot
        ./fastboot devices

        ./fastboot -w

        ./fastboot erase system
        ./fastboot erase boot
        ./fastboot erase odm
        ./fastboot erase product
        ./fastboot erase vbmeta
        ./fastboot erase vbmeta_system
        ./fastboot erase vendor
        ./fastboot erase dtbo

        ./fastboot flash system system.img
        ./fastboot flash boot boot.img
        ./fastboot flash odm odm.img
        ./fastboot flash product product.img
        ./fastboot flash vbmeta vbmeta.img
        ./fastboot flash vbmeta_system vbmeta_system.img
        ./fastboot flash vendor vendor.img
        ./fastboot flash dtbo dtbo.img
        ./fastboot reboot

        ;;
    "payload")
        clear
        echo "IMPORTANT: EXTRACT THE ROM IN THE PAYLOAD_DUMPER FOLDER" #TODO: I should ask if it go on... lel..
        cd payload_dumper
        python3.8 payload_dumper.py payload.bin

        ;;
    "Flash")
        echo "you chose choice $REPLY which is $opt"
        ;;
    "Quit")
        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done
