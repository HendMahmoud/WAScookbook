#
# Cookbook Name:: was
# Recipe:: installWAS
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
$pathIM = node['pathIM']
$pathWAS = node['pathWas']
$pathibm = node['ibm']
$appServer= node['appsrv']
$IM= node['imanger']
$wasVersion=node['wasversion']

execute "#{$pathIM}/tools/imcl install #{$wasVersion} -repositories #{$pathWAS} -installationDirectory #{$appServer} -sharedResourcesDirectory #{$IM} -acceptLicense -showProgress >> logs.txt" do
		command "#{$pathIM}/tools/imcl install #{$wasVersion} -repositories #{$pathWAS} -installationDirectory #{$appServer} -sharedResourcesDirectory #{$IM} -acceptLicense -showProgress >> logs.txt"
	end

