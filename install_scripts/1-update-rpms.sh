#!/bin/sh
#
# Upgrade the system.
#

rpm -ivh rpmforge-release-0.5.3-1.el5.rf.$(uname -i).rpm || exit 1

yum -y update
