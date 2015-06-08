#
# Cookbook Name:: sysfs
# Recipe:: default
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

package 'sysfsutils' do
  action :install
end

service 'sysfsutils' do
  supports restart: true, start: true, stop: true
  action :nothing
  subscribes :restart, 'template[/etc/sysfs.conf]', :delayed
end
