metadata.rb


name             "scala"
maintainer       "Emiliano B"
maintainer_email "emiliano@medlista.com"
license          "Apache 2.0"
description      "Installs/Configures scala"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

%w{ centos redhat fedora }.each do |os|
  supports os
end

depends "java"
depends "ark"