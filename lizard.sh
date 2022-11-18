FIRSTTIME=true
echo "Checking for updates..."
set -e
zypper refresh
clear
while true; do
if [ FIRSTTIME = true ]; then
  echo "Repos refreshed! Select an option."
else
  echo "Select an option."
fi
echo "1. Install a package"
echo "2. Remove a package"
echo "3. Install updates"
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
  zypper in $TARGET
elif [ $REPLY = 2 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  zypper remove $TARGET
elif [ $REPLY = 3 ]; then
  zypper update
elif [ $REPLY = 10 ] && which flatpak; then
  bash flatpak.sh
elif [ $REPLY = 11 ] && which snap; then
  bash snap.sh
elif [ $REPLY = 99 ]; then
  exec echo "TFP ZYPPER Store is shutting down..."
fi
done
