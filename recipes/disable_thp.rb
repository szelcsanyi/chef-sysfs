#
# Cookbook Name:: L7-sysfs
# Recipe:: disable_thp
#
# Disables transparent hugepages
#
# Copyright 2019, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

if File.exist?('/sys/kernel/mm/transparent_hugepage/enabled')
  L7_sysfs 'kernel/mm/transparent_hugepage/enabled' do
    comment 'Disable transparent huge pages'
    value 'never'
  end
end

if File.exist?('/sys/kernel/mm/transparent_hugepage/defrag')
  L7_sysfs 'kernel/mm/transparent_hugepage/defrag' do
    comment 'Disable transparent huge pages defrag'
    value 'never'
  end
end
