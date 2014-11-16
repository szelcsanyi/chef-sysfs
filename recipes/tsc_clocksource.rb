#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

sysfs_parameter "devices/system/clocksource/clocksource0/current_clocksource" do
  comment "Set clocksource to tsc"
  value "tsc"
  immediately true
end
