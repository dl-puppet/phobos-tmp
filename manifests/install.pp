# installation du logiciel

class ntp::install inherits ntp
{
	if $ntp::package_manage == true { 

    #Default Option Packages:
    Package {       
    ensure                => $package_ensure, 
    name                  => $package_name,         
    #install_options      => $package_install_options,
    #package_settings     => $package_settings,
    #reinstall_on_refresh => $package_reinstall_on_refresh,
    #responsefile         => $package_responsefile,
    #source               => $package_source,
    #uninstall_options    => $package_uninstall_options,
    before => File['$ntp::file_name'] 
    }
        
	    package { $ntp::package_name : 
	      # require => Exec["/bin/mkdir -p /tmp/needed/directory"],
        # require => Exec["refresh_cache"],
        
        # debug messages:
        # for debug output on the puppet master
        #notice("Running with \$mysql_server_id ${mysql_server_id} ID defined")

        # for debug output on the puppet client
        #notify {"Running with \$mysql_server_id ${mysql_server_id} ID defined":}

        # for debug output on the puppet client - with full source information
        #notify {"Running with \$mysql_server_id ${mysql_server_id} ID defined":
        #withpath => true,
        #}
	    }
		
		# passer une commande avec Puppet
		# Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
		#
    #  exec { "refresh_cache":
    # command => "refresh_cache 8600",
    #  #path    => "/usr/local/bin/:/bin/",
    #  # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
    # }

		# Exec fonctionne si elle n existe pas déjà.  Tant que le fichier / répertoire spécifié 
		# dans "crée" existe marionnettes ne sera pas exécuter le exec. 
		#exec { "create_needed_directory":
		#    command => "/bin/mkdir -p /tmp/needed/directory",
		#    creates => "/tmp/needed/directory"
		#}
		
		#exec fonctionner que si commande dans onlyif renvoie 0.
		# Les commandes de test utilisera le même $ PATH comme exec 
		#exec { "run_account_purger":
		#    command => "/usr/local/sbin/account_purger",
		#    onlyif => [ 
		#                "grep -c old_account /etc/passwd", 
		#                "test -d /home/old_account/"
		#              ]
		#on_failure logs la sortie de commandes en cas d'échec. Si vous voulez que la sortie à être connecté 
		# (puis renvoyé dans les rapports ou pour tableau de bord), vous pouvez spécifier "logoutput => true," 
		# (note - le vrai ne sont pas affichés), si vous souhaitez que la commande de se taire même sur échec 
		# (marionnettes sera toujours montrer une err si le exec échoue) vous pouvez spécifier "logoutput => false". 
		# Sinon, si vous vous souciez seulement la sortie lorsque quelque chose se brise (comme nous le faisons souvent), 
		# vous pouvez passer la chaîne "on_failure" pour logoutput.
		#   logoutput => "on_failure",
		#}




  } 

}