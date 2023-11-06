#!/bin/bash

total_disk_size=$(df -h --output=size / | awk 'NR==2 {print $1}')
used_disk_space=$(df -h --output=used / | awk 'NR==2 {print $1}')
total_ram_size=$(free -g --total | awk 'NR==2 {print $2}')
used_ram=$(free -g | awk 'NR==2 {print $3}')
total_cpu_cores=$(grep -c ^processor /proc/cpuinfo)
used_cpu_cores=$(grep 'cpu' /proc/stat | awk '{print $2}' | paste -sd+ - | bc)
cpu_frequency=$(lscpu | grep "CPU MHz" | awk '{print $3 / 1000}')
echo "Total Disk Size: $total_disk_size GB / Used: $used_disk_space"
echo "Total RAM Size: $total_ram_size GB / Used: $used_ram GB"
echo "Total CPU Cores: $total_cpu_cores / Used: $used_cpu_cores"
echo "CPU Frequency: $cpu_frequency GHz"
