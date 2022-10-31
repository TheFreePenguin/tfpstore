echo "Welcome to the CLI frontend for APT! Press enter to begin."
read
echo "Checking for updates..."
pkexec apt update
clear
echo "Repos refreshed! Select an option."
echo "1. Install a package"
echo "2. Remove a package"
echo "3. Install updates"
echo "4. Clean up packages"
read -i "Enter your option here "
if [ $REPLY = 1 ] then
  echo "Enter the package(s) you wish to install."
  read TARGET
  pkexec apt install $TARGET
elif [ $REPLY = 2 ] then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  echo "Do you wish to clean up after? [Y/n]"
  read CLEAN
  if [ $CLEAN = n ] then
    pkexec apt remove $TARGET
  else
    pkexec bash cleanup.sh $TARGET
  fi
elif [ $REPLY = 3 ] then
  pkexec apt upgrade
elif [ $REPLY = 4 ] then
  pkexec apt autoremove
fi
