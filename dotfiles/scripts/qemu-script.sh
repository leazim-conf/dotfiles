CDROM=$1
DISK=$2
RAM=$3

qemu-system-x86_64 \
  -enable-kvm \
  -smp 4 \
  -hda $DISK \
  -m $RAM \
  -serial stdio \
  -cdrom $CDROM \
