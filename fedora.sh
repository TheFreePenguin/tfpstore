FIRSTTIME=true
echo "Checking for DNF..."
if which dnf; then
PKMGR="dnf"
else
PKMGR="yum"
fi
while true; do
if [ FIRSTTIME = true ]; then
  echo "Repos refreshed! Select an option."
else
  echo "Select an option."
fi
echo "1. Install a package"
echo "2. Remove a package"
echo "3. Install updates"
echo "4. Clean up packages"
if which flatpak; then
  echo "10. Go to flatpak management"
fi
if which snap; then
  echo "11. Go to snap management"
fi
echo "99. Exit"
echo "This APT Store has 500per cow powers."
read -i "Enter your option here "
FIRSTTIME=false
if [ $REPLY = 1 ]; then
  echo "Enter the package(s) you wish to install."
  read TARGET
  `echo $PKMGR` install $TARGET
elif [ $REPLY = 2 ]; then
  echo "Enter the package(s) you wish to remove."
  read TARGET
  echo "Do you wish to clean up after? [y/N]"
  read CLEAN
  `echo $PKMGR` remove $TARGET
  if [ $CLEAN = y ]; then
    `echo $PKMGR` autoremove
  fi
elif [ $REPLY = 3 ]; then
  `echo $PKMGR` upgrade
elif [ $REPLY = 4 ]; then
  `echo $PKMGR` autoremove
elif [ $REPLY = 10 ] && which flatpak; then
  bash flatpak.sh
elif [ $REPLY = 11 ] && which snap; then
  bash snap.sh
elif [ $REPLY = 99 ]; then
  exec echo "TFP DNF Store is shutting down..."
fi
done
