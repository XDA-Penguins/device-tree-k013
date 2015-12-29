# device-tree-k013
[Beta] Bare-bones AOSP device-tree setup for k013

## Usage
Clone this repository into your AOSP build tree so it looks something like the following:

ROOT_DIR/device/asus/k013/(FILES FROM REPOSITORY)

Then, connect your device to your computer and make sure ADB is properly configured.
To extract the proprietary blobs, just execute the extract-proprietary-blobs.sh file. This script also has the benefit of generating the configuration files needed to include the blobs in your build. Keep in mind this will overwrite your vendor files every time run.

Then, when you have edited the build files to your heart's content, just run lunch.

## YMMV
This device tree is untested with Cyanogenmod, so like above, YMMV. This device tree does not also currently build the kernel. I was initially attempting to get AOSP to run with a stock ramdisk, but it seems the changes between 5.0 and 6.0 warrant a fresh kernel build. I will currently leave this as an exercise for others to figure out. I will attempt to get around to it once I have completed some more research into the insecure bootloader.

## General Disclaimer
Standard disclaimers apply. If you flash any part of this repository or generated code files you run the risk of bricking your device. I cannot be held responsible for your actions. If you are smart you would have a clonzilla live usb and powered hub with a nandroid backup. Then, if you can't get into a recovery environment you can boot the system and dd back the image. 

## Finally,
Make sure you have the insecure bootloader installed before attempting to flash any of these files!!
