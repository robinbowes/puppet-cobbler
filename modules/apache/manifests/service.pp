class apache::service{

  service { 'httpd':
    enable      => true,
    ensure      => running,
    hasrestart  => true,
    hasstatus   => true,
  }

}
