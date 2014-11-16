#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

sysfs_parameter '/sys/kernel/mm/transparent_hugepage/enabled' do
  comment 'Disable transparent huge pages'
  value 'never'
  immediately true
end
