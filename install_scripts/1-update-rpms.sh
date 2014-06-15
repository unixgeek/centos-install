#!/bin/sh
#
# Upgrade the system.
#

cp -f conf/CentOS-Base.repo /etc/yum.repos.d

rpm -ivh rpmforge-release-0.5.3-1.el4.rf.$(uname -i).rpm || exit 1

yum -y update
