#!/bin/bash

# Clear log files older than 7 days
find /var/log -type f -mtime +7 -exec rm {} \;

# Remove unnecessary packages
apt-get autoremove

# Optimize memory usage
sysctl vm.swappiness=10
sysctl vm.vfs_cache_pressure=50

# Monitor system performance
top -b -n 1 > /var/log/top.log
iostat -x > /var/log/iostat.log
vmstat 1 10 > /var/log/vmstat.log