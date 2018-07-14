# CUU Repo - A set of AWS CLI Wrappers and Utility Scripts
Script | Description | Usage | Defaults
------ | ----------- | ----- | --------
cuu | A multi function AWS CLI Wrapper Utility | See below
ec2ls | A ec2 listing utility | ec2ls -a "\<profile list\>" -r "\<region list\>" | All US regions
### Examples
<pre>
 cuu -a ENV1 -c USERLIST
 ec2ls -a "ENV1 EVN2"
</pre>
 
## CUU - An AWS CLI Wrapper
###### Setup:  CUUHOME enviroment variable should be set to the cuu install directory
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-d][-D][-j][-F][-B][-E][-R][-Z][-i][-c][-e]
  info
       build date: Sat Jul 14 09:13:03 EDT 2018
       repo:       https://github.com/archernar/cuu
  operands
      -a  operand:  cli profile name, maps to AWS account  (from .aws/config)
      -u  operand:  username
      -p  operand:  password    (default may be set in ~/.cuu.txt)
      -t  operand:  thing name  (specify a resource or object name)
      -T  operand:  time window in hours (to specify (now minus T) to now)
      -D  operand:  specify a document\file to upload (e.g. a policy document)
      -e  operand:  expire time in seconds (0 == 7 days)
      -C  operand:  content type (pdf, text, html, mp3)
      -b  operand:  s3 bucket name
      -k  operand:  s3 key name
      -n  operand:  name string
  flags
      -h  flag:     display usage
      -d  flag:     limits abbreviations
      -j  flag:     use long datetime fields
      -F  flag:     force mode, do not confirm any command
      -B  flag:     show full user names
      -E  flag:     show event names
      -R  flag:     show raw records in output
      -Z  flag:     output iso time
      -i  flag:     interactive mode ('q' to quit)
      -C  flag:     Content type (text,pdf,json,html)
      -c  command:
          Optional :UL: may specify a user, a list of users, a file, or the keyword ALLUSERS
          Optional :PL: may specify a profile, a list of profiles, or the special keyword ALLPROFILES
 
</pre>
### Commands  
<pre>
User Commands  
     usercreateadmin              -a -u -p     Create admin user
     usercreate                   -a -u -p     Create a user and assign access keys
     usercreatenokey              -a -u -p     Create a user with no access keys
     usercreatereadonly           -a -u -p     Create readonly user
     userdelete                   -a -u        Delete user
     userdescribe                 -a -u        Lists groups and policies associated with user/userlist
     userls-2                     -a           User listing (simple format)
     userls                       -a           User listing
     userls-json                  -a           User list in json format
     usermenu                     -a           Menu driven user information
Password Commands  
     passwordchange               -a -u -p     Change a users password
     passwordscram                -a -u        Make a users password unkown (scram)
     passwordscramset             -a -u        Make fileset of user password unkown (scram)
  
AccessKey Commands  
     accesskeycreate              -a           Create access keys for user
     accesskeyreplace             -a           Delete and replace access keys
     accesskeysdelete             -a           Delete all access keys attached to user
     accesskeysls                 -a           List a users access keys
  
Policy Commands  
     policyattachtoallusers       -a -t        Attach policy to all users
     policyattachtouser           -a -u        Attach policy to user
     policybyarn-add              -a -u -t     Attach policy to user by ARN
     policybyarn-remove           -a -u -t     Detach policy from user by ARN
     policybyname-add             -a -t        Attach local policy to user by policy name
     policybyname-remove          -a -t        Detach local policy from user by policy name
     policycodecommitpoweruser-add -a           Add arn:aws:iam::aws:policy/AWSCodeCommitPowerUser to user
     policycodecommitpoweruser-remove -a           Remove arn:aws:iam::aws:policy/AWSCodeCommitPowerUser from user
     policycreate                 -a -t        Create policy bu name and upload policy document this.json
     policydelete                 -a -t        Delete local policy ARN
     policygetall                 -a           Get all policy documents
     policyget                    -a -t        Get policy
     policygetlocal               -a           Get local policy documents
     policylistall                -a           List all policies
     policylistaws                -a           List all AWS policies
     policylistlocal              -a           List local policies
     policylistuser               -a -u        List policies atttached to user
     policysetattach              -a -u        Attach all policies specified in policyset.txt to user
     policysetremove              -a -u        Remove all policies specified in policyset.txt from user
     policyupdate                 -a -t -D     Update policy
     policyuserchangepassword-add -a           Add arn:aws:iam::aws:policy/IAMUserChangePassword to user
     policyuserchangepassword-remove -a           Remove arn:aws:iam::aws:policy/IAMUserChangePassword from user
     policyuserdetachall          -a -u        Detach all policies from user
  
