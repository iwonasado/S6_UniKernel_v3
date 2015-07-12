#!/system/bin/sh

# Tweak VM & Swap
echo "140"	> /proc/sys/vm/swappiness
echo "140"	> /sys/fs/cgroup/memory/sw/memory.swappiness
echo "30"	> /proc/sys/vm/vfs_cache_pressure
echo "500"	> /proc/sys/vm/dirty_writeback_centisecs
echo "1000"	> /proc/sys/vm/dirty_expire_centisecs
echo "35"	> /sys/module/zswap/parameters/max_pool_percent

# Set bigger swap
swapoff /dev/block/vnswap0
echo "1932735283" > /sys/block/vnswap0/disksize
mkswap /dev/block/vnswap0
swapon /dev/block/vnswap0

#  Start SuperSU daemon
#  Wait for 5 seconds from boot before starting the SuperSU daemon
sleep 5
/system/xbin/daemonsu --auto-daemon &

#  Set interactive governor tuning
#  Wait for 15 seconds from boot so we can ovverride TouchWiz's overrides
sleep 10

#set apollo interactive governor
echo "20000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo "80000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo "90" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo "1296000"	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo "55000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo "85" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo "30000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo "80000" 	> /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack


#set atlas interactive governor
echo "20000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo "80000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
echo "90" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo "1800000"	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo "55000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo "85" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo "35000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo "80000" 	> /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack

