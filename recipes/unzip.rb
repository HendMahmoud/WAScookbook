#
# Cookbook Name:: was
# Recipe:: unzip
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

$pathIM = node['pathIM']
$pathWAS = node['pathWas']
$pathibm = node['ibm']
$unzipIM=node['unzip']['im']
	if !Dir.exists?($pathibm) then		
		execute "mkdir /#{$pathibm}" do 
			command "mkdir /#{$pathibm}"
		end

	end
	if !Dir.exists?($pathIM) then
		execute "unzip #{$unzipIM} -d /home/ibm/IM" do
			command "unzip #{$unzipIM} -d /home/ibm/IM"
		end
	end

	if !Dir.exists?($pathWAS) then
		execute "unzip #{node['unzip']['p1']} -d  #{$pathWAS} >> logs.txt" do
			command "unzip #{node['unzip']['p1']} -d  #{$pathWAS}>> logs.txt" 
		end
		execute "unzip #{node['unzip']['p2']} -d  #{$pathWAS} >> logs.txt" do
			command "unzip #{node['unzip']['p2']} -d #{$pathWAS}>> logs.txt"
		end
		execute "unzip #{node['unzip']['p3']} -d  #{$pathWAS} >> logs.txt" do
			command "unzip #{node['unzip']['p3']} -d  #{$pathWAS} >> logs.txt" 
		end
	end
