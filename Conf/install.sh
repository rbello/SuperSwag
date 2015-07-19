#!/bin/sh
echo "Executing SuperSwag install script..."

# Arborescence
mkdir /home/pi/RetroPie/Saves 2> /dev/null
chown pi:pi /home/pi/RetroPie/Saves

# Configuration des manettes Xbox
apt-get install xboxdrv 1> /dev/null
cp -f ./rc.local /etc/rc.local
cp -f ./org.seul.Xboxdrv.conf /etc/dbus-1/org.seul.Xboxdrv.conf
chown root:root /etc/dbus-1/org.seul.Xboxdrv.conf
cp -f ./system.conf /etc/dbus-1/system.conf
chown root:root /etc/dbus-1/system.conf

# Configuration de RetroArch
cp -f /opt/retropie/configs/all/retroarch.cfg /opt/retropie/configs/all/retroarch_old.cfg
cp -f ./retroarch.cfg /opt/retropie/configs/all/retroarch.cfg

for f in ./controllers/*.cfg ;
	do cp -f "${f}" "/opt/retropie/emulators/retroarch/configs/"
	chmod +x "${f}" ;
done

# Splash screen
cp -f ./splashscreen.list /etc/splashscreen.list
cp -f ./splashscreen.png /home/pi/splashscreen.png

# Boot image de l'emulateur Game Boy Advance
cp -f ./gba_bios.bin /opt/retropie/emulators/gpsp/gba_bios.bin

# On retire les émulateurs foireux
rm /home/pi/RetroPie/roms/amiga/Start.txt 2> /dev/null
rm /home/pi/RetroPie/roms/apple2/Start.txt 2> /dev/null
rm /home/pi/RetroPie/roms/macintosh/Start.txt 2> /dev/null
rm "/home/pi/RetroPie/roms/pc/Start DOSBox.sh" 2> /dev/null

tput setaf 2 bold
echo "Done"