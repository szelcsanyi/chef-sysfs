#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

disks = node['block_device'].select { |d| d =~ /^xvd/ }
disks.each do |disk|

  if node['virtualization'].any? && node['virtualization']['role'] == 'guest'
    sysfs_parameter "block/#{ disk.at(0) }/queue/scheduler" do
      comment "Set disk scheduler to noop on #{ disk.at(0) }"
      value 'noop'
    end
  end

  sysfs_parameter "block/#{ disk.at(0) }/queue/rq_affinity" do
    comment "Set disk rq affinity to 2 on #{ disk.at(0) }"
    value '2'
  end

end
