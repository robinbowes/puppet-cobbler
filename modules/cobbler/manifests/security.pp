class cobbler::security{

  if $selinux {

    # this module should work on any EL6 but has only been tested on CentOS 6.4
    if $::osfamily == 'RedHat' and $::operatingsystemmajrelease == 6 {
      file{'/usr/share/selinux/targeted/cobbler_unconfined.pp':
        source => 'puppet:///modules/cobbler/cobbler_unconfined.pp';
      }

      selmodule{'cobbler_unconfined':
        ensure => present,
      }
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

}
