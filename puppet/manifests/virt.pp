

exec { "apt-get update":
     command => "/usr/bin/apt-get update && touch /tmp/apt.update",
}
  
class { 'emacs': }    
class { 'tree':  }



# Ensure Git is installed
package { 'git':
	ensure => 'present'
}

  package { 'pm-utils':
    ensure => 'present'
  }
    
