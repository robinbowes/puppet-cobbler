class cobbler::service{

  service { 'cobblerd':
    enable      => true,
    ensure      => running,
    hasrestart  => true,
    hasstatus   => true,
  }

}
