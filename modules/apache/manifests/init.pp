class apache{

  class{'::apache::install': }->
  class{'::apache::config': }~>
  class{'::apache::service':}->
  class{'::apache::firewall':}

}
