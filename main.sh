echo "TFPStore v3.0 Beta 1"
echo "Detecting OS..."
source /etc/os-release
if [ ID_LIKE = "ubuntu" ] || [ ID_LIKE = "debian" ]; then
echo "Your OS is ${ID}."
exec bash debian.sh
fi
