#
# Cookbook Name:: was
# Recipe:: profile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

	execute "#{node['appsrv']}/bin/manageprofiles.sh -create -profileName #{node['profile']['name']} -profilePath #{node['appsrv']}/profiles/nodeProfile -templatePath #{node['appsrv']}/profileTemplates/default -nodeName #{node['profile']['node']} -hostName #{node['profile']['host']} -adminUserName #{node['profile']['admin']['name']} -adminPassword #{node['profile']['admin']['pass']}" do	
	command "#{node['appsrv']}/bin/manageprofiles.sh -create -profileName #{node['profile']['name']} -profilePath #{node['appsrv']}/profiles/nodeProfile -templatePath #{node['appsrv']}/profileTemplates/default -nodeName #{node['profile']['node']} -hostName #{node['profile']['host']} -adminUserName #{node['profile']['admin']['name']} -adminPassword #{node['profile']['admin']['pass']}" 
end	

