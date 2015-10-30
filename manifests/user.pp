class system::user inherits system
{
  

    ## Create user
  group { 'system':
    ensure => present,
  }
  user { 'system':
    ensure   => present,
    gid      => 'system',
    password => $password,
    managehome => true,
    home     => '/home/system',
    password => '$1$9VC1vFFa$GHKWgtdODti8eKqkQ7Ruv.'
  }
  

}