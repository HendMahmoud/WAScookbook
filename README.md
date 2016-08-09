# WAScookbook
#Purpose: 
		This cookbook is used to install Installation manager, Websphere and create Websphere's profile. 

#To run:
•	You must be at cookbook's location
•	run this command in shell 
	chef-client --local-mode --runlist 'recipe[was]'

#Recipes: 
	default: 
		Checks machine pre requirements and include all recipes 
	unzip:
		Extracts IM file and 3 parts of was 
	installIM:
		Installs installation manager
	installWAS:
		Installs Websphere Application Server
	profile:
		Creates default profile
 
#Attributes:

Attribute | Description | Type   | Default
----------|-------------|--------|--------
['ibm']   |		path of collactor of extracted files|		home/ibm
['pathIM']|  	extract path of installation manager| 	home/ibm/IM
['pathWas']|	extract path of WebSphere application server |	home/ibm/WAS
['unzip']['im']|	path of installation manager zipped file|	home/InstalMgr1.6.2_LNX_X86_64_WAS_8.5.5.zip  
['unzip']['p1'] |	path of part1 of WAS zipped file1|	 	home/WAS_V8.5_1_OF_3.zip
['unzip']['p2']	|path of part2 of WAS zipped file2	|home/WAS_V8.5_2_OF_3.zip
['unzip']['p3']	|path of part3 of WAS zipped file3	|home/WAS_V8.5_3_OF_3.zip
['install']	|path of file install of IM	|home/ibm/IM/installc
['imanger']	|path of installed IM	|opt/IBM/InstallationManager/IMShared          
['appsrv']	|path of installed WAS	|opt/IBM/WebSphere/AppServer
['wasversion']	|WAS product and version|	"com.ibm.websphere.BASE.v85"
['profile']['name']| 	default name of profile|	"nodeProfile"
['profile']['node']|		default cell name of profile|	"cell01"
['profile']['host']|	default localhost name of profile|	"localhost"
['profile']['admin']['name']|	default admin name	|"wasadmin"
['profile']['admin']['pass']|	default password of admin|	"wasadmin"

#Note:
To modify in paths you can find it in location of cookbook + '/cookbooks/attributes/attributes.rb'

#Directory structure and template files are given:

 - <home>  					downloaded programs located
      |
      +-- <ibm>
            |
            +-- IM 				Installation manager extracted 
       	|
            +-- WAS				Websphere extracted
             

 - </>						the paths of installation
 |
 +-- <opt>
       |
       +-- IBM
       |     +- InstallationManager           	Installation manager install 
       |     +- WebSphere                    		websphere install

#Limitation:
•	Run cookbook as client so Chef should be installed.
•	Assumed files downloaded in home directory.
•	Run on Redhat OS only.
•	Static destination directory and WAS profile info.

#Possible enhancement:
•	FTP
•	Make the cookbook run for any OS.
•	Make the cookbook run from chef server.
•	Take parameters from user.
#Author info:
•	Amira Osama Ali Ashmawy
•	Hend Mahmoud El-Shafy
•	Mennat Allah Mamdouh Mohamed
