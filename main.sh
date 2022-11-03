echo "Press ENTER to start TFP Apt Store v2.0."
read
echo "Checking for updates..."
set -e
sudo apt update
clear
echo "Repos refreshed! Select an option."
echo "1. Install a package"
echo "2. Remove a package"
echo "3. Install updates"
echo "4. Clean up packages"
echo "This APT Store has 500per cow powers."
read -i "Enter your option here "
while true; do
if [ $REPLY = 1 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  sudo apt install $TARGET
elif [ $REPLY = 2 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  echo "Do you wish to clean up after? [y/N]"
  read CLEAN
  sudo apt remove $TARGET
  if [ $CLEAN = y ]; then
    sudo apt autoremove
  fi
elif [ $REPLY = 3 ]; then
  sudo apt upgrade
elif [ $REPLY = 4 ]; then
  sudo apt autoremove
elif [ $REPLY = 99 ]; then
  exec echo "TFP APT Store is shutting down..."
elif [ $REPLY = 500 ]; then
  apt moo
fi
done
