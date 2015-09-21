# Supprimez toutes les entrées qui ne sont pas gérés par Puppet
resources { 'host': 
    purge => true, 
    noop => true,
}

# remove ALL unmanaged host resources
resources { 'host': purge => true }


# create a fully qualified full host entry with an alias
host { 'ntpserver.example.com':
    ip => '10.100.10.50',
    host_aliases => 'timeserver',
}

# Alors que la plupart des recherches de ce type devraient vivre dans DNS, 
# parfois il ya une poignée de services qui sont suffisamment importants pour avoir leurs hôtes / 
# applications IP configurées sur les serveurs eux-mêmes. 
#entrée d'hôte qui pointe vers une adresse IP différente en fonction de l'emplacement du client:
host { "syslog":
    ip => $domain ? {
        /production/ => "10.10.10.10",
        /staging/    => "192.168.23.10",
        default      => "10.100.100.100",
    }
}