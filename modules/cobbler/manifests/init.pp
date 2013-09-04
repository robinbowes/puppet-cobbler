class cobbler(
  $debmirror = false,
  $fencing = false,
  $server = $::ipaddress,
  $next_server = $::ipaddress,
  $default_password_crypted = '$1$mF86/UHC$WvcIcX2t6crBz2onWxyac.',
  $pxe_just_once = 1,
  $serializer_pretty_json = 1
){

  require
    ::apache

  class{'::cobbler::install':
    debmirror => $debmirror,
    fencing => $fencing,
  }->
  class{'::cobbler::config':
    server                   => $server,
    next_server              => $next_server,
    default_password_crypted => $default_password_crypted,
    pxe_just_once            => $pxe_just_once,
    serializer_pretty_json   => $serializer_pretty_json
  }~>
  class{'::cobbler::service':}->
  class{'::cobbler::firewall':}

}
