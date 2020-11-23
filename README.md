# Dotfiles

## Install

```
$ sudo apt install ruby
$ rake install
```

## Debian Buster Setup

### Initial Setup

Using minmal netinst image:

```
* hostname: name.bayprogrammer.com
* root pw: leave blank to disable
* obvious things for normal user & timezone
* disk: guided, use entire disk
  - all files on one partition
* mirror: osuosl.org
* usage survey participation: yes!
* software to install:
[ ] Debian desktop environment
[ ] ... GNOME
[ ] ... Xfce
[ ] ... KDE
[ ] ... Cinnamon
[ ] ... MATE
[ ] ... LXDE
[ ] Web server
[ ] Print server
[*] SSH server
[*] Standard system utilities
* obvious things for completing the install
```

### Bootstrap

```
$ cd $HOME/dev/antifragile
$ rake bootstrap

### Raspbian Supplemental Notes

Set overscan, screen blanking, opengl fake-kms, 104 us english keyboard,
us.utf8, timezone.

```
$ sudo raspi-config
$ sudo reboot
```

Convert `pi` user to actual user:

```
$ exec sudo -s
# cd /
# usermod -l zebdeos -d /home/zebdeos -m pi
# kill -9 {blocking pid} && usermod -l zebdeos -d /home/zebdeos -m pi
# groupmod --new-name zebdeos pi
# passwd zebdeos
# passwd -l root
# vi /etc/ssh/sshd_config

    PermitRootLogin no

# systemctl enable ssh
# hostnamectl set-hostname <hostname>
# vi /etc/hosts

    127.0.1.1    <hostname>.bayprogrammer.com <hostname>

# reboot

Install software following general outline contained in debian bootstrap task.

#### Mount Raspbian IMG

If you need to mount the disk image (adjust actual offset according to the
actual image):

```
$ fdisk -l
$ sudo mount -o offset=$((512 * 532480)) /path/to/rpi.img /mnt
```
