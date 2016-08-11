#!/usr/bin/bash

for node in {a..h};
do
./testExpect.sh /dev/sd$node;
mkfs.ext4 /dev/sd$node'1';
done

rm -rf /mnt/*
for i in {1..8}
do
mkdir -p /mnt/disk$i;
done

mount /dev/sda1 /mnt/disk1
mount /dev/sdb1 /mnt/disk2
mount /dev/sdc1 /mnt/disk3
mount /dev/sdd1 /mnt/disk4
mount /dev/sde1 /mnt/disk5
mount /dev/sdf1 /mnt/disk6
mount /dev/sdg1 /mnt/disk7
mount /dev/sdh1 /mnt/disk8

for i in {1..8}
do
rm -rf /mnt/disk$i/*
done
#auto mount after reboot
echo "/dev/sda1       /mnt/disk1       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdb1       /mnt/disk2       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdc1       /mnt/disk3       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdd1       /mnt/disk4       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sde1       /mnt/disk5       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdf1       /mnt/disk6       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdg1       /mnt/disk7       ext4    defaults     0       0" >> /etc/fstab
echo "/dev/sdh1       /mnt/disk8       ext4    defaults     0       0" >> /etc/fstab

df -h
