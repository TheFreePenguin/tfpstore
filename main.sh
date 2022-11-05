echo "TFPStore v3.0 Beta 1"
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
if [ ID_LIKE = "ubuntu" ] || [ ID_LIKE = "debian" ]; then
  exec `echo $SUDO` bash debian.sh
else
  echo "Your OS is not supported at this time."
fi
