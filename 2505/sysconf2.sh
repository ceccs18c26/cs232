#!/bin/bash

function line(){
	echo "*************************************************"
}
echo "OS and version, release number, kernel version:"
lsb_release -a
echo "Kernel:$(uname -r)"
line
echo "All available shells:"
cat /etc/shells
line
echo "CPU information:"
lscpu
line
echo "Memory information:"
free -m
line
echo "Hard disk information:"
sudo dmidecode -t memory
line
echo "File system (Mounted):"
sudo fdisk -l
line
