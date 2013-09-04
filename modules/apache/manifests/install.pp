class apache::install{

  $packages = [
    'httpd',
  ]

  package{$packages:
    ensure => installed
  }

}
