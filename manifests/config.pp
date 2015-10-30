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



 file { '$file_name':
        path                  => $file_path,
			  ensure                => $file_ensure,
			  backup                => $file_backup,
			  checksum              => $file_checksum,
			  content               => $file_content,    
			  #ctime                 => $file_ctime,
			  force                 => $file_force,
			  group                 => $file_group,
			  #ignore                => $file_ignore,
			  links                 => $file_links, 
			  mode                  => $file_mode,
			  #mtime                 => $file_mtime,
			  owner                 => $file_owner,
			  #provider              => $file_provider,
			  purge                 => $file_purge,
			  recurse               => $file_recurse,
			  recurselimit          => $file_recurselimit,
			  replace               => $file_replace,
			  #selinux_ignore_defaults => $file_selinux_ignore_defaults,
			  #selrange              => $file_selrange,
			  #selrole               => $file_selrole,
			  #seltype               => $file_seltype,
			  #seluser               => $file_seluser,
			  show_diff             => $file_show_diff,
			  source                => $file_source,
			  source_permissions    => $file_source_permissions,
			  sourceselect          => $file_sourceselect,
			  target                => $file_target,
			  #validate_cmd          => $file_validate_cmd,
			  #validate_replacement  => $file_validate_replacement,
			  require => Class['template_project::install'],
			  }


	  #file { '/etc/ssh/sshd_config':
  #  ensure  => present,
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0644',
    # Template uses $permit_root_login and $ssh_users
  #  content => template('ssh/sshd_config.erb'),
  #}
  
  
   #define resolve(nameserver1, nameserver2, domain, search) {
   #   $str = "search $search
   #       domain $domain
   #       nameserver $nameserver1
   #       nameserver $nameserver2
   #       "
   #   file { "/etc/resolv.conf":
   #     content => "$str",
   #   }
   #}


  #if $keys_enable {
  #      $directory = dirname($keys_file)
  #      file { $directory:
  #        ensure  => directory,
  #        owner   => 0,
  #        group   => 0,
  #        mode    => '0755',
  #       recurse => true,
  #      }
  #    }    
      
  #ensure_resource ('user',$module::settings['user'],{ 'ensure'=> 'present' })

  #if $module::service_file =~ /(?i:service)/ {
  #  file { $module::service_file:
  #    ensure  => "present",
  #    path    => "${module::service_dir}/${module::service_file}",
  #    mode    => '0644',
  #    content => template("module/${module::service_file}.erb"),
  #  }~>
  #  exec { "${module_name}-reload-systemd":
  #    path        => ["/bin","/usr/bin"],
  #    command     => "systemctl daemon-reload",
  #    refreshonly   => true,
  #  }
  #}

  #if $module::service_file =~ /(?i:init)/ {
  #  file { $module::service_file:
  #    ensure  => 'present',
  #    path    => "${module::service_dir}/module",
  #    mode    => '0755',
  #    content => "puppet:///modules/module/${module::service_file}",
  #  }
  #}
	

}