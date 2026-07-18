### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Zorix-kernel
kernel.revision=1.0
kernel.compiler=Google clang 22.0.0
kernel.made=Lucifer
anykernel3.made=osm0sis @ xda-developers
do.devicecheck=1
do.cleanup=1
device.name1=haydn
device.name2=haydnin
device.name3=haydnpro
supported.versions=15-17
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
NO_BLOCK_DISPLAY=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot;

write_boot;
## end boot install

# vendor_boot shell variables
BLOCK=vendor_boot
NO_BLOCK_DISPLAY=1;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;

flash_boot;
## end vendor_boot install
