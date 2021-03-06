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

PRODUCT_PACKAGES += \
    lights.robyn 

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/semc/msm7x27-common/prebuilt/initlogo_ldpi.rle:root/initlogo.rle 

# Init files
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/bootrec:root/sbin/bootrec

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \

# robyn uses high-density artwork where available
PRODUCT_LOCALES += ldpi

#new charging animations LDPI
PRODUCT_COPY_FILES += \
    device/semc/msm7x27-common/prebuilt/animations/anim1.rle:system/etc/semc/chargemon/anim1.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim2.rle:system/etc/semc/chargemon/anim2.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim3.rle:system/etc/semc/chargemon/anim3.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim4.rle:system/etc/semc/chargemon/anim4.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim5.rle:system/etc/semc/chargemon/anim5.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim6.rle:system/etc/semc/chargemon/anim6.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim7.rle:system/etc/semc/chargemon/anim7.rle \
    device/semc/msm7x27-common/prebuilt/animations/anim8.rle:system/etc/semc/chargemon/anim8.rle 

