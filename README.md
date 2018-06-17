# CUU - An AWS CLI Wrapper
### Commands  
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-d][-D][-j][-F][-B][-E][-R][-Z][-i][-c]
  info
       build date: Sun Jun 17 12:07:40 EDT 2018
       repo:       https://github.com/archernar/cuu
  operands
      -a  operand:  cli profile name, maps to AWS account  (from .aws/config)
      -u  operand:  username
      -p  operand:  password    (default may be set in ~/.cuu.txt)
      -t  operand:  thing name  (specify a resource or object name)
      -T  operand:  time window in hours (to specify (now minus T) to now)
      -D  operand:  specify a document\file to upload (e.g. a policy document)
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
  commands
     usercreateadmin                   -a -u -p   Create admin user
     usercreate                        -a -u -p   Create a user and assign access keys
     usercreatenokey                   -a -u -p   Create a user with no access keys
     usercreatereadonly                -a -u -p   Create readonly user
     userdelete                        -a -u      Delete user
     userdescribe                      -a -u      Lists groups and policies associated with user/userlist
     userlist-2                        -a         User listing (simple format)
     userlist                          -a         User listing
     userlist-json                     -a         User list in json format
     usermenu                          -a         Menu driven user information
  
Password Commands  
     passwordchange                    -a -u -p   Change a users password
     passwordscram                     -a -u      Make a users password unkown (scram)
  
AccessKey Commands  
     accesskeycreate                   -a         Create access keys for user
     accesskeyreplace                  -a         Delete and replace access keys
     accesskeysdelete                  -a         Delete all access keys attached to user
     accesskeyslist                    -a         List a users access keys
  
Policy Commands  
     policyattachtoallusers            -a -t      Attach policy to all users
     policyattachtouser                -a -u      Attach policy to user
     policybyarn-add                   -a -u -t   Attach policy to user by ARN
     policybyarn-remove                -a -u -t   Detach policy from user by ARN
     policybyname-add                  -a -t      Attach local policy to user by policy name
     policybyname-remove               -a -t      Detach local policy from user by policy name
     policycodecommitpoweruser-add     -a         Add arn:aws:iam::aws:policy/AWSCodeCommitPowerUser to user
     policycodecommitpoweruser-remove  -a         Remove arn:aws:iam::aws:policy/AWSCodeCommitPowerUser from user
     policycreate                      -a -t      Create policy bu name and upload policy document this.json
     policydelete                      -a -t      Delete local policy ARN
     policygetall                      -a         Get all policy documents
     policyget                         -a -t      Get policy
     policygetlocal                    -a         Get local policy documents
     policylistall                     -a         List all policies
     policylistaws                     -a         List all AWS policies
     policylistlocal                   -a         List local policies
     policylistuser                    -a -u      List policies atttached to user
     policysetattach                   -a -u      Attach all policies specified in policyset.txt to user
     policysetremove                   -a -u      Remove all policies specified in policyset.txt from user
     policyupdate                      -a -t -D   Update policy
     policyuserchangepassword-add      -a         Add arn:aws:iam::aws:policy/IAMUserChangePassword to user
     policyuserchangepassword-remove   -a         Remove arn:aws:iam::aws:policy/IAMUserChangePassword from user
     policyuserdetachall               -a -u      Detach all policies from user
  
Group Commands  
     groupadduser                      -a -t      Add user/userlist to group
     groupcreate                       -a -t      Create group in profile
     groupdelete                       -a -u -t   Delete group from profile by group name
     grouplist                         -a         List groups in profile
     grouplistusers                    -a         List users in group
     groupremoveallusers               -a         Remove all groups atttach to user
     groupremoveuser                   -a         Remove user from group by group name
     groupsforuser                     -a         List groups attached to user
  
Role Commands  
     roleslist                         -a         List Roles
  
VPC Commands  
     vpccreate                         -a -r      Create a Two Subnet VPC
     vpcdelete                         -a -r -t   Delete VPC
  
EC2 Commands  
     ec2                               -a         Describe Instances
     ec2-list                          -a         EC2 List
     ec2list                           -a         List Instances
     ec2-sg                            -a         Security Group Detail Report
     ec2-sgsum                         -a         Security Group Summary Report
     ec2spark                          -a -t      CloudWatch CPU Utilization with Spark Graphing
     ec2sparkmenu                      -a         Instance Menu
     ec2-util                          -a         CloudWatch CPU Utilization
  
S3 Commands  
     s3copy-1minute                    -a -b -d   S3 Copy, Expires in 1 Minute
     s3copy                            -a -b -d   S3 Copy, with wildcard (%) documents
     s3createbucket-eucentral1         -a -b      Create S3 Bucket in eu-central-1
     s3createbucket-euwest1            -a -b      Create S3 Bucket in eu-west-1
     s3createbucket-useast1            -a -b      Create S3 Bucket in us-east-1
     s3createbucket-useast2            -a -b      Create S3 Bucket in us-east-2
     s3createbucket-uswest1            -a -b      Create S3 Bucket in us-west-1
     s3createbucket-uswest2            -a -b      Create S3 Bucket in us-west-2
     s3deletebucket                    -a -b      Deletes a S3 Bucket
     s3list                            -a         S3 List
     s3listrecursive                   -a         S3 Recursive List
     s3presign                         -a -b -k   Presign S3 URL
     s3put                             -a -b -k -d   S3 Put Object
     s3puthtml                         -a -b -k -d   S3 Put HTML Object
     s3putpdf                          -a -b -k -d   S3 Put PDF Object
     s3putpdffileset                   -a -b      S3 Put PDF Fileset
     s3puttext                         -a -b -k -d   S3 Put Text Object
     s3remove                          -a -b -k   S3 Remove Object, with wildcard (%) keys
     s3rmfileset                       -a -b      S3 Remove Fileset
     s3url                             -a -b -k   Create a Signed URL
  
