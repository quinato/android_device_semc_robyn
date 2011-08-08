-include device/semc/msm7x27-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := robyn
TARGET_SPECIFIC_HEADER_PATH := device/semc/robyn/include

BOARD_CUSTOM_GRAPHICS := ../../../device/semc/msm7x27-common/recovery/graphics.c

-include device/semc/msm7x27-common/Android.mk
