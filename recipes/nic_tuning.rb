#
# Cookbook Name:: L7-sysfs
# Recipe:: nic_tuning
#
# Copyright 2015, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

# Not in openvz guest
return if File.exist?('/proc/vz')

interfaces, _info = node['network']['interfaces'].select do |_i, i_info|
  i_info.include?('encapsulation') && i_info['encapsulation'] == 'Ethernet'
end

cpumask = (2**[node['cpu']['total'], 32].min - 1)
if cpumask > 0
  rxmask = (cpumask >> (node['cpu']['total'] / 2)) & cpumask
  txmask = (cpumask << (node['cpu']['total'] / 2)) & cpumask
end

interfaces.each do |interface|
  L7_sysfs "class/net/#{interface.at(0)}/tx_queue_len" do
    comment "Increase txqueulen of network card #{interface.at(0)}"
    value '5000'
  end

  if cpumask > 0
    L7_sysfs "class/net/#{interface.at(0)}/queues/rx-0/rps_cpus" do
      comment "CPU mask for Receive Packet Steering on #{interface.at(0)}"
      value rxmask.to_s(16)
    end

    L7_sysfs "class/net/#{interface.at(0)}/queues/tx-0/xps_cpus" do
      comment "CPU mask for Transmit Packet Steering on #{interface.at(0)}"
      value txmask.to_s(16)
    end
  end

  L7_sysfs "class/net/#{interface.at(0)}/queues/rx-0/rps_flow_cnt" do
    comment "Flow count for Receive Packet Steering on #{interface.at(0)}"
    value '32768'
  end
end
