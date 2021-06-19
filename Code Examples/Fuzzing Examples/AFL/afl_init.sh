#!/usr/bin/bash

cd /sys/devices/system/cpu
sudo echo performance | tee cpu*/cpufreq/scaling_governor
sudo echo core >/proc/sys/kernel/core_pattern
