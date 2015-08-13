# L7-sysfs cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-sysfs.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-sysfs)
[![security](https://hakiri.io/github/szelcsanyi/chef-sysfs/master.svg)](https://hakiri.io/github/szelcsanyi/chef-sysfs/master)
[![Cookbook Version](https://img.shields.io/cookbook/v/L7-sysfs.svg?style=flat)](https://supermarket.chef.io/cookbooks/L7-sysfs)

## Description

Configures [sysfs](http://en.wikipedia.org/wiki/Sysfs) kernel subsystem control parameters via Opscode Chef in /etc/sysfs.conf

## Supported Platforms

* Ubuntu 12.04+
* Debian 7.0+

## Recipes

* `L7-sysfs` - The default no-op recipe.
* Predefined parameters:
* `L7-sysfs::nic_tuning` - Sets tx queue length to higher value and increase rps queue.
* `L7-sysfs::disk_tuning` - Set io scheduler and rq affinity.
* `L7-sysfs::tsc_clocksource` - Sets clocksource to tsc.
* `L7-sysfs::disable_thp` - Disables transparent huge pages.

## Usage
* name: The sysfs parameter.
* comment: Optional string for identification.
* value: Must be set to proper value.
* immediately: Optional true/false. Sets value at runtime or at the end of chef run.

```ruby
L7_sysfs 'devices/system/clocksource/clocksource0/current_clocksource' do
	comment 'Set clocksource to tsc'
	value 'tsc'
	immediately true
end
```

## TODO

* Rewrite to LWRP

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2015/license.html).
* Copyright (c) 2015 Gabor Szelcsanyi

[![image](https://ga-beacon.appspot.com/UA-56493884-1/chef-sysfs/README.md)](https://github.com/szelcsanyi/chef-sysfs)

