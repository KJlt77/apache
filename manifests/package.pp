# Class apache::package description
class apache::package (
  String $packagename = lookup({'name' => 'apache.packagename', 'default_value' => $::apache::parameters::packagename})
  ) inherits ::apache::parameters {
  package { 'apache-package':
          ensure => present,
          name   => $packagename
  }
}