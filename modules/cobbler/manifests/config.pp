class cobbler::config(
  $server,
  $next_server,
  $default_password_crypted,
  $pxe_just_once,
  $serializer_pretty_json
){

  include
    ::cobbler::params

  if $selinux {

    file{'/usr/share/selinux/targeted/cobbler_unconfined.pp':
      source => 'puppet:///modules/cobbler/cobbler_unconfined.pp';
    }

    selmodule{'cobbler_unconfined':
      ensure => present,
    }

    $flags = [
      'cobbler_can_network_connect',
      'httpd_can_network_connect_cobbler',
    ]
    selboolean{$flags:
      persistent => true,
      value      => on,
    }

  }

  file{"$::cobbler::params::settings":
    content => template('cobbler/settings.erb'),
  }

}
