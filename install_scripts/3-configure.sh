#!/bin/sh
#
# For some of these we should be copying the config instead of patching...
#

patch -d / -p0 -i ${PWD}/patches/logrotate.conf.patch
patch -d / -p0 -i ${PWD}/patches/logrotate.d.syslog.patch
patch -d / -p0 -i ${PWD}/patches/rsyslog.conf.patch
patch -d / -p1 -i ${PWD}/patches/ssh.sshd_config
patch -d / -p1 -i ${PWD}/patches/sudoers.patch

chkconfig sshd on

rm -fr /var/log/*
mkdir /var/log/rotated

