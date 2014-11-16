#
# Cookbook Name:: sysfs
# Recipe:: tsc_clocksource
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

interfaces = node['network']['interfaces'].select {|i| i =~ /^eth/}

interfaces.each do |interface|
  sysfs_parameter "class/net/#{interface}/tx_queue_len" do
    comment "Increase txqueulen of network card #{interface}"
    value "10000"
  end
end
