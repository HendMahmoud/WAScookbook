#
# Cookbook Name:: was
# Recipe:: installingIM
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
$install = node['install']
	execute "#{$install} -acceptLicense" do
		command "#{$install} -acceptLicense"
	end
