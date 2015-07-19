#!/bin/sh

cp ./superswag.sh /home/pi/superswag.sh
sudo chmod a+x /home/pi/superswag.sh

# Ajouter à /etc/rc.local les lignes:
#		/bin/sh /home/pi/superswag.sh start
#		/bin/sh /home/pi/superswag.sh red

#sudo cp ./superswag /etc/init.d/superswag

#sudo chmod a+x /etc/init.d/superswag

#sudo update-rc.d superswag defaults

# Remove: sudo update-rc.d superswag remove
# Alternative: sudo insserv superswag