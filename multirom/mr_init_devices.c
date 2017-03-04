#include <stdlib.h>

// These are paths to folders in /sys which contain "uevent" file
// need to init this device.
// MultiROM needs to init framebuffer, mmc blocks, input devices,
// some ADB-related stuff and USB drives, if OTG is supported
// You can use * at the end to init this folder and all its subfolders
const char *mr_init_devices[] =
{
    "/sys/class/graphics/fb0",
    "/sys/class/graphics/fb1",
    "/sys/devices/virtual/graphics/fb0",
    "/sys/devices/virtual/graphics/fb1",

    "/sys/block/sda/*",
    "/sys/block/sde/*",

    // boot and data
    "/sys/block/sde/sde18", //boot
    "/sys/block/sda/sda9", //data

    // system and cache
    "/sys/block/sde/sde19", //system
    "/sys/block/sda/sda3", //cache

    // Mount persist and firmware
    "/sys/block/sda/sda2", // persist
    "/sys/block/sde/sde12", // firmware

    "/sys/bus/mmc*",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/bus/sdio/drivers",
    "/sys/module/sdhci",
    "/sys/module/sdhci*",
    "/sys/module/sdhci_msm",
    "/sys/module/sdhci_msm*",


    // for input
    "/sys/devices/virtual/input*",
    "/sys/devices/virtual/input/input0",
    "/sys/devices/virtual/input/input1",
    "/sys/devices/virtual/input/input2",
    "/sys/devices/virtual/input/input4",
    "/sys/devices/virtual/misc/uinput",
    "/sys/devices/soc/soc:gpio_keys/input/input5",
    "/sys/bus/platform/devices/soc:gpio_keys/input/input5"
    "/sys/devices/virtual/misc/uinput",
    "/sys/devices/virtual/misc/uinput/*",
    "/sys/devices/soc/75b6000.i2c/i2c-8/8-0034/*",
    "/sys/devices/soc/75b6000.i2c/i2c-8/8-0051/*",
    "/sys/devices/soc/757a000.i2c/i2c-6/6-0008/*",
    "/sys/devices/soc/757a000.i2c/i2c-6/6-0051/*",
    "/sys/devices/soc/75ba000.i2c/i2c-12/12-004a/*",
    "/sys/devices/soc/75ba000.i2c/i2c-12/12-004b/*",
    "/sys/devices/soc0*",
    "/sys/devices/soc0/*",


    // for adb
    "/sys/class/tty/ptmx",
    "/sys/class/misc/android_adb",
    "/sys/class/android_usb/android0*",
    "/sys/class/android_usb/android0/f_adb",
    "/sys/bus/platform/drivers/android_usb",
    "/sys/bus/usb",

    // USB Drive
    "/sys/bus/platform/drivers/xhci-hcd*",
    "/sys/block/sda/sda1",


    // for qualcomm overlay - /dev/ion
    "/sys/devices/virtual/misc/ion",

    // Adding Wildcard for Debug And for Bringup
    "/sys/*",

    NULL
};
