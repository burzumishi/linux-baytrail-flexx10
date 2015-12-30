```
   ___________________________________________________
 //                                                   \\
[|                                                     |]
[|  linux-baytrail-flexx10                             |]
[|                                                     |]
[|  Install GNU/Linux on NextBook Flexx 10.1 Baytrail  |]
[|                                                     |]
[|                                                     |]
[|                Antonio Cao (@burzumishi) 2015-2016  |]
[|                                                     |]
 \\___________________________________________________//
```

# Introduction

This project is an efford to get *Debian GNU/Linux* running on *NextBook Flexx 10.1*, an Intel Atom Bay Trail device.

It should work for Ubuntu or any other Debian based distribution.


## System Hardware Summary

http://nextbookusa.com/productdetail.php?product_id=26


## Hardware

```
- CPU: Intel Atom Bay Trail Z3735F 
- Video card: Intel HD Graphics (Atom Processor Z36xxx/Z37xxx Series Graphics & Display) 
- Screen: 10.1" - I2C HID v1.00 Device [FTSC1000:00 2808:1015] on i2c-FTSC1000:00
- Wireless card: Realtek RTL8723BS Wireless LAN 80211n SDIO Network Adapter
- Disks: mmcblk0: mmc0:0001 NCard  28.9 GiB 
- RAM: LPDDR3 1067 2GB (on-board) 
- Bluetooth: Realtek RTL8723BS_BT
```

https://github.com/burzumishi/linux-baytrail-flexx10/wiki/Sytem-Hardware


