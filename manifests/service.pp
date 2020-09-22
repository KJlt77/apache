# Class apache::service description
class apache::service (
  String $servicename = lookup({'name' => 'apache.servicename', 'default_value' => ''})
  ) {
  service { 'apache-service':
          ensure     => running,
          name       => $servicename,
          enable     => true,
          hasrestart => true,
  }
}