Group Commands  
     groupadduser                 -a -t        Add user/userlist to group
     groupcreate                  -a -t        Create group in profile
     groupdelete                  -a -u -t     Delete group from profile by group name
     grouplistusers               -a           List users in group
     groupls                      -a           List groups in profile
     groupremoveallusers          -a           Remove all groups atttach to user
     groupremoveuser              -a           Remove user from group by group name
     groupsforuser                -a           List groups attached to user
  
Role Commands  
     rolels                       -a           List Roles
  
VPC Commands  
     vpccreate                    -a -r        Create a Two Subnet VPC
     vpcdelete                    -a -r -t     Delete VPC
     vpcinstance                  -a           Create an instance in the VPC
     vpcls                        -a           List VPCs
  
EC2 Commands  
     ec2ls2                       -a           List Instances 2
     ec2ls                        -a           EC2 List
     ec2myls                      -a           My EC2 List
     ec2sg                        -a           Security Group Detail Report
     ec2sgsum2                    -a           Security Group Summary Report
     ec2sgsum                     -a           Security Group Summary Report
     ec2spark                     -a -t        CloudWatch CPU Utilization with Spark Graphing
     ec2sparkmenu                 -a           Instance Menu
     ec2terminate                 -a           Terminate Instance
     ec2terminatelast             -a           Terminate Last Instance
     ec2-util                     -a           CloudWatch CPU Utilization
  
AMI Commands  
     amils                        -a           List Local AMIs
  
LAMBDA Commands  
     lambdals                     -a           List Lambda Functions
  
S3 Commands  
     s3clearbucket                -a -b -k     S3 Remove Object, with wildcard (%) keys
     s3copy-1minute               -a -b -d     S3 Copy, Expires in 1 Minute
     s3copy                       -a -b -d     S3 Copy, with wildcard (%) documents
     s3copywithrenaming           -a -b -d     S3 Copy and Rename, with wildcard (%) documents
     s3createbucket               -a -b        Create S3 Bucket
     s3createbucket-eucentral1    -a -b        Create S3 Bucket in eu-central-1
     s3createbucket-euwest1       -a -b        Create S3 Bucket in eu-west-1
     s3createbucket-useast1       -a -b        Create S3 Bucket in us-east-1
     s3createbucket-useast2       -a -b        Create S3 Bucket in us-east-2
     s3createbucket-uswest1       -a -b        Create S3 Bucket in us-west-1
     s3createbucket-uswest2       -a -b        Create S3 Bucket in us-west-2
     s3deletebucket               -a -b        Deletes a S3 Bucket
     s3html                       -a -b -C     S3 List as HTML Page
     s3ls                         -a           S3 List
     s3lsr                        -a           S3 Recursive List
     s3presign                    -a -b -k     Presign S3 URL
     s3publish                    -a           Publish Files
     s3publishclear               -a -b -k     Clear Publish Bucket
     s3publishmore                -a           Publish Files (without clearing bucket)
     s3put                        -a -b -k -d  S3 Put Object
     s3puthtml                    -a -b -k -d  S3 Put HTML Object
     s3putpdf                     -a -b -k -d  S3 Put PDF Object
     s3putpdffileset              -a -b        S3 Put PDF Fileset
     s3puttext                    -a -b -k -d  S3 Put Text Object
     s3remove                     -a -b -k     S3 Remove Object, with wildcard (%) keys
     s3rmfileset                  -a -b        S3 Remove Fileset
     s3url                        -a -b -k     Create a Signed URL
  
CloudTrail Commands  
     cloudtrail-active            -a           Cloudtrail watch all activity in the time window
     cloudtrailmenu               -a           Menu interface to pick and watch users via cloudtrail
     cloudtrail-user              -a           Tracks a user's activity via cloud trail
     cloudtrail-watch             -a           Cloudtrail watch a user across multiple profiles
     cloudtrailworld              -a           CloudTrail report for 100 hour window for user across all regions
  
