class ntp::user inherits ntp
{
  

    ## Create user
  group { 'ntp':
    ensure => present,
  }
  user { 'ntp':
    ensure   => present,
    gid      => 'ntp',
    password => $password,
    managehome => true,
    home     => '/home/ntp',
    password => '$1$9VC1vFFa$GHKWgtdODti8eKqkQ7Ruv.'
  }
  

}