#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

disks = node['block_device'].select { |d| d =~ /^xvd/ }
disks.each do |disk|

  if node["virtualization"].any? and node['virtualization']['role'] == 'guest' then
    sysfs_parameter "block/#{ disk }/queue/scheduler" do
      comment "Set disk scheduler to noop on #{ disk }"
      value 'noop'
    end
  end

  sysfs_parameter "block/#{ disk }/queue/rq_affinity" do
    comment "Set disk rq affinity to 2 on #{ disk }"
    value '2'
  end

end