Utility Commands  
     utilaccountnumber            -a           Print account number
     utilcatpolicydoc             -a           Display policydoc.json template
     utilcommandls                -a           List Commands
     utilcommands                 -a           Command help
     utilconfig                   -a           Edit Configuration File ~/.cuu.txt
     utildumpconfig               -a           Dump Configuration File ~/.cuu.txt
     utilnewpolicydoc             -a           Create new this.json from policydoc.json template
     utilpublish                  -a           Publish Files
     utilpublishcuureport         -a           Publish cuureport.txt
     utilpublishmore              -a           Publish Files (without clearing bucket)
     utilrepo                     -a           List the cuu repo url
     utilset                      -a           Set and Show configuration/environment variables
     utilswap                     -a           Swap a Policy for a Group
     utiltime                     -a           Print time window
</pre>
### Command Aliases
<pre>
ACCESSKEYCREATE                  CREATEACCESSKEY                                                           
ACCESSKEYREPLACE                 REPLACEACCESSKEYS                                                         
ACCESSKEYSDELETE                 DELETEACCESSKEYS                                                          
ACCESSKEYSLS                     ACCESSKEYLIST            LISTACCESSKEY                                    
AMILS                                                                                                      
CLOUDTRAIL-ACTIVE                                                                                          
CLOUDTRAIL-USER                                                                                            
CLOUDTRAIL-WATCH                                                                                           
CLOUDTRAILMENU                                                                                             
CLOUDTRAILWORLD                  WORLD                                                                     
EC2-UTIL                                                                                                   
EC2LS                            EC2LIST                                                                   
EC2LS2                           EC2LIST2                                                                  
EC2MYLS                          EC2LSMY                                                                   
EC2SG                                                                                                      
EC2SGSUM                                                                                                   
EC2SGSUM2                                                                                                  
EC2SPARK                                                                                                   
EC2SPARKMENU                                                                                               
EC2TERMINATE                                                                                               
EC2TERMINATELAST                                                                                           
GROUPADDUSER                                                                                               
GROUPCREATE                                                                                                
GROUPDELETE                                                                                                
GROUPLISTUSERS                   LISTUSERSINGROUP                                                          
GROUPLS                          GROUPLIST                LISTGROUPS                                       
GROUPREMOVEALLUSERS                                                                                        
GROUPREMOVEUSER                                                                                            
GROUPSFORUSER                    LISTUSERGROUPS                                                            
KEYPAIRCREATE                    CREATEKEYPAIR                                                             
LAMBDALS                         LAMBDATLIST                                                               
PASSWORDCHANGE                   CHANGEPASSWORD                                                            
PASSWORDSCRAM                    SCRAMPASSWORD                                                             
PASSWORDSCRAMSET                 SCRAMPASSWORDSET                                                          
POLICYATTACHTOALLUSERS           ATTACHPOLICYTOALLUSERS                                                    
POLICYATTACHTOUSER               ATTACHPOLICYTOUSER                                                        
POLICYBYARN-ADD                                                                                            
POLICYBYARN-REMOVE                                                                                         
POLICYBYNAME-ADD                                                                                           
POLICYBYNAME-REMOVE                                                                                        
POLICYCODECOMMITPOWERUSER-ADD    IAMUSERCODECOMMITPOWERUSER-ADD                                                  
POLICYCODECOMMITPOWERUSER-REMOVE IAMUSERCODECOMMITPOWERUSER-REMOVE                                                  
POLICYCREATE                                                                                               
POLICYDELETE                                                                                               
POLICYGET                        GETPOLICY                                                                 
POLICYGETALL                     GETALLPOLICIES           GAP                                              
POLICYGETLOCAL                   GETLOCALPOLICIES         GLP                                              
POLICYLISTALL                    LISTALLPOLICIES                                                           
POLICYLISTAWS                    LISTAWSPOLICIES                                                           
POLICYLISTLOCAL                  LISTLOCALPOLICIES                                                         
POLICYLISTUSER                   LISTUSERPOLICIES                                                          
POLICYSETATTACH                  ATTACHPOLICYSET                                                           
POLICYSETREMOVE                  REMOVEPOLICYSET                                                           
POLICYUPDATE                     UPDATEPOLICY                                                              
POLICYUSERCHANGEPASSWORD-ADD     IAMUSERCHANGEPASSWORD-ADD                                                  
POLICYUSERCHANGEPASSWORD-REMOVE  IAMUSERCHANGEPASSWORD-REMOVE                                                  
POLICYUSERDETACHALL              DETACHUSERPOLICIES                                                        
ROLELS                           ROLESLIST                LISTROLES                                        
S3CLEARBUCKET                    S3CLEAR                                                                   
S3COPY                                                                                                     
S3COPY-1MINUTE                                                                                             
S3COPYWITHRENAMING                                                                                         
S3CREATEBUCKET                                                                                             
S3CREATEBUCKET-EUCENTRAL1                                                                                  
S3CREATEBUCKET-EUWEST1                                                                                     
S3CREATEBUCKET-USEAST1                                                                                     
S3CREATEBUCKET-USEAST2                                                                                     
S3CREATEBUCKET-USWEST1                                                                                     
S3CREATEBUCKET-USWEST2                                                                                     
S3DELETEBUCKET                                                                                             
S3HTML                                                                                                     
S3LS                             S3LIST                   LB                                               
S3LSR                            S3LISTRECURSIVE          LBR                                              
S3PRESIGN                                                                                                  
S3PUBLISHCLEAR                   PUBLISHCLEAR                                                              
S3PUT                                                                                                      
S3PUTHTML                                                                                                  
S3PUTPDF                                                                                                   
S3PUTPDFFILESET                                                                                            
S3PUTTEXT                                                                                                  
S3REMOVE                         S3RM                                                                      
S3RMFILESET                                                                                                
S3URL                                                                                                      
TAGSLS                           TAGSLIST                                                                  
USERCREATE                       CREATEUSER                                                                
USERCREATEADMIN                  CREATEREADMINUSER                                                         
USERCREATENOKEY                  CREATEUSERNOKEY                                                           
USERCREATEREADONLY               CREATEREADONLYUSER                                                        
USERDELETE                       DELETEUSER                                                                
USERDESCRIBE                     DESCRIBEUSERS            DU                                               
USERLS                           USERLIST                 LISTUSERS                LU                      
USERLS-2                         USERLIST-2               LISTUSERS2                                       
USERLS-JSON                      USERLIST-JSON            LISTUSERS-JSON                                   
USERMENU                                                                                                   
UTILACCOUNTNUMBER                ACCOUNTNUMBER                                                             
UTILALIAS                        ALIAS                                                                     
UTILALIASLS                      ALIASLIST                                                                 
UTILCATPOLICYDOC                 CATPOLICYDOC             SHOWPOLICYDOC                                    
UTILCONFIG                       CONFIG                                                                    
UTILDUMPCONFIG                   DUMPCONFIG               DUMP                                             
UTILNEWPOLICYDOC                 NEWPOLICYDOC                                                              
UTILPUBLISH                      PUBLISH                  S3PUBLISH                                        
UTILPUBLISHCUUREPORT             PUBLISHCUUREPORT                                                          
UTILPUBLISHMORE                  PUBLISHMORE              S3PUBLISHMORE                                    
UTILREPO                         REPO                                                                      
UTILSWAP                                                                                                   
UTILTIME                         TIME                                                                      
VPCCREATE                        CREATEVPC-2SUBNETS                                                        
VPCDELETE                        DELETEVPC                                                                 
VPCINSTANCE                                                                                                
VPCLS                                                                                                      
WWEC2                                                                                                      
</pre>
### ~/.cuu.txt can contain defaults for these settings
<pre>
MYCUUTAG=
PASSWORD=
STARTDATE=2018-05-01T00:00:00Z        ; Obsolete
WATCHPROFILE=
WATCHUSER=
PROFILELIST=
POLICYLIST=
GROUPREMOVE=
POLICYADD=
TIMEFACTOR=1                          ; In hours
MYCIDR=                               ; My CIDR
AMI=                                  ; AMI for instances
SG=                                   ; Security Group for instances
VPCID=                                ; VPC for instances
SUBNET1=                              ; Public Subnet
SUBNET2=                              ; Private Subnet
IGWID=                                ; Internet Gateway ID
KP=                                   ; Key Pair Name
REGION=                               ; Region
REGIONLIST=                           ; Region List
PUBLISHBUCKET=                        ; 
TRUNCATELENGTH=
NOTIFICATION=
NOTIFYFROM=
NOTIFYTO=
</pre>
### Build Date
<pre>
Sat Jul 14 09:13:05 EDT 2018
</pre>
