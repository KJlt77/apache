# Class apache::parameters description
class apache::parameters {
  if $::osfamily == 'RedHat' {
    $packagename  = 'httpd'
    $configsource = 'puppet:///modules/apache/httpd.conf'
    $configfile   = '/etc/httpd/conf/httpd.conf'
    $vhostsource  = 'apache/vhost.conf.erb'
    $vhostfile    = '/etc/httpd/conf.d/vhost.conf'
    $servicename: 'httpd'
  } elsif $::osfamily == 'Debian' {
    $packagename  = 'apache2'
    $configsource = 'puppet:///modules/apache/apache2.conf'
    $configfile   = '/etc/apache2/apache2.conf'
    $vhostsource  = 'apache/vhost.conf.erb'
    $vhostfile    = '/etc/apache2/sites-enabled/vhost.conf'
    $servicename  = 'apache2'
  } else {
  }
}