#!/bin/bash

# This script is based on information found at
# http://lonesysadmin.net/2013/03/26/preparing-linux-template/vms/
# Save it in /root
# It should be run before converting a RHEL/CentOS 6 VM into a template.
# Chris Belyea <chris@chrisbelyea.com>

# Clean yum cache
/usr/bin/yum clean all

# Force log rotation
/usr/sbin/logrotate -f /etc/logrotate.conf
/bin/rm -f /var/log*-???????? /var/log/*.gz

# Clear audit log & wtmp
/bin/cat /dev/null > /var/log/audit/audit.log
/bin/cat /dev/null > /var/log/wtmp

# Remove udev persistent device rules
/bin/rm -f /etc/udev/rules.d/70*

# Remove ifcfg-eth files
/bin/rm -f /etc/sysconfig/network-scripts/ifcfg-eth*

# Clean /tmp
/bin/rm -rf /tmp/*
/bin/rm -rf /var/tmp/*

# Remove SSH host keys
/bin/rm -f /etc/ssh/*key*

# Remove root's shell history
/bin/rm -f ~root/.bash_history
unset HISTFILE

# Shut down
shutdown -h now
