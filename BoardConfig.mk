TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_PRELINK_MODULE := false

TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86

TARGET_USES_64_BIT_BINDER := true

SMALLER_FONT_FOOTPRINT := true
MINIMAL_FONT_FOOTPRINT := true
BUILD_EMULATOR := false
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

USE_OPENGL_RENDERER := true

BOARD_USE_LEGACY_UI := true

# PDK does not use ext4 image, but it is added here to prevent build break. 
#This has been preconfigured by me, please double check these filesystem sizes anyway.. 
#Sizes should be in bytes and these values result in build imgs that are identical in size to those extracted by dd from the stock os.

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1879048192
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12159249920
BOARD_CACHEIMAGE_PARTITION_SIZE := 678428672
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
