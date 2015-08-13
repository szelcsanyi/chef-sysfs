# Copyright 2015, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

define :L7_sysfs, comment: '', immediately: false do

  t = nil
  begin
    t = resources(template: '/etc/sysfs.conf')
  rescue Chef::Exceptions::ResourceNotFound
    t = template '/etc/sysfs.conf' do
      mode '0644'
      owner 'root'
      group 'root'
      source 'etc/sysfs.conf.erb'
      cookbook 'L7-sysfs'
      variables(parameters: [])
    end
  end

  t.variables[:parameters] = t.variables[:parameters].reject do
    |h| params[:name] == h[:name]
  end << {
    name: params[:name],
    value: params[:value],
    comment: params[:comment]
  }

  paramfile = '/sys/' + params[:name]

  if params[:immediately]
    r = execute "Set sysfs value for #{params[:name]} to #{params[:value]}" do
      Chef::Log.info("Sysfs: Setting #{params[:name]} to #{params[:value]}")
      command "/bin/echo #{params[:value]} > #{paramfile}"
      action :nothing
      only_if do
        File.exist?(paramfile) && File.read(paramfile).strip != params[:value]
      end
    end
    r.run_action(:run)
  end

end
