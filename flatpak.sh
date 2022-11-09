echo "Setting up flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
clear
while true; do
echo "You are currently in flatpak mode."
echo "1. Install a package from flathub"
echo "2. Install from local system"
echo "3. Remove a package"
echo "4. Install updates"
echo "99. Exit"
read -i "Enter your option here "
FIRSTTIME=false
if [ $REPLY = 1 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  flatpak install flathub $TARGET
elif [ $REPLY = 2 ]; then
  echo "Type the path to the package/flatpakref you wish to install."
  read TARGET
  flatpak install $TARGET
elif [ $REPLY = 3 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  flatpak uninstall $TARGET
elif [ $REPLY = 4 ]; then
  flatpak update
elif [ $REPLY = 99 ]; then
  exec echo "TFP Flatpak extension is shutting down..."
fi
done
