#!/bin/sh

button_pin=1
button_gpio=18

/usr/local/bin/gpio export $button_gpio in

state=`/usr/local/bin/gpio read $button_pin`

while true; do

        current=`/usr/local/bin/gpio read $button_pin`

        if [ "$state" -ne "$current" ]; then
                state=$current
                echo "Reboot..."
                /home/pi/gpio-rgbled.sh red
                sudo reboot
                exit 0
        fi

done

exit 0
