class cobbler::install(
  $debmirror,
  $fencing
){

  include
    ::apache

  case $debmirror {
    true, false: {
      $debmirror_install = $debmirror
    }
    default: {
      fail('debmirror parameter must be true or false')
    }
  }
  case $fencing {
    true, false: {
      $fencing_install = $fencing
    }
    default: {
      fail('fencing parameter must be true or false')
    }
  }

  $packages = [
    'cobbler',
    'pykickstart',
    'syslinux',
  ]

  # restart apache when cobbler installed
  package{$packages:
    ensure => installed,
  }

  if $debmirror_install {
    package{'debmirror':
      ensure => installed
    }
  }
  if $fencing_install {
    package{'fence-agents':
      ensure => installed
    }
  }

  # restart apache 
  Package['cobbler']~>
  Class['::apache::service']

}
