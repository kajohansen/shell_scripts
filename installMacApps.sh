#!/bin/bash

mkdir ~/getmacapps_temp
cd ~/getmacapps_temp

# Installing Chrome
curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
hdiutil mount -nobrowse googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"
rm googlechrome.dmg

# Installing Firefox
curl -L -o Firefox.dmg "http://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
hdiutil mount -nobrowse Firefox.dmg
cp -R "/Volumes/Firefox/Firefox.app" /Applications
hdiutil unmount "/Volumes/Firefox"
rm Firefox.dmg

# Installing Opera
curl -L -o Opera.dmg "http://www.opera.com/download/get/?id=38938&location=395&nothanks=yes&sub=marine"
yes | hdiutil mount -nobrowse Opera.dmg > /dev/null
cp -R "/Volumes/Opera/Opera.app" /Applications
hdiutil unmount "/Volumes/Opera"
rm Opera.dmg

# Installing Handbrake
curl -L -o HandBrake.dmg "https://handbrake.fr/rotation.php?file=HandBrake-0.10.2-MacOSX.6_GUI_x86_64.dmg"
hdiutil mount -nobrowse HandBrake.dmg -mountpoint /Volumes/HandBrake
cp -R "/Volumes/HandBrake/HandBrake.app" /Applications
hdiutil unmount "/Volumes/HandBrake"
rm HandBrake.dmg

# Installing VLC Player
curl -L -o vlc.dmg "http://get.videolan.org/vlc/2.2.1/macosx/vlc-2.2.1.dmg"
hdiutil mount -nobrowse vlc.dmg -mountpoint /Volumes/vlc
cp -R "/Volumes/vlc/VLC.app" /Applications
hdiutil unmount "/Volumes/vlc"
rm vlc.dmg

# Installing Transmission
curl -L -o Transmission.dmg "https://transmission.cachefly.net/Transmission-2.84.dmg"
hdiutil mount -nobrowse Transmission.dmg
cp -R "/Volumes/Transmission/Transmission.app" /Applications
hdiutil unmount "/Volumes/Transmission"
rm Transmission.dmg

# Installing Dropbox
curl -L -o Dropbox.dmg "https://www.dropbox.com/download?plat=mac"
hdiutil mount -nobrowse Dropbox.dmg
cp -R "/Volumes/Dropbox Installer/Dropbox.app" /Applications
hdiutil unmount "/Volumes/Dropbox Installer"
rm Dropbox.dmg

# Installing Google Drive
curl -L -O "https://dl-ssl.google.com/drive/installgoogledrive.dmg"
hdiutil mount -nobrowse installgoogledrive.dmg
cp -R "/Volumes/Install Google Drive/Google Drive.app" /Applications
hdiutil unmount "/Volumes/Install Google Drive"
rm installgoogledrive.dmg

# Installing Sublime Text 2
echo "Installing Sublime Text 2"
curl -L -o "Sublime Text 2.0.2.dmg" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
hdiutil mount -nobrowse "Sublime Text 2.0.2.dmg"
cp -R "/Volumes/Sublime Text 2/Sublime Text 2.app" /Applications
hdiutil unmount "/Volumes/Sublime Text 2/Sublime Text 2.app"
rm "Sublime Text 2.0.2.dmg"

# Installing iterm2
curl -L -o iTerm2.zip "https://iterm2.com/downloads/stable/iTerm2-2_1_4.zip"
unzip iTerm2.zip
mv iTerm.app /Applications
rm iTerm2.zip

# Installing Steam
curl -L -O "http://media.steampowered.com/client/installer/steam.dmg"
yes | hdiutil mount -nobrowse steam.dmg -nobrowse > /dev/null
cp -R "/Volumes/Steam/Steam.app" /Applications
hdiutil unmount "/Volumes/Steam"
rm steam.dmg

# Installing Audacity
curl -L -o audacity.dmg "http://www.oldfoss.com/Audacity/download/audacity-macosx-ub-2.1.1.dmg"
hdiutil mount -nobrowse audacity.dmg
cp -R "/Volumes/Audacity 2.1.1/Audacity" /Applications/Audacity
hdiutil unmount "/Volumes/Audacity 2.1.1"
rm audacity.dmg

# Installing Grand Persepective
curl -L -o GrandPerspective.dmg "http://sourceforge.net/projects/grandperspectiv/files/grandperspective/1.5.1/GrandPerspective-1_5_1.dmg/download"
hdiutil mount -nobrowse GrandPerspective.dmg
cp -R "/Volumes/GrandPerspective 1.5.1/GrandPerspective.app" /Applications
hdiutil unmount "/Volumes/GrandPerspective 1.5.1"
rm GrandPerspective.dmg

# Installing Gimp
curl -L -o gimp.dmg "https://download.gimp.org/mirror/pub/gimp/v2.8/osx/gimp-2.8.16-x86_64.dmg"
hdiutil mount -nobrowse gimp.dmg
cp -R "/Volumes/Gimp 2.8.16/GIMP.app" /Applications
hdiutil unmount "/Volumes/Gimp 2.8.16"
rm gimp.dmg

# Installing Synergy
curl -L -o synergy.dmg "http://synergy-project.org/files/packages/synergy-1.5.0-r2278-MacOSX109-x86_64.dmg"
hdiutil mount -nobrowse synergy.dmg
cp -R "/Volumes/Synergy/Synergy.app" /Applications
hdiutil unmount "/Volumes/Synergy"
rm synergy.dmg

# Installing Coda
curl -L -o Coda.zip "https://download.panic.com/coda/Coda%202.5.13.zip"
unzip Coda.zip
mv "Coda 2.app" /Applications
rm Coda.zip

# Installing Thunderbird
curl -L -o Thunderbird.dmg "https://download.mozilla.org/?product=thunderbird-38.5.0&os=osx&lang=en-US"
hdiutil mount -nobrowse Thunderbird.dmg -nobrowse
cp -R "/Volumes/Thunderbird/Thunderbird.app" /Applications
hdiutil unmount "/Volumes/Thunderbird"
rm Thunderbird.dmg

# Installing Inkscape
curl -L -o Inkscape.dmg "https://inkscape.org/en/gallery/item/4034/Inkscape-0.91-1-x11-10.5-i386_1.dmg"
hdiutil mount -nobrowse Inkscape.dmg -nobrowse
cp -R "/Volumes/Inkscape/Inkscape.app" /Applications
hdiutil unmount "/Volumes/Inkscape"
rm Inkscape.dmg

# Installing Keka
curl -L -o Keka.dmg "http://download.kekaosx.com/"
hdiutil mount -nobrowse Keka.dmg
cp -R "/Volumes/Keka/Keka.app" /Applications
hdiutil unmount "/Volumes/Keka"
rm Keka.dmg