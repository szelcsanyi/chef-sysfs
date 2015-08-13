#
# Cookbook Name:: L7-sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2015, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

L7_sysfs 'devices/system/clocksource/clocksource0/current_clocksource' do
  comment 'Set clocksource to tsc'
  value 'tsc'
  immediately true
end
