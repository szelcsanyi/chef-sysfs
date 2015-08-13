#
# Cookbook Name:: L7-sysfs
# Recipe:: disable_thp
#
# Copyright 2015, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

L7_sysfs 'kernel/mm/transparent_hugepage/enabled' do
  comment 'Disable transparent huge pages'
  value 'never'
end

L7_sysfs 'kernel/mm/transparent_hugepage/defrag' do
  comment 'Disable transparent huge pages defrag'
  value 'never'
end
