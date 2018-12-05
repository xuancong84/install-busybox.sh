# install-busybox.sh
This bash script installs busybox on an Android emulator in order to run more Linux commands on your Android emulator.

It can install busybox silently and headlessly on both 32-bit and 64-bit Android emulators.

Firstly, you should download busybox binary executable from https://busybox.net/downloads/binaries/ and copy it into your $HOME/bin folder.

Next, download the script install-busybox.sh into $HOME/bin folder.

Now, you can run the script. If you are running multiple emulators, you will need to put the serial number as the argument.

So far, I have tested it on Android API 26-28, but it might not work on all Android images. 
