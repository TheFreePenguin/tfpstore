FIRSTTIME=true
echo "Checking for updates..."
set -e
apt update
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
echo "99. Exit"
read -i "Enter your option here "
FIRSTTIME=false
if [ $REPLY = 1 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  snap install $TARGET
elif [ $REPLY = 2 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  snap remove $TARGET
elif [ $REPLY = 3 ]; then
  snap refresh
elif [ $REPLY = 99 ]; then
  exec echo "TFP Snap extension is shutting down..."
fi
done
