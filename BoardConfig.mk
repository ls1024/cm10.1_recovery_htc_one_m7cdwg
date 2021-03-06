# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common m7-common
-include device/htc/m7-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := m7cdwg

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := m7cdwg

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=m7cdwg user_debug=31
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/m7cdwg/kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/htc/m7cdwg/kernel
LOCAL_PATH := device/htc/m7cdwg
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0xfffe00
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x93fffc00
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x670000000
BOARD_FLASH_BLOCK_SIZE := 131072

# RIL
BOARD_PROVIDES_LIBRIL := true

# cat /proc/emmc:
#dev:        size     erasesize name
#mmcblk0p20: 000ffa00 00000200 "misc"
#mmcblk0p37: 00fffe00 00000200 "recovery"
#mmcblk0p36: 01000000 00000200 "boot"
#mmcblk0p38: 93fffc00 00000200 "system"
#mmcblk0p27: 00140200 00000200 "local"
#mmcblk0p39: 17fffe00 00000200 "cache"
#mmcblk0p40: 670000000 00000200 "userdata"
#mmcblk0p23: 01400000 00000200 "devlog"
#mmcblk0p25: 00040000 00000200 "pdata"
#mmcblk0p28: 00010000 00000200 "extra"
#mmcblk0p34: 04b00200 00000200 "radio"
#mmcblk0p16: 03c00400 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 00500000 00000200 "wcnss"
#mmcblk0p17: 007ffa00 00000200 "radio_config"
#mmcblk0p21: 00400000 00000200 "modem_st1"
#mmcblk0p22: 00400000 00000200 "modem_st2"
#mmcblk0p30: 00040000 00000200 "skylink"
#mmcblk0p31: 01900000 00000200 "carrier"
#mmcblk0p29: 00100000 00000200 "cdma_record"
#mmcblk0p19: 01affe00 00000200 "reserve_1"
#mmcblk0p33: 034ffa00 00000200 "reserve_2"
#mmcblk0p35: 05fffc00 00000200 "reserve_3"
#mmcblk0p32: 04729a00 00000200 "reserve"

# inherit from the proprietary version
-include vendor/htc/m7cdwg/BoardConfigVendor.mk

#twrp
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