CloudTrail Commands  
     cloudtrail-active                 -a         Cloudtrail watch all activity in the time window
     cloudtrailmenu                    -a         Menu interface to pick and watch users via cloudtrail
     cloudtrail-user                   -a         Tracks a user's activity via cloud trail
     cloudtrail-watch                  -a         Cloudtrail watch a user across multiple profiles
     cloudtrailworld                   -a         CloudTrail report for 100 hour window for user across all regions
  
Utility Commands  
     utilaccountnumber                 -a         Print account number
     utilcommandlist                   -a         List Commands
     utilcommands                      -a         Command help
     utilconfig                        -a         Edit Configuration File ~/.cuu.txt
     utilnewpolicydoc                  -a         Create new this.json from policydoc.json template
     utilpublish                       -a         Publish cuureport.txt
     utilswap                          -a         Swap a Policy for a Group
     utiltime                          -a         Print time window
</pre>
### Command Aliases
<pre>
ACCESSKEYCREATE                  CREATEACCESSKEY                                  
ACCESSKEYREPLACE                 REPLACEACCESSKEYS                                
ACCESSKEYSDELETE                 DELETEACCESSKEYS                                 
ACCESSKEYSLIST                   LISTACCESSKEYS                                   
CLOUDTRAIL-ACTIVE                                                                 
CLOUDTRAIL-USER                                                                   
CLOUDTRAIL-WATCH                                                                  
CLOUDTRAILMENU                                                                    
CLOUDTRAILWORLD                  WORLD                                            
EC2                                                                               
EC2-LIST                                                                          
EC2-SG                                                                            
EC2-SGSUM                                                                         
EC2-UTIL                                                                          
EC2LIST                          LISTEC2                  LI                      
EC2SPARK                                                                          
EC2SPARKMENU                                                                      
GROUPADDUSER                                                                      
GROUPCREATE                                                                       
GROUPDELETE                                                                       
GROUPLIST                        LISTGROUPS                                       
GROUPLISTUSERS                   LISTUSERSINGROUP                                 
GROUPREMOVEALLUSERS                                                               
GROUPREMOVEUSER                                                                   
GROUPSFORUSER                    LISTUSERGROUPS                                   
KEYPAIRCREATE                    CREATEKEYPAIR                                    
PASSWORDCHANGE                   CHANGEPASSWORD                                   
PASSWORDSCRAM                    SCRAMPASSWORD                                    
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
ROLESLIST                        LISTROLES                                        
S3COPY                                                                            
S3COPY-1MINUTE                                                                    
S3CREATEBUCKET-EUCENTRAL1                                                         
S3CREATEBUCKET-EUWEST1                                                            
S3CREATEBUCKET-USEAST1                                                            
S3CREATEBUCKET-USEAST2                                                            
S3CREATEBUCKET-USWEST1                                                            
S3CREATEBUCKET-USWEST2                                                            
S3DELETEBUCKET                                                                    
S3LIST                           S3LS                     LB                      
S3LISTRECURSIVE                  S3LSR                    LBR                     
S3PRESIGN                                                                         
S3PUT                                                                             
S3PUTHTML                                                                         
S3PUTPDF                                                                          
S3PUTPDFFILESET                                                                   
S3PUTTEXT                                                                         
S3REMOVE                         S3RM                                             
S3RMFILESET                                                                       
S3URL                                                                             
TEST                                                                              
TEST2                                                                             
USERCREATE                       CREATEUSER                                       
USERCREATEADMIN                  CREATEREADMINUSER                                
USERCREATENOKEY                  CREATEUSERNOKEY                                  
USERCREATEREADONLY               CREATEREADONLYUSER                               
USERDELETE                       DELETEUSER                                       
USERDESCRIBE                     DESCRIBEUSERS            DU                      
USERLIST                         LISTUSERS                                        
USERLIST-2                       LISTUSERS2                                       
USERLIST-JSON                    LISTUSERS-JSON                                   
USERMENU                                                                          
UTILACCOUNTNUMBER                ACCOUNTNUMBER                                    
UTILALIAS                        ALIAS                                            
UTILALIASLIST                    ALIASLIST                                        
UTILCOMMANDLIST                  COMMANDLIST                                      
UTILCOMMANDS                     COMMANDS                                         
UTILCONFIG                       CONFIG                                           
UTILNEWPOLICYDOC                 NEWPOLICYDOC                                     
UTILPUBLISH                      PUBLISH                                          
UTILSWAP                                                                          
UTILTIME                         TIME                                             
VPCCREATE                        CREATEVPC-2SUBNETS                               
VPCDELETE                        DELETEVPC                                        
WWEC2                                                                             
</pre>
### ~/.cuu.txt can contain defaults for these settings
<pre>
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
</pre>
### Build Date
<pre>
Sun Jun 17 12:07:42 EDT 2018
</pre>
