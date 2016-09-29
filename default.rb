
#
# Cookbook Name:: was
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

memory_in_megabytes = case node['os']
when /.*bsd/
  node.memory.total.to_i / 1024 / 1024
when 'linux'
  node.memory.total[/\d*/].to_i / 1024
when 'darwin'
  node.memory.total[/\d*/].to_i
when 'windows', 'solaris', 'hpux', 'aix'
  node.memory.total[/\d*/].‪to_i / 1024
end
$free_disk_space = 0
$free_disk_space = node['filesystem']['/dev/mapper/rhel-root']['kb_available']

#if memory_in_megabytes > 1048576 && free_disk_space > 3250586
$pathIM ="home/amira/Documents/ibm/IM"
$pathWAS = "home/amira/Documents/ibm/WAS"
	if !Dir.exists?($pathIM)then
		execute 'unzip /home/amira/Documents/ibm/InstalMgr1.6.2_LNX_X86_64_WAS_8.5.5.zip -d  /home/amira/Documents/ibm/IM >> logs.txt' do
			command ' unzip /home/amira/Documents/ibm/InstalMgr1.6.2_LNX_X86_64_WAS_8.5.5.zip -d /home/amira/Documents/ibm/IM >> logs.txt'

		end
	end

	execute '/home/amira/Documents/ibm/IM/installc  -acceptLicense >> logs.txt' do
		command '/home/amira/Documents/ibm/IM/installc -acceptLicense >> logs.txt'
	end
	if !Dir.exists?($pathWAS) then
		execute 'unzip /home/amira/Documents/ibm/WAS_V8.5_1_OF_3.zip -d  /home/amira/Documents/ibm/WAS >> logs.txt' do
			command ' unzip /home/amira/Documents/ibm/WAS_V8.5_1_OF_3.zip -d  /home/amira/Documents/ibm/WAS>> logs.txt' 
		end
		execute 'unzip /home/amira/Documents/ibm/WAS_V8.5_2_OF_3.zip -d  /home/amira/Documents/ibm/WAS >> logs.txt' do
			command ' unzip /home/amira/Documents/ibm/WAS_V8.5_2_OF_3.zip -d  /home/amira/Documents/ibm/WAS>> logs.txt' 
		end
		execute 'unzip /home/amira/Documents/ibm/WAS_V8.5_3_OF_3.zip -d  /home/amira/Documents/ibm/WAS >> logs.txt' do
			command ' unzip /home/amira/Documents/ibm/WAS_V8.5_3_OF_3.zip -d  /home/amira/Documents/ibm/WAS>> logs.txt' 
		end
	end
	execute '/home/amira/Documents/ibm/IM/tools/imcl install com.ibm.websphere.BASE.v85 -repositories /home/amira/Documents/ibm/WAS -installationDirectory /QIBM/ProdData/WebSphere/AppServer/V85/ND -sharedResourcesDirectory /QIBM/UserData/InstallationManager/IMShared -acceptLicense -showProgress >> logs.txt' do
	command '/home/amira/Documents/ibm/IM/tools/imcl install com.ibm.websphere.BASE.v85 -repositories /home/amira/Documents/ibm/WAS -installationDirectory /QIBM/ProdData/WebSphere/AppServer/V85/ND -sharedResourcesDirectory /QIBM/UserData/InstallationManager/IMShared -acceptLicense -showProgress >> logs.txt'
		end
#else 
	free_disk_space = -52
	execute 'echo "#$free_disk_space" >> logs.txt' do
		command 'echo "#$free_disk_space" >> logs.txt'
	end
	#file 'logs.txt' do
	#	content $free_disk_space
	#end
#end
