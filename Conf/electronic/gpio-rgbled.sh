#!/bin/sh

red_pin=3
red_gpio=22
blue_pin=4
blue_gpio=23
green_pin=5
green_gpio=24

gpio_write() {
        /usr/local/bin/gpio write $1 $2
}

gpio_write_all() {
        gpio_write $red_pin $1
        gpio_write $green_pin $2
        gpio_write $blue_pin $3
}

gpio_init() {
        # Exports
        /usr/local/bin/gpio export $red_gpio out
        /usr/local/bin/gpio export $green_gpio out
        /usr/local/bin/gpio export $blue_gpio out
        # Reset
        gpio_write $red_pin 0
        gpio_write $green_pin 0
        gpio_write $blue_pin 0
}

gpio_stop() {
        gpio_write_all 0 0 0
        /usr/local/bin/gpio unexport $red_gpio
        /usr/local/bin/gpio unexport $green_gpio
        /usr/local/bin/gpio unexport $blue_gpio
}

gpio_test() {
        gpio_write $red_pin 1
        sleep 1
        gpio_write $red_pin 0
        gpio_write $green_pin 1
        sleep 1
        gpio_write $green_pin 0
        gpio_write $blue_pin 1
        sleep 1
        gpio_write $blue_pin 0
}

case "$1" in
        start)
                echo "Starting SuperSwag GPIO"
                gpio_init
                ;;
        red)
                gpio_write_all 1 0 0
                ;;
        green)
                gpio_write_all 0 1 0
                ;;
        blue)
                gpio_write_all 0 0 1
                ;;
        purple)
                gpio_write_all 1 0 1
                ;;
        yellow)
                gpio_write_all 1 1 0
                ;;
        lightblue)
                gpio_write_all 0 1 1
                ;;
        off)
                gpio_write_all 0 0 0
                ;;
        black)
                gpio_write_all 0 0 0
                ;;
        white)
                gpio_write_all 1 1 1
                ;;
        test)
                gpio_test
                ;;
        stop)
                echo "Stoping SuperSwag GPIO"
                gpio_stop
                ;;
        *)
                echo "Usage: gpio-rgbled.sh start|stop|test|%color|off"
                echo "Colors are: red, blue, green, black, white, yellow, purple, lightblue"
                exit 1
                ;;
esac

exit 0