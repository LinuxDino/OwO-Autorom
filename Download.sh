#! /bin/sh

echo " Installation Python "
sudo apt update && sudo apt install python3.8 python3-pip
clear

echo " Clone payload_dumper [Credits to vm03] "
git clone https://github.com/vm03/payload_dumper
clear

echo "</cd payload_dumper>"
clear
echo "Donload platform-tools [Thanks Google owo]"

wget https://dl.google.com/android/repository/platform-tools_r30.0.4-linux.zip

echo "Unzip platform-tools"
unzip platform-tools_*.zip

echo "Clean up."
rm -r platform-tools_*.zip
sleep 5

echo "Done."
