# CUU Repo - A set of AWS CLI Wrappers and Utility Scripts
COST | -a [-r] -u | v1.5 | Cost report | -
COSTDAY | -a [-r] -u | v2.0 | Cost report last month to today (gnuplot) | -
COSTDETAIL | -a [-r] -u | v1.5 | Cost detail report | -
DDBCREATETABLE | -a -t <table> | v1.0 | Create a DynamoDB table | -
DDBDELETETABLE | -a [-r] -u | v1.0 | Delete DynamoDB table | -
DDBLS | -a [-r] -u | v1.0 | List DynamoDB tables | DDBLIST 
EC2RUNNING | -r | v1.1 | Running EC2 Instances | RUNNING 
EC2SG | -a [-r] | v1.0 | Security Group Detail Report | -
EC2TAGS | -a [-r] | v1.0 | List EC2 Tags | ECT 
EC2TERMINATE | -a [-r] -t <id> | v1.1 | Terminate Instance | -
ELS | -a [-r] | v1.0 | EC2 List with CPU Utilization | ECPU ECPULS 
GROUPDELETE | -a -u -t <g> | v1.0 | Delete group from profile by group name | -
GROUPLS | -a [-r] | v1.0 | List groups in profile | GROUPLIST LISTGROUPS 
LAMBDALS | -a [-r] | v2.0 | List Lambda Functions | LAMBDATLIST 
PASSWORDCHANGE | -a [-r] -u | v1.5 | Change a users password (given pword) | CHANGEPASSWORD 
PASSWORDRESET | -a [-r] -u | v1.1 | Reset useir password to a random password | RESET PASSWORD 
PASSWORDSCRAM | -a [-r] -u | v1.5 | Make a users password unknown | SCRAMPASSWORD SCRAM 
POLICYATTACHADMIN | -a [-r] -u | v1.0 | Attach admin policy to user | ADMINACCESS 
POLICYATTACHREADONLY | -a [-r] -u | v1.0 | Attach readonly policy to user | READONLYACCESS 
POLICYDETACH | -a [-r] -u -t arn | v1.0 | Detach policy from user | -
POLICYLISTALL | -a [-r] | v1.0 | List all policies | LISTALLPOLICIES POLICYLS 
POLICYLISTAWS | -a [-r] | v1.0 | List all AWS policies | LISTAWSPOLICIES 
POLICYLISTLOCAL | -a [-r] | v1.0 | List local policies | LISTLOCALPOLICIES 
POLICYLISTUSER | -a [-r] -u | v1.0 | List policies atttached to user | LISTUSERPOLICIES 
POLICYUSERDETACHALL | -a [-r] -u | v1.0 | Detach all policies from user | DETACHUSERPOLICIES 
ROLELS | -a [-r] | v1.1 | List Roles | ROLESLIST LISTROLES 
S3COPY-1MINUTE | -a -b -d | v1.5 | Copy Document to S3, Expires in 1 Minute | S3C1M 
S3CREATEBUCKET | -a [-r] -b | v1.2 | Create S3 Bucket | S3CB 
S3DELETEBUCKET | -a [-r] -b | v1.0 | Delete S3 Bucket | S3RB 
S3LS | -a [-r] [-b] | v1.0 | List S3 | S3LIST LB 
S3LSR | -a [-r] [-b] | v1.0 | List S3 (recursive) | S3LISTR LBR 
S3PUT | -a [-r] -b -k -d | v1.5 | Put S3 Object | -
S3PUTPDF | -a [-r] -b -k -d | v1.5 | Put S3 PDF Object | -
USERCREATEADMIN | -a [-r] -u -p [-t <g>] | v1.1 | Create admin user | CREATEADMINUSER 
USERCREATE | -a [-r] -u -p [-t <g>] | v1.1 | Create a user and assign access keys | CREATEUSER 
USERCREATEDEFAULT | -a [-r] -u | v1.5 | Create a user with default settings | CREATEDEFAULTUSER CDU 
USERCREATENOKEY | -a [-r] -u -p [-t <g>] | v1.1 | Create user with no access keys | CREATEUSERNOKEY 
USERCREATEREADONLY | -a [-r] -u -p [-t <g>] | v1.1 | Create readonly user | CREATEREADONLYUSER 
USERDELETE | -a [-r] -u | v1.0 | Delete user | DELETEUSER 
USERDESCRIBE | -a [-r] -u | v2.5 | List groups & policies a/w user or userlist | DESCRIBEUSERS DU 
USERLS | -a [-r] | v2.0 | User listing | USERLIST LISTUSERS LU 
USERLSJSON | -a [-r] | v1.1 | List users (json format) | USERLISTJSON LUJ 
USERLSS | -a [-r] | v2.0 | User listing in simple format | LUS 
UTILACCOUNTNUMBER | -a [-r] | v1.1 | Print account number | ACCOUNTNUMBER 
UTILCONSOLE | -a [-r] | v1.0 | Open AWS Console | CONSOLE 
UTILOGINURL | -a [-r] | v1.0 | Print console login URL | LOGINURL LOGIN 
UTILSET | -a [-r] | v1.5 | Set & show config/env variables | SET 
VOLUMELS | -a [-r] | v1.0 | Volume List | VOLLS 
VPCCREATE | -a [-r] | v1.0 | Create a Two Subnet VPC | CREATEVPC-2SUBNETS 
VPCDELETE | -a [-r] -u | v1.0 | Delete VPC | DELETEVPC 
VPCLS | -a [-r] | v1.0 | List VPCs | -
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
       build date: Fri Jun 14 16:42:25 EDT 2019
       repo:       https://github.com/archernar/cuu
  operands
      -c  <operand>:  a command name (see below)
      -a  <operand>:  cli profile name, maps to AWS account (from .aws/config)
      -u  <operand>:  username    (use \"ALLUSERS\" to operate on all users)
      -p  <operand>:  password    (default may be set in ~/.cuu.txt)
      -t  <operand>:  thing name  (specify a resource or object name)
      -T  <operand>:  time window in hours (to specify (now minus T) to now)
      -D  <operand>:  specify a document\file to upload (e.g. a policy document)
      -e  <operand>:  expire time in seconds (0 == 7 days)
      -b  <operand>:  S3 bucket name
      -k  <operand>:  S3 key name
      -C  <operand>:  content type (pdf, text, html, mp3)
      -n  <operand>:  name string
  flags
      -h              display usage
      -d              limits abbreviations
      -j              use long datetime fields
      -F              force mode, do not confirm any command
      -B              show full user names
      -E              show event names
      -R              show raw records in output
      -Z              output iso time
      -i              interactive mode ('q' to quit)
          Optional :UL: may specify a user, a list of users, a file, or the keyword ALLUSERS
          Optional :PL: may specify a profile, a list of profiles, or the special keyword ALLPROFILES
 
</pre>
### Commands  
<pre>
COST | -a [-r] -u | v1.5 | Cost report | -
COSTDAY | -a [-r] -u | v2.0 | Cost report last month to today (gnuplot) | -
COSTDETAIL | -a [-r] -u | v1.5 | Cost detail report | -
DDBCREATETABLE | -a -t <table> | v1.0 | Create a DynamoDB table | -
DDBDELETETABLE | -a [-r] -u | v1.0 | Delete DynamoDB table | -
DDBLS | -a [-r] -u | v1.0 | List DynamoDB tables | DDBLIST 
EC2RUNNING | -r | v1.1 | Running EC2 Instances | RUNNING 
EC2SG | -a [-r] | v1.0 | Security Group Detail Report | -
EC2TAGS | -a [-r] | v1.0 | List EC2 Tags | ECT 
EC2TERMINATE | -a [-r] -t <id> | v1.1 | Terminate Instance | -
ELS | -a [-r] | v1.0 | EC2 List with CPU Utilization | ECPU ECPULS 
GROUPDELETE | -a -u -t <g> | v1.0 | Delete group from profile by group name | -
GROUPLS | -a [-r] | v1.0 | List groups in profile | GROUPLIST LISTGROUPS 
LAMBDALS | -a [-r] | v2.0 | List Lambda Functions | LAMBDATLIST 
PASSWORDCHANGE | -a [-r] -u | v1.5 | Change a users password (given pword) | CHANGEPASSWORD 
PASSWORDRESET | -a [-r] -u | v1.1 | Reset useir password to a random password | RESET PASSWORD 
PASSWORDSCRAM | -a [-r] -u | v1.5 | Make a users password unknown | SCRAMPASSWORD SCRAM 
POLICYATTACHADMIN | -a [-r] -u | v1.0 | Attach admin policy to user | ADMINACCESS 
POLICYATTACHREADONLY | -a [-r] -u | v1.0 | Attach readonly policy to user | READONLYACCESS 
POLICYDETACH | -a [-r] -u -t arn | v1.0 | Detach policy from user | -
POLICYLISTALL | -a [-r] | v1.0 | List all policies | LISTALLPOLICIES POLICYLS 
POLICYLISTAWS | -a [-r] | v1.0 | List all AWS policies | LISTAWSPOLICIES 
POLICYLISTLOCAL | -a [-r] | v1.0 | List local policies | LISTLOCALPOLICIES 
POLICYLISTUSER | -a [-r] -u | v1.0 | List policies atttached to user | LISTUSERPOLICIES 
POLICYUSERDETACHALL | -a [-r] -u | v1.0 | Detach all policies from user | DETACHUSERPOLICIES 
ROLELS | -a [-r] | v1.1 | List Roles | ROLESLIST LISTROLES 
S3COPY-1MINUTE | -a -b -d | v1.5 | Copy Document to S3, Expires in 1 Minute | S3C1M 
S3CREATEBUCKET | -a [-r] -b | v1.2 | Create S3 Bucket | S3CB 
S3DELETEBUCKET | -a [-r] -b | v1.0 | Delete S3 Bucket | S3RB 
S3LS | -a [-r] [-b] | v1.0 | List S3 | S3LIST LB 
S3LSR | -a [-r] [-b] | v1.0 | List S3 (recursive) | S3LISTR LBR 
S3PUT | -a [-r] -b -k -d | v1.5 | Put S3 Object | -
S3PUTPDF | -a [-r] -b -k -d | v1.5 | Put S3 PDF Object | -
USERCREATEADMIN | -a [-r] -u -p [-t <g>] | v1.1 | Create admin user | CREATEADMINUSER 
USERCREATE | -a [-r] -u -p [-t <g>] | v1.1 | Create a user and assign access keys | CREATEUSER 
USERCREATEDEFAULT | -a [-r] -u | v1.5 | Create a user with default settings | CREATEDEFAULTUSER CDU 
USERCREATENOKEY | -a [-r] -u -p [-t <g>] | v1.1 | Create user with no access keys | CREATEUSERNOKEY 
USERCREATEREADONLY | -a [-r] -u -p [-t <g>] | v1.1 | Create readonly user | CREATEREADONLYUSER 
USERDELETE | -a [-r] -u | v1.0 | Delete user | DELETEUSER 
USERDESCRIBE | -a [-r] -u | v2.5 | List groups & policies a/w user or userlist | DESCRIBEUSERS DU 
USERLS | -a [-r] | v2.0 | User listing | USERLIST LISTUSERS LU 
USERLSJSON | -a [-r] | v1.1 | List users (json format) | USERLISTJSON LUJ 
USERLSS | -a [-r] | v2.0 | User listing in simple format | LUS 
UTILACCOUNTNUMBER | -a [-r] | v1.1 | Print account number | ACCOUNTNUMBER 
UTILCONSOLE | -a [-r] | v1.0 | Open AWS Console | CONSOLE 
UTILOGINURL | -a [-r] | v1.0 | Print console login URL | LOGINURL LOGIN 
UTILSET | -a [-r] | v1.5 | Set & show config/env variables | SET 
VOLUMELS | -a [-r] | v1.0 | Volume List | VOLLS 
VPCCREATE | -a [-r] | v1.0 | Create a Two Subnet VPC | CREATEVPC-2SUBNETS 
VPCDELETE | -a [-r] -u | v1.0 | Delete VPC | DELETEVPC 
VPCLS | -a [-r] | v1.0 | List VPCs | -
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
Fri Jun 14 16:42:31 EDT 2019
</pre>
