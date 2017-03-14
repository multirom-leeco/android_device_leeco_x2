# MultiRom TWRP Tree for LeEco Le Max 2 (x2)

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

![LeEco Le Max2](http://drop.ndtv.com/TECH/product_database/images/420201665108PM_635_leeco_le_max_2_front.jpeg "LeEco Le Max2")

To initialize your local repository using the Omnirom trees to build TWRP, use a command like this:

	$ repo init -u git://github.com/omnirom/android.git -b android-6.0

Initialize MultiRom trees:

	$ mkdir .repo/local_manifests; curl https://raw.githubusercontent.com/multirom-leeco/local_manifests/master/roomservice.xml > .repo/local_manifests/roomservice.xml

Then to sync up:

	$ repo sync

Full Compilation:

	$ source build/envsetup.sh

	$ lunch omni_x2-userdebug
        
	$ make clean

	$ make recoveryimage
		
	$ make multirom_zip

	$ make multirom_uninstaller


### Credits:

* [@andr68rus] (https://forum.xda-developers.com/member.php?u=7884203) - porting Multirom to LeMax 2

### Thanks to:

* [@Tasssadar] (https://forum.xda-developers.com/member.php?u=3418703) - For his awesome MultiRom

* [@nkk71] (https://forum.xda-developers.com/member.php?u=2605798) - For his No-KEXEC workaround

* [@deadman96385] (https://forum.xda-developers.com/member.php?u=4222965) - For official TWRP for LeMax2 sources

* [@Rishabh Rao] (https://forum.xda-developers.com/member.php?u=5890172) - For sources MultiRom for Le 2, instructions, etc

* [@Martinusbe] (https://forum.xda-developers.com/member.php?u=4139665) - For sources MultiRom for OP3

#### Enjoy it :sunglasses:
