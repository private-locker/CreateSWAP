#!/usr/bin/env bash
read -p "Enter Swap Mount Point: " mountpoint
read -p "Enter bs (including M): " mountbs
read -p "Enter count: " mountcount
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
sudo dd if=/dev/zero of=$mountpoint bs=$mountbs count=$mountcount
sudo mkswap $mountpoint
sudo chmod 0600 $mountpoint
sudo swapon $mountpoint
sudo echo -e "$mountpoint none swap sw 0 0 \n" >> /../etc/fstab
echo -e "Cleaning Up..";
rm -rf "$0";
echo -e "Done!";
exit;