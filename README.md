# CUU Repo - A set of AWS CLI Wrappers and Utility Scripts
Script | Description | Usage | Defaults
------ | ----------- | ----- | --------
cuu | A multi function AWS CLI Wrapper Utility | See below
ec2ls | A ec2 listing utility | ec2ls -a "\<profile list\>" -r "\<region list\>" | All US regions
ec2sg | A sg check utility | ec2sg -a "\<profile list\>" -r "\<region list\>" | EUROPE, US, GLOBAL, or specific region string
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
       build date: Tue Jun 11 23:13:18 EDT 2019
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
Command            Options        Ver    Description                                   Aliases
COST               -a -b          v1.5   Cost report                                   
COSTDAY            -a -b          v2.0   Cost report last month to today (gnuplot)     
COSTDETAIL         -a -b          v1.5   Cost detail report                            
DDBDELETETABLE     -a -t          v1.0   Delete DynamoDB table                         
DDBLS              -a -t          v1.0   List DynamoDB tables                          DDBLIST 
EC2SG              -a             v1.0   Security Group Detail Report                  
EC2TAGS            -a [-r]        v1.0   List EC2 Tags                                 ECT 
ELS                -a             v1.0   EC2 List with CPU Utilization                 ECPU ECPULS 
LAMBDALS           -a             v2.0   List Lambda Functions                         LAMBDATLIST 
PASSWORDCHANGE     -a -u -p       v1.5   Change a users password (given pword)         CHANGEPASSWORD 
PASSWORDRESET      -a -u -p       v1.1   Reset use password to a random password       RESET 
PASSWORDSCRAM      -a -u          v1.5   Make a users password unknown                 SCRAMPASSWORD SCRAM 
POLICYDETACH       -a -u -t arn   v1.0   Detach policy from user                       
POLICYLISTALL      -a             v1.0   List all policies                             LISTALLPOLICIES POLICYLS 
POLICYLISTAWS      -a             v1.0   List all AWS policies                         LISTAWSPOLICIES 
POLICYLISTLOCAL    -a             v1.0   List local policies                           LISTLOCALPOLICIES 
S3CREATEBUCKET     -a -b [-r]     v1.2   Create S3 Bucket                              S3CB 
S3DELETEBUCKET     -a -b          v1.0   Deletes a S3 Bucket                           S3RB 
S3LS               -a [-b]        v1.0   S3 List                                       S3LIST LB 
S3LSR              -a [-b]        v1.0   S3 List (recursive)                           S3LISTR LBR 
S3PUT              -a -b -k -d    v1.5   S3 Put Object                                 
S3PUTPDF           -a -b -k -d    v1.5   S3 Put PDF Object                             
USERCREATEDEFAULT  -a -u          v1.5   Create a user with default settings           CREATEDEFAULTUSER CDU 
USERDELETE         -a -u          v1.0   Delete user                                   DELETEUSER 
USERDESCRIBE       -a -u          v2.5   List groups & policies a/w user or userlist   DESCRIBEUSERS DU 
USERLS             -a             v2.0   User listing                                  USERLIST LISTUSERS LU 
USERLSS            -a             v2.0   User listing in simple format                 LUS 
UTILACCOUNTNUMBER  -a             v1.1   Print account number                          ACCOUNTNUMBER 
UTILCONSOLE        -a             v1.0   Open AWS Console                              CONSOLE 
UTILOGINURL        -a             v1.0   Print console login URL                       LOGINURL LOGIN 
UTILSET            -a             v1.5   Set & show config/env variables               SET 
VOLUMELS           -a -r          v1.0   Volume List                                   VOLLS 
VPCCREATE          -a -r          v1.0   Create a Two Subnet VPC                       CREATEVPC-2SUBNETS 
VPCDELETE          -a -r -t       v1.0   Delete VPC                                    DELETEVPC 
VPCLS              -a             v1.0   List VPCs                                     
### Command Aliases
<pre>
ACCESSKEYCREATE                  CREATEACCESSKEY                                                           
ACCESSKEYREPLACE                 REPLACEACCESSKEYS                                                         
ACCESSKEYSDELETE                 ACCESSKEYCLEAR           DELETEACCESSKEYS                                 
ACCESSKEYSLS                     ACCESSKEYLIST            LISTACCESSKEYS                                   
ADMINACCESS                                                                                                
AMICREATE                                                                                                  
AMILS                                                                                                      
CL                                                                                                         
CLEARCUUOUT                                                                                                
CLOUDTRAIL-ACTIVE                                                                                          
CLOUDTRAIL-USER                  CU                                                                        
CLOUDTRAIL-WATCH                                                                                           
CLOUDTRAILMENU                                                                                             
CLOUDTRAILWORLD                  WORLD                                                                     
COST                                                                                                       
COST2                                                                                                      
COSTDAY                                                                                                    
COSTDETAIL                                                                                                 
DDBCREATENAMEVALUETABLE                                                                                    
DDBCREATETABLE                                                                                             
DDBDELETETABLE                                                                                             
DDBGETNAMEVALUE                                                                                            
DDBLS                            DDBLIST                                                                   
DDBPUTNAMEVALUE                                                                                            
DDBQUERYNAMEVALUE                                                                                          
EC2-UTIL                                                                                                   
EC2LS                            EC2LIST                                                                   
EC2LS2                           EC2LIST2                                                                  
EC2MYLS                          EC2LSMY                                                                   
EC2SG                                                                                                      
EC2SGSUM                                                                                                   
EC2SGSUM2                                                                                                  
EC2SPARK                                                                                                   
EC2SPARKMENU                                                                                               
EC2TAGS                          ECT                                                                       
EC2TAGS2222                                                                                                
EC2TERMINATE                                                                                               
EC2TERMINATELAST                                                                                           
ELS                              ECPU                     ECPULS                                           
GAPP                                                                                                       
GROUPADDUSER                     GROUPADD                                                                  
GROUPCREATE                                                                                                
GROUPDELETE                                                                                                
GROUPG1-ADD                                                                                                
GROUPG1-REMOVE                                                                                             
GROUPG2-ADD                                                                                                
GROUPG3-ADD                                                                                                
GROUPG4-ADD                                                                                                
GROUPG5-ADD                                                                                                
GROUPLISTUSERS                   LISTUSERSINGROUP                                                          
GROUPLS                          GROUPLIST                LISTGROUPS                                       
GROUPP2-REMOVE                                                                                             
GROUPP3-REMOVE                                                                                             
GROUPP4-REMOVE                                                                                             
GROUPP5-REMOVE                                                                                             
GROUPREMOVEALLUSERS                                                                                        
GROUPREMOVEUSER                                                                                            
GROUPSFORUSER                    LISTUSERGROUPS                                                            
HISTO                                                                                                      
KEYPAIRCREATE                    CREATEKEYPAIR                                                             
LAMBDALS                         LAMBDATLIST                                                               
LOGINPROFILECREATE                                                                                         
LUJ                                                                                                        
ONE                              TWO                      THREE                                            
PASSWORD                                                                                                   
PASSWORDCHANGE                   CHANGEPASSWORD                                                            
PASSWORDCHANGEHARD               CHANGEPASSWORDHARD                                                        
PASSWORDFIXED                    FIXED                                                                     
PASSWORDRESET                    RESET                                                                     
PASSWORDSCRAM                    SCRAMPASSWORD            SCRAM                                            
PASSWORDSCRAMSET                 SCRAMPASSWORDSET                                                          
PLOT                                                                                                       
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
POLICYDETACH                                                                                               
POLICYGET                        GETPOLICY                                                                 
POLICYGETALL                     GETALLPOLICIES           GAP                                              
POLICYGETDOCUMENT                                                                                          
POLICYGETLOCAL                   GETLOCALPOLICIES         GLP                                              
POLICYLISTALL                    LISTALLPOLICIES          POLICYLS                                         
POLICYLISTAWS                    LISTAWSPOLICIES                                                           
POLICYLISTLOCAL                  LISTLOCALPOLICIES                                                         
POLICYLISTUSER                   LISTUSERPOLICIES                                                          
POLICYP1-ADD                     P1A                                                                       
POLICYP1-REMOVE                  P1R                                                                       
POLICYP2-ADD                     P2A                                                                       
POLICYP2-REMOVE                  P2R                                                                       
POLICYP3-ADD                     P3A                                                                       
POLICYP3-REMOVE.P3R                                                                                        
POLICYP4-ADD                     P4A                                                                       
POLICYP4-REMOVE                  P4R                                                                       
POLICYP5-ADD                     P5A                                                                       
POLICYP5-REMOVE                  P5R                                                                       
POLICYSETATTACH                  ATTACHPOLICYSET                                                           
POLICYSETREMOVE                  REMOVEPOLICYSET                                                           
POLICYUPDATE                     UPDATEPOLICY                                                              
POLICYUSERADMIN-REMOVE           IAMUSERADMIN-REMOVE      NOADMIN                                          
POLICYUSERCHANGEPASSWORD-ADD     IAMUSERCHANGEPASSWORD-ADD                                                  
POLICYUSERCHANGEPASSWORD-REMOVE  IAMUSERCHANGEPASSWORD-REMOVE                                                  
POLICYUSERDETACHALL              DETACHUSERPOLICIES                                                        
RDSLIMITS                                                                                                  
RDSLIST                          RDSLS                                                                     
REPORT                                                                                                     
RESETX                                                                                                     
ROLELS                           ROLESLIST                LISTROLES                                        
RUNNING                                                                                                    
S3CLEARBUCKET                    S3CLEAR                                                                   
S3COPY                                                                                                     
S3COPY-1MINUTE                                                                                             
S3COPYWITHRENAMING                                                                                         
S3CREATEBUCKET                   S3CB                                                                      
S3CREATEBUCKET-EUCENTRAL1                                                                                  
S3CREATEBUCKET-EUWEST1                                                                                     
S3CREATEBUCKET-USEAST1                                                                                     
S3CREATEBUCKET-USEAST2                                                                                     
S3CREATEBUCKET-USWEST1                                                                                     
S3CREATEBUCKET-USWEST2                                                                                     
S3DELETEBUCKET                   S3RB                                                                      
S3HTML                                                                                                     
S3LS                             S3LIST                   LB                                               
S3LSR                            S3LISTR                  LBR                                              
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
SCRAMSET                                                                                                   
SNAPSHOTLS                                                                                                 
STAMPCUUOUT                      STAMP                                                                     
TAGG                                                                                                       
TAGSLS                           TAGSLIST                                                                  
UNSCRAMPROFILECREATE                                                                                       
USERCREATE                       CREATEUSER                                                                
USERCREATEADMIN                  CREATEREADMINUSER                                                         
USERCREATEDEFAULT                CREATEDEFAULTUSER        CDU                                              
USERCREATENOKEY                  CREATEUSERNOKEY                                                           
USERCREATEREADONLY               CREATEREADONLYUSER                                                        
USERDELETE                       DELETEUSER                                                                
USERDELETELIST                                                                                             
USERDESCRIBE                     DESCRIBEUSERS            DU                                               
USERLS                           USERLIST                 LISTUSERS                LU                      
USERLS-JSON                      USERLIST-JSON            LISTUSERS-JSON                                   
USERLSS                          LUS                                                                       
USERMENU                                                                                                   
UTILACCOUNTNUMBER                ACCOUNTNUMBER                                                             
UTILALIAS                        ALIAS                                                                     
UTILALIASLS                      ALIASLIST                                                                 
UTILCATPOLICYDOC                 CATPOLICYDOC             SHOWPOLICYDOC                                    
UTILCONFIG                       CONFIG                                                                    
UTILCONSOLE                      CONSOLE                                                                   
UTILDUMPCONFIG                   DUMPCONFIG               DUMP                                             
UTILNEWPOLICYDOC                 NEWPOLICYDOC                                                              
UTILOGINURL                      LOGINURL                 LOGIN                                            
UTILPUBLISH                      PUBLISH                  S3PUBLISH                                        
UTILPUBLISHCUUREPORT             PUBLISHCUUREPORT                                                          
UTILPUBLISHMORE                  PUBLISHMORE              S3PUBLISHMORE                                    
UTILREPO                         REPO                                                                      
UTILSWAP                                                                                                   
UTILTIME                         TIME                                                                      
VIMS3PUT                         S3VIMPUT                                                                  
VOLUMELS                         VOLLS                                                                     
VOLUMESNAP                       SNAPSHOT                                                                  
VOLUMESTORAGE                    EBS                                                                       
VPCCREATE                        CREATEVPC-2SUBNETS                                                        
VPCDELETE                        DELETEVPC                                                                 
VPCINSTANCE                                                                                                
VPCLS                                                                                                      
WWEC2                                                                                                      
</pre>
### ~/.cuu.txt can contain defaults for these settings
<pre>
MYCUUTAG=
DEFAULTUSERGROUP=
DEFAULTUSERPOLICY=
REGION=
REGIONLIST=
PROFILELIST=
PUBLISHBUCKET=
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
Tue Jun 11 23:13:25 EDT 2019
</pre>
