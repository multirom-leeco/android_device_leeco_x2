# MultiRom TWRP Tree for LeEco Le Max 2 (x2)
==============

The LeEco Le Max 2 (x2) is a smartphone from LeEco or LeMobile Information Technology Co. Ltd.

Device configuration for Le Max 2 (x2)
=====================================

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Dual-core 2.15GHz Kryo & dual-core 1.6GHz Kryo
CHIPSET | Qualcomm MSM8996 Snapdragon 820
GPU     | 624MHz Adreno 530
Memory  | 4/6 GB
Shipped Android Version | 6.0
Storage | 64/128 GB
Battery | 3100 mAh (non-removable)
Dimensions | 156.8 x 77.6 x 7.99 mm
Display | 1440 x 2560 pixels, 5.7" AMOLED
Rear Camera  | 21.0 MP, LED flash
Front Camera | 8.0 MP
Release Date | April 2016

![Le X820](http://img2.hdletv.com/file/20160905/default/12511498927079974 "Le X820")

To initialize your local repository using the OMNIROM trees to build TWRP, use a command like this:

	$ repo init -u git://github.com/omnirom/android.git -b android-6.0

Initialize MultiRom trees:

	$ mkdir .repo/local_manifests; curl https://raw.githubusercontent.com/multirom-x2/local_manifests/master/x2.xml > .repo/local_manifests/x2.xml

Then to sync up:

	$ repo sync

Full Compilation:

	$ source build/envsetup.sh

	$ lunch omni_x2-userdebug
        
	$ make clean

	$ make recoveryimage
		
	$ make multirom_zip

	( If you get error, look at this pull request: https://github.com/Tasssadar/multirom_adbd/pull/2/commits/b7395a7f8b397e75024610e2f3c965bb90fbd2e7 )

	$ make multirom_uninstaller


=== Credits:

andr68rus - porting Multirom to LeMax 2

=== Thanks to:

Tasssadar - For his awesome MultiRom

nkk71 - For his No-KEXEC workaround

deadman96385 - For official TWRP for LeMax2 sources

Rishabh Rao - For sources MultiRom for Le 2, instructions, etc

Martinusbe - For sources MultiRom for OP3

Enjoy it ;)
