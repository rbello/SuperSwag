#!/bin/sh

echo "Copy GPIO scripts..."
cp ./gpio-rgbled.sh /home/pi/gpio-rgbled.sh
sudo chmod a+x /home/pi/gpio-rgbled.sh
cp ./gpio-button.sh /home/pi/gpio-button.sh
sudo chmod a+x /home/pi/gpio-button.sh

echo "Setup boot behavior..."
sudo cp ./superswag.sh /etc/init.d/superswag.sh
sudo chmod a+x /etc/init.d/superswag.sh
sudo update-rc.d superswag.sh defaults

# Remove: sudo update-rc.d superswag remove
# Alternative: sudo insserv superswag