## Project Status

 * Boot Standard Kernel {OK}
 * Detect hard drives {OK}
 * Shutdown /!\
 * Reboot /!\
 * Hibernation /!\
 * Sleep / Suspend /!\
 * Battery monitor /!\
 * Xorg&XWayland {OK}
   - OpenGL {OK}
   - Resize-and-Rotate(randr) {i}
 * Screen backlight /!\
 * Light sensor /!\
 * Switch to External Screen (HDMI) [?]
 * Mouse
   - Built-in (Touchpad) {OK}
   - Built-in (Touchscreen) {OK}
 * Bluetooth {i} /!\
 * Wireless/Wifi {i} X-(
 * Keyboard's Hotkeys [?]
 * Sound {i} X-(
 * MicroSD card reader [?]
 * Built-in camera {X}
 * Accelerometers {i}

Legend : {OK} = OK ; {X} Unsupported(No Driver) ; /!\ = Error (Couldn't get it working); [?] Unknown, Not Test; [-] Not-applicable; {i} = Configuration Required;  X-( = Only works with a non-free driver and or firmware





# Repositories

```
Linux Kernel:     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
Linux Firmware:   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
Power Management: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
Intel ASoC:       https://git.kernel.org/pub/scm/linux/kernel/git/lrg/asoc.git
Thermal SoC:      https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git
TI Thermal SoC:   https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/ti-soc-thermal.git
WiFi:             https://github.com/hadess/rtl8723bs
Bluetooth:        https://github.com/lwfinger/rtl8723bs_bt
Sound ASoC:       https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
```

# Installation

```
 * Requirements
 * Important Notes
 * BIOS Access
 * To Turn "Fast Startup" On or Off in System Settings
 * Create USB Media
 * Booting the Live Image
 * Installing Linux
 * First boot
```


## Requirements

```
A BayTrail tablet.
An USB storage medium to boot from.
Optional: A storage medium (USB, SD-Card etc.) big enough to back up the Windows installation. I used a USB hard drive.
Rufus: http://rufus.akeo.ie
```

## Important Notes


{i} The following information and procedures are mostly extracted from the T100TA model and adappted to the Flexx10. The T100TA has an hardware similar to that one of the Flexx10, informations and procedures regarding these two models can be usefully shared.

/!\ /!\ /!\ There is a grave issue in linux kernel > 4.3 (now available only in Debian Jessie) with CPU C-states which causes instability during mmc data operations, leading possibly to data loss and file system corruption. In linux kernel 4.2 the problem still persists and a workaround is proposed in the Power Management section, make sure to apply it also during the installation.

{i} Before installing Debian, Secure Boot needs to be disabled. Also, if dual-booting with Windows 8 it is recommended to disable its fast boot feature.

{i} Although the Debian Jessie (stable) installer includes all the needed modules and core changes to install and boot on this machine, it is advisable to install Debian Stretch (testing) and keep it up to date due to a lot of components still unsupported. If you really want to install Debian Jessie (stable) at least you can use the backport repository to install the latest kernels and firmwares when available.

{i} In order to install Debian using the internet (e.g. with a netinst image) the wifi has to be enabled. See the steps described in the WiFi section, prepare the needed firmware (see also the d-i manual Loading Missing Firmware) and reproduce the steps using a shell during the installation procedure.

{i} The Flexx 10.1 is a mixed mode EFI system (i.e. a 64-bit CPU combined with a 32-bit EFI) without any legacy BIOS mode. By default, the Debian i386 installer images should boot on this machine via UEFI and let you install a complete 32-bit (i386) system. If you use the multi-arch amd64/i386 netinst or DVD image, you will also be able to install in 64-bit mode. You might expect slightly better performance that way, but the limited memory on the machine (2 GiB) maybe will become more of an issue. Multi-arch DVD images must be modified before booting.


## BIOS Access

1. To disable Secure Boot press F2 when the laptop is starting. You should get a BIOS-alike configuration application where Secure Boot may be disabled (Security tab).

    NOTE: that on Flex 10 you have to press Fn + F2 to get the F2 functionality, not some desktop config button. 

2. You have to go to pc settings via the charms bar ( bar on the right that pops up on desktop ) then General -> advanced startup-> restart. it will boot up into a blue screen with some options, select troubleshoot, then there should be a bios or uefi restart option, wording differs slightly based on hardware.

Or just open a cmd prompt and type: shutdown.exe /r /o

That will restart into the blue screen with options. 


### To Turn "Fast Startup" On or Off in System Settings

```
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
```

### Create USB Media

Use Rufus with GPT Partition Table layout and formated with FAT32 to create a USB install disk. 

Copy grubia32.efi in D:\efi\grub\

NOTE: Do not overwrite grubx64.efi or grub.efi!


### Booting Installation or Live Image

Now, insert the USB stick and reboot to the firmware (BIOS). You can do this in Windows by holding shift when pressing “restart”, then touching Troubleshoot → Advanced Options → UEFI Firmware Settings → Restart.

Once there, disable SecureBoot, then visit the boot options, and ensure the USB stick is the first in the list.

Press F10 to save settings, and after a few seconds you will be in the GRUB bootloader. 

Then press F10 to boot. You should get all the way to the Installation or Desktop.


### Installing Linux

The partitioning scheme you choose is up to you — but you will need to preserve the EFI partition, so don’t just partition the entire disk for Linux.

In addition to the EFI partition, I prefer separate /, /home and /boot mount points; but that is up to you. You could squish down the Windows partition and created the additional partition(s), or just delete the Windows partition altogether if you don’t need it (not recommended).

When done, reboot, leaving the USB stick in.


### First boot

Linux won’t boot yet ;(

Boot back to the Grub welcome screen on the USB stick. Hit ‘c’ to drop to a Grub command line.

You’ll need to provide Grub with the path to your kernel and initrd to boot. First, the path to the kernel:

linux (hd1,gpt5)/boot/vmlinuz-3.13-xxxx root=/dev/mmcblk0p5 quiet intel_pstates=disabled

Here, (hd1, gpt5) refers to the fifth partition on the third disk (Partition numbering begins at 1 and disk numbering begins at 0). This will vary depending on how yo uinstalled and your Flexx model. On my 32GB model, Grub assigns the USB stick as hd0, the read-only recovery flash chip as hd1, and the main internal flash as hd1. gpt5 is the fifth partition, but it will depend on how you installed.

Fortunately, grub has good auto-completion features, so you can hit twice as you type, and grub will list possible completions for you — just keep trying until you see the various vmlinuz kernels.

The root=/dev/mmcblk0p5 will also depend on the partition you installed to. It will be your root partition. Unfortunately this can’t be auto-completed, so if you can’t remember your partition setup, you’ll need to try by trial and error.

To complete the line, press Enter.

Then you need to specify the location of your initrd. This is easy, it’s in the same place as the kernel:

initrd (hd1,gpt5)/boot/initrd-3.13-xxxx

Then Enter.

Then boot with: boot

With luck after hitting Enter, you’ll boot through to Linux. If not, don’t be disheartened — keep trying, at this point your system is installed, review your settings.


# System Configuration

Once the system has booted sucessfully, it needs some tweaking:


```
 * WiFi
 * Kernel
 * Bootloader
 * Power Management
 * Status, Intel Crystal Cove PMIC
 * Screen brightness
 * CPU C-states issue with the internal eMMC
 * Touchscreen
 * Audio
 * microSD Card Reader
 * Built-in camera
```

## WiFi

The wifi device is an on-board SDIO device Realtek R8723BS, firmware and module required.

Grab the latest sources from git or download the zip file from: https://github.com/hadess/rtl8723bs

Once downloaded build it:

```
apt-get install build-essential
cd rtl8723bs 
make
make install
depmod -a
stop network-manager
modprobe r8723bs
start network-manager
```

If you need to build wifi again you can use:

scripts/install_rtl8723bs_debian.sh

NOTE: Wifi and a network conection are required to continue!


## Kernel (GIT)

The best option is to upgrade the kernel to the latest review published in github.

You can use this script to download all required dependencies, sources and patches:

scripts/kernel_git.sh

Once you have downloaded the kernel copy the configuration file from: 

```
cp kernel/config-4.3.3-rc7-flexx10 /your/kernel/source/.config
cd source
make menuconfig
make -j 4 deb-pkg
```

Be patient this task takes about 3 or 4 hours, when it's finished you will get the debian package files:

```
../linux-firmware-image-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb
../linux-headers-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb
../linux-image-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb
../linux-image-4.4.0-rc7+-dbg_4.4.0-rc7+-1_amd64.deb
../linux-libc-dev_4.4.0-rc7+-1_amd64.deb
```

Install all packages except "dbg":

```
dpkg -i linux-firmware-image-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb linux-headers-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb linux-image-4.4.0-rc7+_4.4.0-rc7+-1_amd64.deb linux-libc-dev_4.4.0-rc7+-1_amd64.deb
```

NOTE: REBUILD WIFI MODULE!

## Bootloader (GRUB)

In order to boot up your system properly, it's needed to update GRUB's bootloader files and config:

```
# apt-get install grub-efi-ia32-bin
# grub-install --target i386-efi
```

We want to copy the grubia32.efi from there to the location Debian created during installation:

```
# cd /boot/efi/EFI
# sudo cp grub/grubia32.efi debian/grubia32.efi
```

This should be enough to allow you to boot from the “debian” option in your EFI firmware.

Before you boot, let’s add the default command line options to Grub.

Open /etc/default grub in a text editor:

```
sudo nano /etc/default/grub
```

And edit the GRUB_CMDLINE_LINUX_DEFAULT exactly as we did before. When done, hit ctrl-o to save then ctrl-x to exit. Then, to update Grub:

```
sudo update-grub
```

Congratulations! you should now be able to boot/reboot directly to Debian!

GRUB will not boot until you save the devices boot order from UEFI BIOS, this may be a bug in the BIOS firmware.


## Power Management

Status, Intel Crystal Cove PMIC

The power management integrated circuit (PMIC) of the Intel Baytrail is called Crystal Cove. Full support for this PMIC is not yet available with kernel linux 4.2, so suspend to ram, hibernation and screen brightness controll does not work.

Suspend to RAM does not work and sends the machine into a state from which one can only recover by forcing the shutdown. Hibernation partially works as it, like the suspend, requires to force the shutdown and at the following boot the system recovers from the hibernation but with some glitches. Some suggestions are discussed in this thread.


## Screen brightness

Because the Crystal Cove PMIC is not yet fully supported the brightness level of the screen cannot be adjusted and it is locked at the maximum value. Some patches are discussed in this discussion.

However xrandr allows to change the brightness of the screen with a software only modification:

```
$ man xrandr

[...]

--brightness brightness

    Multiply the gamma values on the crtc currently attached to the output to specified floating value.
    Useful for overly bright or overly dim outputs. However, this is a software only modification, if 
    your hardware has support to actually change the brightness, you will probably prefer to use xbacklight.
```

meaning that it does not dim the backlight and therefore it does not reduce power consumption. The syntax is:

```
$ xrandr --output <OUTPUT> --brightness <VALUE>
```

where the <OUTPUT> can be found with:

```
$ xrandr | grep -w connected | cut -d" " -f1
```

and the <VALUE> should be something between 0 and 1. For example:

```
$  xrandr --output DSI1 --brightness 0.8
```

The script brightness_ctl.Stretch_flexx10.sh makes use of the command above to progressively reduce the screen brightness.


## CPU C-states issue with the internal eMMC

This issue causes instability during mmc data operations, leading possibly to data loss and file system corruption, and it is discussed in this thread and a patch seems to be already proposed in this discussion. However a proper fix doesn't seem to be available yet. As a workaround it is necessary to boot the system with the kernel parameter:

```
intel_idle.max_cstate=0 intel_pstates=disabled
```

Check this post for further suggestions and instruction. Please be aware that using this workaround can impact on the battery duration, but it is better than lose data.

## Touchscreen

Intel Graphics using i915 driver, X.org works.

The accelerometers are not supported yet, therefore the screen can only be manually rotated using xrandr. However the touchscreen inputs also have to be manually adjusted with xinput to be coherent with the rotations. 

For an example see the script ts_rotate.Stretch_flex10.sh.

The accelerometers work as of at least linux-image-4.3.0-rc3-amd64.

The touchscreen is identified as FTSC1000:
```
$ xinput
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ FTSC1000:00 2808:1015                   	id=9	[slave  pointer  (2)]
⎜   ↳ SINO WEALTH USB KEYBOARD                	id=8	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Video Bus                               	id=6	[slave  keyboard (3)]
    ↳ gpio-keys                               	id=10	[slave  keyboard (3)]
    ↳ SINO WEALTH USB KEYBOARD                	id=7	[slave  keyboard (3)]
```

## Audio

The device is an Intel SST Audio / Realtek RT5640. The firmware can be installed with:

```
# apt-get install firmware-intel-sound
```
  
However a manual configuration of the device is still required. It is possible to do it using alsactl (available in the package alsa-utils) and a proper configuration file. The T100 Ubuntu community on G+ has many configuration files you can try but this one seems to work well. Download and apply the configuration file in this way:

```
# cp t100_B.state /var/lib/alsa/asound.state
# alsactl restore
```

Please be aware that there are reports indicating that in some cases the sound can be distorted and the speakers can be even damaged if the volume is high. Be careful in doing tests. Headphones work too but switching from the speaker is not automatic, it can be done using the audio manager of the DE or a dedicated application like pavucontrol.

For the linux kernel 3.16 in Debian Jessie use the firmware and the alsa configuration files available here. However, as suggested in the important notes above, it is not advisable to use this kernel due to a lot of components unsupported.


## microSD Card Reader

The following action allows the card reader to work:

```
# echo 'options sdhci debug_quirks=0x8000' | tee /etc/modprobe.d/sdhci.conf > /dev/null
# update-initramfs -u -k all
```

After a reboot the card reader should be working.

To use the microSD card reader for the installation procedure, or at the first boot of the system, at boot edit the GRUB menu entry and add to the linux line the option sdhci.debug_quirks=0x8000.


## Built-in camera

The model should be "xxxxxxx". Further information has to be retrieved.


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
Antonio Cao (@burzumishi) 2015-2016
```

