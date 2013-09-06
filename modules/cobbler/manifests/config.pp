class cobbler::config(
  $server,
  $next_server,
  $default_password_crypted,
  $pxe_just_once,
  $serializer_pretty_json
){

  include
    ::cobbler::params


  file{"$::cobbler::params::settings":
    content => template('cobbler/settings.erb'),
  }

}
