#
# Cookbook Name:: L7-sysfs
# Recipe:: disk_tuning
#
# Copyright 2019, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

# Not in openvz guest
return if File.exist?('/proc/vz')

disks = node['block_device'].select { |d| d =~ /^x?(v|s)d[a-z]/ }
disks.each do |disk|
  if node['virtualization'].any? && node['virtualization']['role'] == 'guest'
    if File.readlines("/sys/block/#{disk.at(0)}/queue/scheduler").grep(/noop/).!empty?
      L7_sysfs "block/#{disk.at(0)}/queue/scheduler" do
        comment "Set disk scheduler to noop on #{disk.at(0)}"
        value 'noop'
      end
    end
  elsif File.exist?("/sys/block/#{disk.at(0)}/queue/rotational") &&
        File.read("/sys/block/#{disk.at(0)}/queue/rotational") == "0\n"
    L7_sysfs "block/#{disk.at(0)}/queue/scheduler" do
      comment "Set disk scheduler to deadline on #{disk.at(0)}"
      value 'deadline'
    end
  end

  L7_sysfs "block/#{disk.at(0)}/queue/rq_affinity" do
    comment "Set disk rq affinity to 2 on #{disk.at(0)}"
    value '2'
  end
end
