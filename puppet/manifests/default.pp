
class git {
      exec { 'apt-get update for git':
      	   command => '/user/bin/apt-get update'
      
      }


      # exec { 'install-git' :
      #       command => 'sudo tar -C /opt/ -xvzf /vagrant/dependencies/packages/git-1.8.0.1.tar.gz'
      # }     


       package { "libcurl4-gnutls-dev": ensure => present, require => Exec["apt-get update for git"] }
       package { "libexpat1-dev": ensure => present, require => Exec["apt-get update for git"] }
       package { "gettext": ensure => present, require => Exec["apt-get update for git"] }
       package { "libz-dev": ensure => present, require => Exec["apt-get update for git"] }
       package { "libssl-dev": ensure => present, require => Exec["apt-get update for git"] }
       package { "build-essential": ensure => present, require => Exec["apt-get update for git"] }

}


class typesafe {

      



}