#require 'spec_helper'
#
#describe 'apache::config' do
#  context 'apache config on RedHat systems' do
#    let(:facts) {{ :osfamily => 'RedHat' }}
#	hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
#	apachepackagename = hiera.lookup('apache.packagename', nil, { '::osfamily' => 'RedHat' })
#	let(:params) {{ :packagename => apachepackagename }}
#	
#    it { is_expected.to contain_package('apache-package').with({ :name => 'httpd' }) }
#  end
#
#  context 'apache config on Debian systems' do
#    let(:facts) {{ :osfamily => 'Debian' }}
#	hiera = Hiera.new(:config => 'spec/fixtures/hiera.yaml')
#	apachepackagename = hiera.lookup('apache.packagename', nil, { '::osfamily' => 'Debian' })
#	let(:params) {{ :packagename => apachepackagename }}
#	
#    it { is_expected.to contain_package('apache-package').with({ :name => 'apache2' }) }
#  end
#end
#
#String $configsource = lookup({'name' => 'apache.configsource', 'default_value' => ''}),
#  String $configfile   = lookup({'name' => 'apache.configfile', 'default_value' => ''}),
#  String $vhostsource  = lookup({'name' => 'apache.vhostsource', 'default_value' => ''}),
#  String $vhostfile    = lookup({'name' => 'apache.vhostfile', 'default_value' => ''})