# CUU - An AWS CLI Wrapper
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-d][-D][-j][-F][-B][-E][-R][-Z][-i][-c]
      -a  operand:  cli profile name      (from .aws/config)
      -u  operand:  username
      -p  operand:  password    (default may be set in ~/.cuu.txt)
      -t  operand:  thing name  (specify a resource or object name)
      -T  operand:  time window in hours (to specify now-T to now)
      -h  display usage
      -d  limits abbreviations
      -D  Specify a document\file to upload (e.g. a policy document)
      -j  use long datetime fields
      -F  force mode, do not confirm any command
      -B  show full user names
      -E  show event names
      -R  show raw records in output
      -Z  output iso time
      -i  interactive mode ('q' to quit)
      -c  command:
          Optional :UL: may specify a user, a list of users, a file, or the keyword ALLUSERS
          Optional :PL: may specify a profile, a list of profiles, or the special keyword ALLPROFILES
          ----------------------------------------------------------------------------------------------
</pre>
<pre>
cuu commands
  
User Commands  
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
     ec2-sg                            -a         Security Group Detail Report
     ec2-sgsum                         -a         Security Group Summary Report
     ec2-spark                         -a         CloudWatch CPU Utilization with Spark Graphing
     ec2-util                          -a         CloudWatch CPU Utilization
  
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
     utilnewpolicydoc                  -a         Create new this.json from policydoc.json template
     utilpublish                       -a         Publish cuureport.txt
     utilswap                          -a         Swap a Policy for a Group
     utiltime                          -a         Print time window
  
</pre>
<pre>
~/.cuu.txt  can contain defaults for these settings
PASSWORD=
STARTDATE=2018-05-01T00:00:00Z        ; Obsolete
WATCHPROFILE=
WATCHUSER=
PROFILELIST=
POLICYLIST=
GROUPREMOVE=
POLICYADD=
TIMEFACTOR=1                          ; In minutes
MYCIDR=                               ; My CIDR
AMI=                                  ; AMI for instances
SG=                                   ; Security Group for instances
VPCID=                                ; VPC for instances
SUBNET1=                              ; Public Subnet
SUBNET2=                              ; Private Subnet
IGWID=                                ; Internet Gateway ID
KP=                                   ; Key Pair Name
</pre>
<pre>
  
Wed Jun 13 09:56:18 EDT 2018
</pre>
