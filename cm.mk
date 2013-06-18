$(call inherit-product, device/htc/m7cdwg/full_m7cdwg.mk)

$(call inherit-product, vendor/cm/config/cdma.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mcdwg BUILD_ID=JZO54K BUILD_FINGERPRINT="htc/m7cdwg/m7cdwg:4.1.2/JZO54K/166937.7:user/release-keys" PRIVATE_BUILD_DESC="1.12.1401.1 CL166937 release-keys"

PRODUCT_NAME := cm_m7cdwg
PRODUCT_DEVICE := m7cdwg
