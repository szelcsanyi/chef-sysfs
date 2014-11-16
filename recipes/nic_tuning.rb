#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

interfaces = node['network']['interfaces'].select { |i| i =~ /^eth/ }

interfaces.each do |interface|

  sysfs_parameter "class/net/#{ interface.at(0) }/tx_queue_len" do
    comment "Increase txqueulen of network card #{ interface.at(0) }"
    value '10000'
  end

  sysfs_parameter "class/net/#{interface.at(0)}/queues/rx-0/rps_cpus" do
    comment "Cpu mask for Receive Packet Steering on #{interface.at(0)}"
    value '0xf'
  end

  sysfs_parameter "class/net/#{ interface.at(0) }/queues/rx-0/rps_flow_cnt" do
    comment "Flow count for Receive Packet Steering on #{ interface.at(0) }"
    value '32768'
  end

end
