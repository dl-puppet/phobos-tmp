#Classe principale

class system 
(  

  ######### PACKAGES ########
  $package_manage               = $system::params::package_manage,
  $package_name                 = $system::params::package_name,
  $package_ensure               = $system::params::package_ensure,    
  $package_install_options      = $system::params::package_install_options,
  $package_settings             = $system::params::package_settings,
  $package_reinstall_on_refresh = $system::params::package_reinstall_on_refresh,
  $package_responsefile         = $system::params::package_responsefile,
  $package_source               = $system::params::package_source,
  $package_uninstall_options    = $system::params::package_uninstall_options,
    
 
  ######### SERVICES ########
  $service_manage               = $system::params::service_manage,
  $service_name                 = $system::params::service_name, 
  $service_ensure               = $system::params::service_ensure,            
  $service_enable               = $system::params::service_enable,   
  $service_hasstatus            = $system::params::service_hasstatus,
  $service_hasrestart           = $system::params::service_hasrestart,


  ###### CONFIG_FILES ###### 
  $file_name                    = $system::params::file_name,    
  $file_path                    = $system::params::file_path,     
  $file_ensure                  = $system::params::file_ensure,      
  $file_backup                  = $system::params::file_backup,      
  $file_content                 = $system::params::file_content,          
  $file_group                   = $system::params::file_group,        
  $file_mode                    = $system::params::file_mode,        
  $file_owner                   = $system::params::file_owner,       

  ####### CONFIG_LOG #######  
  #$log_manage                  = $system::params::log_manage, 
  #$log_name                    = $system::params::log_name,
  #$log_path                    = $system::params::log_path,
  #$log_ensure                  = $system::params::log_ensure,
  #$log_backup                  = $system::params::log_backup,
  #$log_owner                   = $system::params::log_owner,
  #$log_group                   = $system::params::log_group,
  #$log_mode                    = $system::params::log_mode,

) inherits system::params  

{
  validate_string         ($package_ensure)
  validate_bool           ($package_manage)
  validate_array          ($package_name)

  validate_bool           ($service_manage)
  validate_string         ($service_name)
  validate_string         ($service_ensure)
  validate_bool           ($service_enable)
  validate_bool           ($service_hasstatus)
  validate_bool           ($service_hasrestart)

  validate_string         ($file_name) 
  validate_string         ($file_path)    
  validate_string         ($file_ensure)      
  validate_string         ($file_backup)     
  validate_string         ($file_content)          

  #validate_bool           ($log_manage)
  #validate_string         ($log_name)
  #validate_string         ($log_path)
  #validate_string         ($log_ensure)
  #alidate_string          ($log_backup)

  validate_array          ($servers)


  anchor { 'system::begin': } ->
    class { '::system::install': } ->
    class { '::system::config': } ~>
    class { '::system::service': } ->
    class { '::system::user': } ->
  anchor { 'system::end': }
  
		  
}

