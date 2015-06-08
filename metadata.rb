maintainer       'Gabor Szelcsanyi'
maintainer_email 'szelcsanyi.gabor@gmail.com'
license          'MIT'
description      'Configures sysfs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             'sysfs'
version          '0.0.2'

%w( ubuntu debian ).each do |os|
  supports os
end
