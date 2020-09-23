require 'beaker-rspec'

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  foss_opts = {:default_action => 'gem_install'}
  
  if default.is_pe?; then
    installe_pe;
  else
    install_puppet(foss_opts)
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(file.join(File.dirname(__FILE__), '..'))
  
  # Readable test descriptions
  cformatter = :documentation
  
  # Configure all nodes in nodeset
  c.before :suite do
    hosts.each do |host|
	  if fact_on(host, 'osfamily') == 'RedHat'
	    on host, "rpm -ihv https://yum.puppetlabs.com/puppet6-release-el-7.noarch.rpm; yum -y install puppet-agent"
	  elsif fact_on(host, 'osfamily') == 'Debian'
	    on host, "wget https://apt.puppetlabs.com/puppet6-release-focal.deb -P /tmp; dpkg -i /tmp/puppet6-release-focal.deb; apt update; apt -y install puppet-agent"
	  end
	  on host, "export PATH=$PATH:/opt/puppetlabs/bin"
	  scp_to host, "#{proj_root}", "/etc/puppetlabs/code/modules/"
	end
  end
end