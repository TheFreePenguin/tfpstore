echo "TFPStore v3.0 Beta 2"
echo "Checking for sudo privileges..."
if sudo true; then
  SUDO="sudo"
elif [ $UID = "root" ]
then
  SUDO=""
else
  exec echo "Unable to gain root privileges. Aborting..."
fi
echo "Detecting OS..."
source /etc/os-release
echo "Your OS is ${ID}."
if echo $ID_LIKE | grep ubuntu || echo $ID_LIKE | grep debian || [ ID = "debian" ] || [ ID = "ubuntu" ]; then
  exec `echo $SUDO` bash debian.sh
elif echo $ID_LIKE | grep fedora || echo $ID_LIKE | grep rhel || [ ID = "fedora" ] || [ ID = "rhel" ]; then
  exec `echo $SUDO` bash fedora.sh
else
  echo "Your OS is not supported at this time."
fi
