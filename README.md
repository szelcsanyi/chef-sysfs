# sysfs cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-sysfs.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-sysfs)

## Description

Configures [sysfs](http://en.wikipedia.org/wiki/Sysfs) kernel subsystem control parameters via Opscode Chef in /etc/sysfs.conf

## Supported Platforms

* Ubuntu
* Debian

## Recipes

* `sysfs` - The default no-op recipe.
* Predefined parameters:
* `sysfs::nic_tuning` - Sets tx queue length to higher value and increase rps queue.
* `sysfs::tsc_clocksource` - Sets clocksource to tsc.
* `sysfs::disable_thp` - Disables transparent huge pages.

## Usage
* name: the sysfs parameter
* comment: optional string for identification
* value: must be set to proper value
* immediately: (true/false) set value at runtime or at the end of chef run

```ruby
sysfs_parameter "devices/system/clocksource/clocksource0/current_clocksource" do
	comment "Set clocksource to tsc"
	value "tsc"
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

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2014/license.html).
* Copyright (c) 2014 Gabor Szelcsanyi

[![image](https://ga-beacon.appspot.com/UA-56493884-1/chef-sysfs/README.md)](https://github.com/szelcsanyi/chef-sysfs)

