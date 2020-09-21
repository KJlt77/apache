class apache::service (
  String $configsource = lookup({"name" => "apache.servicename", "default_value" => ""})
  ) {
  service { 'webserver-service':
          name       => $servicename,
          ensure     => running,
          enable     => true,
          hasrestart => true,
  }
}