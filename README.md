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
       build date: Tue Jun 11 23:26:34 EDT 2019
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
GROUPLS            -a             v1.0   List groups in profile                        GROUPLIST LISTGROUPS 
LAMBDALS           -a             v2.0   List Lambda Functions                         LAMBDATLIST 
PASSWORDCHANGE     -a -u -p       v1.5   Change a users password (given pword)         CHANGEPASSWORD 
PASSWORDRESET      -a -u -p       v1.1   Reset use password to a random password       RESET 
PASSWORDSCRAM      -a -u          v1.5   Make a users password unknown                 SCRAMPASSWORD SCRAM 
POLICYDETACH       -a -u -t arn   v1.0   Detach policy from user                       
POLICYLISTALL      -a             v1.0   List all policies                             LISTALLPOLICIES POLICYLS 
POLICYLISTAWS      -a             v1.0   List all AWS policies                         LISTAWSPOLICIES 
POLICYLISTLOCAL    -a             v1.0   List local policies                           LISTLOCALPOLICIES 
ROLELS             -a             v1.1   List Roles                                    ROLESLIST LISTROLES 
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
USERLSJSON         -a             v1.1   List users (json format)                      USERLISTJSON LUJ 
USERLSS            -a             v2.0   User listing in simple format                 LUS 
UTILACCOUNTNUMBER  -a             v1.1   Print account number                          ACCOUNTNUMBER 
UTILCONSOLE        -a             v1.0   Open AWS Console                              CONSOLE 
UTILOGINURL        -a             v1.0   Print console login URL                       LOGINURL LOGIN 
UTILSET            -a             v1.5   Set & show config/env variables               SET 
VOLUMELS           -a -r          v1.0   Volume List                                   VOLLS 
VPCCREATE          -a -r          v1.0   Create a Two Subnet VPC                       CREATEVPC-2SUBNETS 
VPCDELETE          -a -r -t       v1.0   Delete VPC                                    DELETEVPC 
VPCLS              -a             v1.0   List VPCs                                     
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
Tue Jun 11 23:26:38 EDT 2019
</pre>
