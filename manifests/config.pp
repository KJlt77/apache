# Class apache::config description
class apache::config (
  String $configsource = lookup({'name' => 'apache.configsource', 'default_value' => ''}),
  String $configfile   = lookup({'name' => 'apache.configfile', 'default_value' => ''}),
  String $vhostsource  = lookup({'name' => 'apache.vhostsource', 'default_value' => ''}),
  String $vhostfile    = lookup({'name' => 'apache.vhostfile', 'default_value' => ''})
  ) {
  file { 'config-file':
    ensure => file,
    path   => $configfile,
    source => $configsource,
  }

  file { 'vhost-file':
    ensure  => file,
    path    => $vhostfile,
    content => template($vhostsource),
  }
}
