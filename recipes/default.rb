
#
# Cookbook Name:: was
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

memory_in_megabytes= case node['os']
when /.*bsd/
  node.memory.total.to_i / 1024 / 1024
when 'linux'
  node.memory.total[/\d*/].to_i 
when 'darwin'
  node.memory.total[/\d*/].to_i
when 'windows', 'solaris', 'hpux', 'aix'
  node.memory.total[/\d*/].to_i / 1024
end
free_disk_space= node['filesystem']['/dev/mapper/rhel-root']['kb_available']
if ['redhat'].include?(node['platform']) && memory_in_megabytes > 1048576 && free_disk_space.to_i > 3250586 
	include_recipe "#{cookbook_name}::unzip"
	include_recipe "#{cookbook_name}::installIM"
	include_recipe "#{cookbook_name}::installWAS"
	include_recipe "#{cookbook_name}::profile"
end
=begin
 if  then
=end
	


