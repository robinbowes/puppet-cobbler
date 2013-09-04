puppet-cobbler
==============

Install cobbler using puppet

Usage:

sudo ./run.sh

Assumes puppet is already installed.

Tested on Fedora 19.

Configuration options (and defaults):
 - $debmirror = false,
 - $fencing = false,
 - $server = $::ipaddress,
 - $next_server = $::ipaddress,
 - $default_password_crypted = '$1$mF86/UHC$WvcIcX2t6crBz2onWxyac.', # 'cobbler'
 - $pxe_just_once = 1,
 - $serializer_pretty_json = 1

Todo:
 - firewall
 - more cobbler configuration options
