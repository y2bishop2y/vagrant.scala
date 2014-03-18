attributes.rb

#
# Cookbook Name:: scala
# Attributes:: default
#
default[:scala][:version]   = "2.10.3"
default[:scala][:url]       = "http://www.scala-lang.org/files/archive/scala-#{node[:scala][:version]}.tgz"
default[:scala][:checksum]  = "/usr/local/scala"