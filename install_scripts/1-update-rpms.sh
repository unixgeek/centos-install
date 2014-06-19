#!/bin/sh
#
# Upgrade the system.
#

rpm -ivh rpmforge-release-0.5.3-1.el6.rf.$(uname -m).rpm || exit 1

yum -y update
