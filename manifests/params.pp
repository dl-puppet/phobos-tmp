# définition des paramètres par défaut 

class system::params
{
  
	######### PACKAGES ######## ruby-shadow
	$package_manage       	      = true
				#case $::osfamily {
			  #  'Debian' : { $package_name = 'apache2' }
			  #  'RedHat' : { $package_name = 'httpd'}
			  #  default :  { fail ("OS $::operatingsystem not supported") }
			  #}
			  
			  #if $::osfamilly == 'Debian' {
			  #  $package_name = 'apache2'
			  #} elsif $::osfamilly == 'RedHat' {
			  #  $package_name = 'httpd'
			  #} else {
			  #  fail ("OS $::operatingsystem not supported")
			  #}
			  
				# use: $lsbdistcodename or $osfamilly:
				$default_package_name   = $::operatingsystem ? {
				   '/RedHat|Fedora|CentOS/'  => 'system',
			     'AIX'     => 'system',
			  }		  
	$package_ensure       	      = 'present' 
  $package_install_options      = 'undef'
  $package_settings             = 'undef'
  $package_reinstall_on_refresh = 'undef'
  $package_responsefile         = 'undef'
  $package_source               = 'undef'
  $package_uninstall_options    = 'undef'  
		  
		  
	######### SERVICES ########
	$service_manage 		    = true
	$default_service_name   = $::operatingsystem ? {
    '/RedHat|Fedora|CentOS/'  => 'systemd',
    'AIX'                     => 'systemd',
   }
	$service_ensure         = 'running'            
	$service_enable         = true
	$service_hasstatus		  = true
	$service_hasrestart 	  = true


	###### CONFIG_FILES ###### 
	$default_file_name      = ["system.conf"]
	$default_file_path      = '/etc/system.conf'     
	$file_ensure            = 'file'   
	$file_backup            = '.puppet-bak'   
	$file_content           = 'system/system.conf.erb' 
	$file_group             = '0' 
	$file_mode              = '0644' 
	$file_owner             = '0'   

	####### CONFIG_LOG ####### 
	#$log_manage 			= true
  	#$default_log_name		= 'system.log'
  	#$default_log_path		= '/var/log/system.log'
  	#$log_ensure				= 'file'
  	#$log_backup				= '.puppet-bak'
  	#$log_owner				=
  	#$log_group				=
  	#$log_mode				=

  	case $::osfamily {

	  		####### CONFIG_REDHAT_FAMILLY ####### 
	  		'RedHat': {
	     		$package_name   = $default_package_name
	      		$service_name   = $default_service_name
	  		 	$file_name 		= $default_file_name     
				$file_path   	= $default_file_path  

	  		 	case $::operatingsystem {

	        		'Fedora': {
	        			$servers  = [
				            '0.fedora.pool.system.org',
				            '1.fedora.pool.system.org',
				            '2.fedora.pool.system.org',
				            '3.fedora.pool.system.org',
	          			]
	        		}

	        		default : {
	        			$servers  = [
				            '0.centos.pool.system.org',
				            '1.centos.pool.system.org',
				            '2.centos.pool.system.org',
				            '3.centos.pool.system.org',
	          			]

	        		}


	        	}
	  		 }

	  		 ####### CONFIG_AIX_SYSTEM #######
	    	'AIX': {   
		      	$package_name   = [ 'bos.net.tcp.client', ]
		      	$service_name 	= 'xsystemd'
		      	$file_name 		= $default_file_name     
				$file_path   	= $default_file_path  
	  		}

	  		##### CONFIG_DEBIAN_SYSTEM ######
	  		'Debian': {
	 			$package_name 	= $default_package_name
	 			$service_name 	= 'system'
	 			$file_name 		= $default_file_name     
				$file_path   	= $default_file_path  
	 			$servers        = [
	        		'0.debian.pool.system.org',
	        		'1.debian.pool.system.org',
	        		'2.debian.pool.system.org',
	        		'3.debian.pool.system.org',
	      		]
	  		}
	}

}
