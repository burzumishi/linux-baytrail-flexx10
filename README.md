# Introduction

This project is an efford to get **GNU/Linux** running on **[Nextbook Flexx 10.1"] (http://nextbookusa.com/productdetail.php?product_id=26)** Intel Atom Bay Trail (ASoC) device. 

NOTE: *Fleex 9 has almost the same hardware.*

This document has been tested with the following "GNU/Linux" distributions:

- **[Debian] (http://www.debian.org)**
- **[Ubuntu] (http://www.ubuntu.com)**
- **[ElementaryOS] (https://elementary.io)**
- **[Arch Linux] (https://www.archlinux.org)** (Thanks to: **@nicman23**)

Except for distribution related commands, this documentation can be useful for:
- **[Android-x86] (http://www.android-x86.org)**
- **[This google groups discussion] (https://groups.google.com/forum/#!topic/android-x86/un74okmr30g)**
- **[Android-x86] (http://www.android-x86.org)** (Installed on USB stick ... it worked, but I have not written any doc yet ... **[Linux Live USB Creator] (http://www.linuxliveusb.com)** -- officially support Android-x86)

## System Hardware Summary

**[Nextbook Flexx 10.1"] (http://nextbookusa.com/productdetail.php?product_id=26)**

## Hardware

```
- CPU: **Intel Atom Bay Trail Z3735F**
- Video: **Intel HD Graphics (Atom Processor Z36xxx/Z37xxx Series Graphics & Display)** 
- Screen: **10.1" - I2C HID v1.00 Device [FTSC1000:00 2808:1015] on i2c-FTSC1000:00**
- WiFi: **Realtek RTL8723BS Wireless LAN 80211n SDIO Network Adapter**
- Disks: **mmcblk0: mmc0:0001 NCard  28.9 GiB** 
- RAM: **LPDDR3 1067 2GB (on-board)** 
- BT: **Realtek RTL8723BS_BT**
```

**[Full System Hardware Info] (https://github.com/burzumishi/linux-baytrail-flexx10/wiki/Sytem-Hardware)**


## Project Status

 * Boot Standard Kernel **{OK}**
 * Detect hard drives **{OK}**
 * Shutdown **{OK}**
 * Reboot **{OK}**
 * Hibernation **{OK}**
 * Sleep / Suspend **{OK}**
 * Battery monitor **{OK}**
 * Xorg & XWayland **{OK}**
   - OpenGL **{OK}**
   - Resize-and-Rotate(randr) **{OK}**
 * Screen backlight **{i}**
 * Light sensor **/!\**
 * Switch to External Screen (HDMI)  **{OK}**
 * Mouse
   - Built-in (Touchpad) **{OK}**
   - Built-in (Touchscreen) **{OK}**
 * Bluetooth {i} **{OK}**
 * Keyboard's Hotkeys **{OK}**
 * Wireless/Wifi **{OK}**
 * Sound **{i}**
 * MicroSD card reader **{OK}**
 * Built-in camera **{X}**
 * Accelerometers **{OK}**

Legend : **{OK}** = OK ; **{X}** = Unsupported(No Driver) ; **/!\** = Error (Couldn't get it working); **[?]** = Unknown, Not Test; **[-]** = Not-applicable; **{i}** = Configuration Required/ needs the kernel patches from sunxi (also hosted here) ;  **X-(** = Only works with a non-free driver and or firmware


## Important Notes

{i} The following information and procedures are mostly extracted from the T100TA and Odys wintab 10.1 and adappted to the Flexx10. The T100TA has an hardware similar to that one of the Flexx10, informations and procedures regarding these two models can be usefully shared.

{i} Before installing Linux, Secure Boot needs to be disabled. Also, if dual-booting with Windows 8 it is recommended to disable its fast boot feature.

{i} Although the Debian Jessie (stable) installer includes all the needed modules and core changes to install and boot on this machine, it is advisable to install Debian Stretch (testing) and keep it up to date due to a lot of components still unsupported. If you really want to install Debian Jessie (stable) at least you can use the backport repository to install the latest kernels and firmwares when available.

{i} Another choice is any close to upstream distro (the Arch family will be supported here).

{i} In order to install with any netboot image, by using the internet (e.g. with a netinst image), the wifi has to be enabled. See the steps described in the WiFi section, prepare the needed firmware (see also the d-i manual Loading Missing Firmware) and reproduce the steps using a shell during the installation procedure.

{i} The Flexx 10.1 is a mixed mode EFI system (i.e. a 64-bit CPU combined with a 32-bit EFI) without any legacy BIOS mode. By default, any i386 installer images should boot on this machine via UEFI and let you install a complete 32-bit (i386) system. If you use the multi-arch amd64/i386 netinst or DVD image, you will also be able to install in 64-bit mode. You might expect slightly better performance that way in exchange for ram uasge. Multi-arch DVD images must be modified before booting.


## BIOS Access

1. To disable Secure Boot press F2 when the laptop is starting. You should get a BIOS-alike configuration application where Secure Boot may be disabled (Security tab).

    NOTE: that on Flex 10 you have to press "Fn + F2" to get the "F2" functionality, not some desktop config button. 
    NOTE: Press "PowerOn + Volume Down" five seconds for boot menu.

2. You have to go to pc settings via the charms bar ( bar on the right that pops up on desktop ) then General -> advanced startup-> restart. it will boot up into a blue screen with some options, select troubleshoot, then there should be a bios or uefi restart option, wording differs slightly based on hardware.

Or just open a cmd prompt and type: shutdown.exe /r /o

That will restart into the blue screen with options. 


### To Turn "Fast Startup" On or Off in System Settings

1. Open the Control Panel (icons view), and click on the Power Options icon.
2. Click/tap on the Choose what the power buttons do link on the left side. (see screenshot below)
3. Click/tap on the Change settings that are currently unavailable link at the top. (see screenshot below)
4. If prompted by UAC, then click/tap on Yes. 
5. Do step 6 or step 7 below for what you would like to do. 
6. To Turn On "Fast Startup" (Hybrid Boot) for a "Hybrid Shutdown"

    NOTE: This is the default setting.

  A) Under Shutdown settings, check the Turn on fast startup box, and click/tap on the Save changes button. (see screenshot below)

    NOTE: If the Turn on fast startup setting is not listed, then you will need to close the System Settings window,enable hibernate, then start back at step 1 again.

  B) The Shut down Power option will now perform as a hybrid shut down when used.
  C) Go to step 8 below.

7. To Turn Off "Fast Startup" for a "Full Shutdown"

  A) Under Shutdown settings, uncheck the Turn on fast startup box, and click/tap on the Save changes button. (see screenshot below step 6A)

    NOTE: If the Turn on fast startup setting is not listed, then hibernate has been disabled that removed this setting and also disabled fast startup.

  B) The Shut down Power option will now perform as a normal full shut down when used.
  C) Go to step 8 below.

8. You can now close the Power Options window if you like.

### Installing Debian

Use native installer, compile kernel with the patches hosted here and install it.

### Installing Arch based distros

Compile a custom kernel with patches hosted here.

Install grub with `grub-install --target=i386-efi --no-nvram --efi-directory *where you mounted the efi dir* *path to usb efi block device*` and make a configuration for grub with `grub-mkconfig -o /boot/grub/grub.cfg`

Do the usual stuff (locale-gen, set the time, ...)

Note: as with any installation, grub may (or not) crap itself and not use the right UUIDs

# System Configuration

Once the system has booted sucessfully, it needs some tweaking:


```
 * Audio
 * Built-in camera
```

## Intel SST Audio (RT5640)

Follow instructions on Sound folder.

## Built-in camera (I2C)

The model should be **"OV2680"**. There is no driver avaliable for Linux.

Manufacturer: **[OVT] (http://www.ovt.com/products/sensor.php?id=140)**


# Documentation

I would like to thank these sites, as they were very useful because of similarities between both devices:

```
http://www.jfwhome.com/2014/03/07/perfect-ubuntu-or-other-linux-on-the-asus-transformer-book-t100/
http://forums.linuxmint.com/viewtopic.php?f=18&t=201040&p=1052609
http://forums.linuxmint.com/viewtopic.php?f=53&t=204172
https://wiki.debian.org/InstallingDebianOn/Asus/T100TA
https://sturmflut.github.io/linux/ubuntu/2015/02/04/installing-ubuntu-on-baytrail-tablets-version-2/
```


# AUTHORS

```
2015-2016 **Antonio Cao** ([@burzumishi] (https://github.com/burzumishi)) under the **'GNU GPL v2 LICENSE'**.
```

