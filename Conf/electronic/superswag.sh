#!/bin/sh

### BEGIN INIT INFO
# Provides: superswag
# Required-Start: $local_fs
# Required-Stop: $local_fs
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Eletronic GPIO handler
# Description: Eletronic GPIO handler for SuperSwag
### END INIT INFO

echo "$(date)" > /home/pi/boot.log

# Init GPIOs
/home/pi/gpio-rgbled.sh start
sleep 1s
/home/pi/gpio-rgbled.sh red

echo "/etc/init.d/superswag.sh" >> /home/pi/boot.log
