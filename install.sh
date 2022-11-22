install(){
  set -e
  echo "Creating install directory"
  mkdir /usr/local/share/tfpstore -p
  echo "Copying files"
  cp *.sh /usr/local/share/tfpstore
  echo "Removing unneeded files"
  rm /usr/local/share/tfpstore/install.sh
  echo "Creating executable binary"
  echo "cd /usr/local/share/tfpstore; bash main.sh" > /usr/local/bin/tfpstore
  chmod 755 /usr/local/bin/tfpstore
  echo "Creating uninstall binary"
  echo "echo \"Uninstalling TFPstore...\"; rm -r /usr/local/share/aptstore; rm /usr/local/bin/aptstore; rm /usr/local/bin/aptstore-uninst" > /usr/local/bin/tfpstore-uninst
  chmod 755 /usr/local/bin/tfpstore-uninst
  echo "TFPstore can now be called by running \"tfpstore\" in the terminal. To uninstall TFPstore, run \"tfpstore-uninst\" as root."
}


echo "Checking for root priviliges..."
if [ $UID = 0 ]; then
  echo "You are root. Continuing..."
  install
else
  echo "You are not root. Aborting..."
  exit
fi
