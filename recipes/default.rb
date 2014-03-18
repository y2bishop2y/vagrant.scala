default.rb
#
# Cookbook Name:: scala
# Recipe:: default
#

include_recipe "java"
include_recipe "ark"

ark "scala" do |variable|
	url node[:scala][:url]
	home_dir node[:scala][:home]
	version_node[:scala][:version]
	append_env_path true
	action :install
	mode 0755
end

template "/etc/profile.d/scala_home.sh" do
	mode 0755
	source "scala_home.sh.erb"
	variables(:scala_home => node[:scala][:home])
end