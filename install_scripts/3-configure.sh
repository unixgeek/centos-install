#!/bin/sh
#
# Apply configuration patches.
#

patch -d / -p1 -i ${PWD}/patches/logrotate.conf.patch
patch -d / -p1 -i ${PWD}/patches/logrotate.d.syslog.patch
patch -d / -p1 -i ${PWD}/patches/profile.patch
patch -d / -p1 -i ${PWD}/patches/ssh.sshd_config
patch -d / -p1 -i ${PWD}/patches/sudoers.patch
patch -d / -p1 -i ${PWD}/patches/syslog.conf.patch

chkconfig sshd on

rm -fr /var/log/*
mkdir /var/log/rotated

