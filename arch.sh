FIRSTTIME=true
echo "Checking for updates..."
set -e
pacman -Sy
clear
while true; do
if [ FIRSTTIME = true ]; then
  echo "Repos refreshed! Select an option."
else
  echo "Select an option."
fi
echo "1. Install a package"
echo "2. Install a local package"
echo "3. Remove a package"
echo "4. Install updates"
if which flatpak; then
  echo "10. Go to flatpak management"
fi
if which snap; then
  echo "11. Go to snap management"
fi
echo "99. Exit"
read -i "Enter your option here "
FIRSTTIME=false
if [ $REPLY = 1 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  pacman -S $TARGET
elif [ $REPLY = 2 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  pacman -U $TARGET
elif [ $REPLY = 3 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  pacman -R $TARGET
elif [ $REPLY = 4 ]; then
  pacman -Syu
elif [ $REPLY = 10 ] && which flatpak; then
  bash flatpak.sh
elif [ $REPLY = 11 ] && which snap; then
  bash snap.sh
elif [ $REPLY = 99 ]; then
  exec echo "TFP PACMAN Store is shutting down..."
fi
done
