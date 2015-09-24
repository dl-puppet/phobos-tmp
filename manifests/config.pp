# Configuration du logiciel

class system::config inherits system
{

	#config default file:
	File {
      ensure          => $system::file_ensure,
      #replace => "no", # add a file if the file isn’t already present. ca arrête la gestion de son contenu par Puppet si le fichier existe. 
      group           => $system::file_group,
      mode            => $system::file_mode,
      owner           => $system::file_owner,
      backup          => $system::file_backup,
      require         => Class['$system::package'],
      notify          => Service['$system::service_name'], #Si le fichier change, notifier le service pour redemarrage
	}

			file { $system::file_name :
		    path            => $system::file_path,
				content 		    => template($system::file_content),   
			}
	
	
	# Exemple: chaque ressource est séparé par un point virgule (;)
	#file {
  #     "/etc/cobbler/modules.conf":
  #     content => template("cobbler/modules.conf");
  #
  #     "/etc/cobbler/dhcp.template":
  #     content => template("cobbler/dhcp.template");
  #  }
  
  # Exemple creation directory:
	#$whisper_dirs = [ "/usr/local/whisper/", "/usr/local/whisper/2.0",
	#                  "/usr/local/whisper/2.0/bin", "/usr/local/whisper/2.0/log",
	#file { $whisper_dirs:
	#    ensure => "directory",
	#    owner  => "root",
	#    group  => "wheel",
	#    mode   => 750,
	#}


 #spécifiques d'un fichier pour un hôte, l'emplacement ou le système d'exploitation donné, 
 #tout en ayant une solution de repli par défaut? Puppet va utiliser le premier fichier qui correspond à une ligne de source
 #file { "/etc/mysql/conf.d/tuning.cnf":
 #  ensure => "present",
 #   source => [
 #       "puppet:///modules/mysql-server/tuning.$hostname.cnf",
 #       "puppet:///modules/mysql-server/tuning.$domain.cnf",
 #       "puppet:///modules/mysql-server/tuning.cnf"
 #   ],
 #}

}