# global defaults for file class
File {
  owner  => 'root',
  group  => 'root',
  mode   => '0644'
}

# global defaults for exec class
Exec {
  path => "/usr/local/sbin:/usr/sbin/:/sbin:/usr/local/bin:/bin:/usr/bin"
}

class{'::cobbler': }
