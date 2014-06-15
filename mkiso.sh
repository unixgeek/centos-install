#!/bin/sh

mkisofs -r -R -V "CentOS Install" -o kickstart.iso install_scripts/ kickstart/
