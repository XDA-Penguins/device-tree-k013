#!/bin/bash

#This script has been adapted from a similar concept used by the CyanogenMod project!
#If you alter this script to use another shell your milage may vary.

#Don't forget to set these variables, or this script will place files
#everywhere! We wouldn't want that!

VENDOR=asus
DEVICE=k013

echo
echo "Proprietary Blob Extractor by Penguineh"
echo "======================================="
echo "Please connect your k013 device via USB"
echo
read -p "Connected? (Y/n) " -n 1 -r


#Get user to confirm device is connected to computer!
echo
#Grabbing Blobs!
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    echo "Now grabbing blobs off device!"
    echo "Prepare for a wall of text..."
    sleep 1
    for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
        DIR=`dirname $FILE`
        if [ ! -d ../../../vendor/$VENDOR/$DEVICE/proprietary/$DIR ]; then
            mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary-blobs/$DIR
        fi
        #Debug :
        #echo ../../../vendor/$VENDOR/$DEVICE/proprietary-blobs/$FILE
        adb pull $FILE ../../../vendor/$VENDOR/$DEVICE/proprietary-blobs/$FILE
    done
    echo
    echo "Blobs copied into vendor/$VENDOR/$DEVICE/proprietary-blobs :) " 
    sleep 1
    echo "Setting up vendor build files..."
    sleep 3
    echo
    echo "1) Copying template files from the vendor-copy dir..."
    cp vendor-copy/* ../../../vendor/$VENDOR/$DEVICE
    sleep 1
    echo "2) Generating k013-memopad-vendor-blobs.mk..."
    for FILE in `cat proprietary-files.txt`; do
        printf "vendor/$VENDOR/$DEVICE/proprietary-blobs/" >> ../../../vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk
        printf "$FILE" >> ../../../vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk
        printf ":" >> ../../../vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk
        printf "$FILE" >> ../../../vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk
        printf " \x5C\n" >> ../../../vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk
    done
    sleep 1
    echo
    echo "Done!"
    echo
    echo "I am fairly sure this script sets up everything the way it needs be.."
    echo "If you think this script could be better, submit a pull request!!"
    echo 
    echo "This setup of files should be compatible with an AOSP build system."
    echo "Your milage may vary on other build systems."
    echo "Exiting."
    echo
    exit 0
fi