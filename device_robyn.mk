$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/robyn/robyn-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := E10i
PRODUCT_DEVICE := robyn
PRODUCT_MODEL := E10i

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/semc/robyn/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

-include device/semc/msm7x27-common/msm7x27.mk

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/robyn/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/semc/robyn/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

# Init files
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/init.delta.rc:root/init.delta.rc \
    device/semc/robyn/prebuilt/ueventd.delta.rc:root/ueventd.delta.rc \
    device/semc/robyn/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/robyn/prebuilt/bootrec:root/sbin/bootrec \
    device/semc/robyn/recovery.fstab:root/recovery.fstab \
    device/semc/robyn/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/semc/robyn/prebuilt/initlogo.rle:root/initlogo.rle \

    
#WIFI modules and configs
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/semc/robyn/prebuilt/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    device/semc/robyn/prebuilt/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
    device/semc/robyn/modules/sdio.ko:system/lib/modules/sdio.ko \
    device/semc/robyn/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko
#    device/semc/robyn/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko \




PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \

# robyn uses high-density artwork where available
PRODUCT_LOCALES += ldpi


