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
Quick Menus
     dum    describeusermenu         -a            Interactive user menu, Describes users
     ctm    cloudtrailmenu           -a            Interactive user menu, CloudTrail 48Hr Audit Report
User Commands
     du     describeusers            -a :PL:       List users and their attached groups and policies" 
     lu     listusers                -a :PL:       List users" 
     lu2    listusers2               -a :PL:       List users simple form" 
            deleteuser               -a -u         Delete the user
     du     describeusers            -a :PL:       List users and their attached groups and policies" 
            createuser               -a -u -p      Creates with no privledges
            createadminuser          -a -u -p      Creates a user with Administor Access
            createreadonlyuser       -a -u -p      Creates a user with Read Only
     scram  scrampassword            -a -u         Assignis the user an unknown (scrammed) password
     cp     changepassword           -a -u -p      Changes a user password
                                                   For commands above, User will change password
                                                   after first login.  Password may be set in ~/.cuu.txt
Access Key Commands
     lak    listaccesskeys           -a -u         List the users access keys
     rak    replaceaccesskeys        -a -u         Deletes all keys for user, Creates a single new key
     cak    createaccesskey          -a -u         Creates an access key for the user
     dak    deleteaccesskeys         -a -u         Deletes all the users access keys
Policy Commands
            createpolicy             -a -t         Create new policy (-t) with policydoc.json template
            deletepolicy             -a -t         Delete policy by name (-t)
     lp     listallpolicies          -a            Lists all defined policies
     lpl    listlocalpoliciesl       -a            Lists local (user managed) policies
     lpa    listawspolicies          -a            Lists aws policies
     upp    updatepolicy             -a -t -D      Update local policy name (-t) with policy doc (-D, use file://)
            attachpolicyset          -a -u         Attach policy ARNs listed in file policyset.txt to user (-u)
            removepolicyset          -a -u         Removes policy ARNs listed in policyset.txt to user (-u)
     gap    getallpolicies           -a <-t regex> Get all policy docs defined for this profile
     glp    getlocalpolicies         -a <-t regex> Get all local policy docs defined for this profile
                                                   Use regex for a specific policy
            listuserpolicies         -a -u
            detachuserpolicies       -a -u
            attachpolicytouser       -a -u -t      Specify the policy arn (-t)
Role Commands
     lr     listroles                -a            List all roles defined" 
Group Commands
     lg     listgroups               -a            List all groups defined" 
            listusergroups           -a -u         Lists groups associated with user
            listusersingroup         -a -u -t      Lists the users in  group (-t)
            addusertogroup           -a -u -t      Add user to a group (-t)
            removeuserfromgroup         -a -u -t      Remove user group (-t)
            removeuserfromallgroups  -a -u         Remove user from all groups
VPC and EC2 Commands
            ec2                      -a            List instances and securitygroups
            ec2-sg                   -a            Security groups detail listing
            ec2-sgsum                -a            Security groups summary listing (incl. empty SGs)
     vpc2   createvpc-2subnets       -a -r         Creates an internet accessible VPC with Pub\Priv Subnets
            deletevpc             -a -r -t <vpc>   Deletes a VPC (-t vpcid)
            createkeypair            -a -u         Creates a Key Pair
CloudTrail Commands
     ca     cloudtrail-active     -a -T         Lists active users in time window
     cu     cloudtrail-user       -a -T -u :UL: Lists user activity in time window
     cz     cloudtrail-allusers   -a -T         Runs cloudtrail-users for all users
     cw     cloudtrail-watch      -T            Runs cloudtrail-users for each profile in PROFILELIST
                                                   on the WATCHUSER in ~/.cuu.txt
                                                   -T specifies time window in hour
Specific Policy Commands
            iamuserchangepassword-add    -a -u :UL: Adds Policy
            iamuserchangepassword-remove -a -u :UL: Removes Policy
Other
            time                     -T            Print time window
            accountnumber            -a            Prints the account number for profile (-a)
            commands                               Lists all the cuu commands
Note: Abbreviations are applied to output fields to limit line length
            -d will limit abbreviations
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
cuu command list
  
ACCESSKEYCREATE
ACCESSKEYREPLACE                       ACCESSKEYSDELETE                          ACCESSKEYSLIST                    ACCOUNTNUMBER(alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
(alias)                                (alias)                                   (alias)                           (alias)
ATTACHPOLICYSET(alias)                 ATTACHPOLICYTOALLUSERS                    ATTACHPOLICYTOUSER                CHANGEPASSWORD(alias)
CLOUDTRAIL-ACTIVE                      CLOUDTRAILMENU                            CLOUDTRAIL-USER                   CLOUDTRAIL-WATCH
COMMANDLIST(alias)                     CREATEACCESSKEY(alias)                    CREATEKEYPAIR(alias)              CREATEREADMINUSER(alias)
CREATEREADONLYUSER(alias)              CREATEUSER(alias)                         CREATEUSERNOKEY(alias)            CREATEVPC-2SUBNETS(alias)
DELETEACCESSKEYS(alias)                DELETEUSER(alias)                         DELETEVPC(alias)                  DESCRIBEUSERS(alias)
DETACHUSERPOLICIES                     DU                                        EC2                               EC2-LIST
EC2-SG                                 EC2-SGSUM                                 EC2-SPARK                         EC2-UTIL
GAP                                    GETALLPOLICIES(alias)                     GETLOCALPOLICIES(alias)           GETPOLICY
GLP                                    GROUPADDUSER                              GROUPCREATE                       GROUPDELETE
GROUPREMOVEALLUSERS                    GROUPREMOVEUSER                           IAMUSERCHANGEPASSWORD-ADD(alias)  IAMUSERCHANGEPASSWORD-REMOVE(alias)
IAMUSERCODECOMMITPOWERUSER-ADD(alias)  IAMUSERCODECOMMITPOWERUSER-REMOVE(alias)  KEYPAIRCREATE                     LISTACCESSKEYS(alias)
LISTALLPOLICIES(alias)                 LISTAWSPOLICIES(alias)                    LISTGROUPS                        LISTLOCALPOLICIES(alias)
LISTROLES(alias)                       LISTUSERGROUPS                            LISTUSERPOLICIES                  LISTUSERS2(alias)
LISTUSERS(alias)                       LISTUSERSINGROUP                          LISTUSERS-JSON(alias)             NEWPOLICYDOC(alias)
PASSWORDCHANGE                         PASSWORDSCRAM                             POLICYBYARN-ADD                   POLICYBYARN-REMOVE
POLICYBYNAME-ADD                       POLICYBYNAME-REMOVE                       POLICYCODECOMMITPOWERUSER-ADD     POLICYCODECOMMITPOWERUSER-REMOVE
POLICYCREATE                           POLICYDELETE                              POLICYGETALL                      POLICYGETLOCAL
POLICYLISTALL                          POLICYLISTAWS                             POLICYLISTLOCAL                   POLICYSETATTACH
POLICYSETREMOVE                        POLICYUPDATE                              POLICYUSERCHANGEPASSWORD-ADD      POLICYUSERCHANGEPASSWORD-REMOVE
PUBLISH                                REMOVEPOLICYSET(alias)                    REPLACEACCESSKEYS(alias)          ROLESLIST
SCRAMPASSWORD(alias)                   TEST                                      TEST2                             TIME(alias)
UPDATEPOLICY(alias)                    USERCREATE                                USERCREATEADMIN                   USERCREATENOKEY
USERCREATEREADONLY                     USERDELETE                                USERDESCRIBE                      USERLIST
USERLIST-2                             USERLIST-JSON                             USERMENU                          UTILACCOUNTNUMBER
UTILCOMMANDLIST                        UTILNEWPOLICYDOC                          UTILSWAP                          UTILTIME
VPCCREATE                              VPCDELETE                                 WORLD                             WWEC2
  
  
accesskeycreate                      -a         Create access keys for user
accesskeyreplace                     -a         Delete and replace access keys
accesskeysdelete                     -a         Delete all access keys attached to user
accesskeyslist                       -a         List a users access keys
accountnumber(alias)                 -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
(alias)                              -a         
attachpolicyset(alias)               -a         
attachpolicytoallusers               -a -t      Attach policy to all users
attachpolicytouser                   -a -u      Attach policy to user
changepassword(alias)                -a         
cloudtrail-active                    -a         Cloudtrail watch all activity in the time window
cloudtrailmenu                       -a         Menu interface to pick and watch users via cloudtrail
cloudtrail-user                      -a         Tracks a user's activity via cloud trail
cloudtrail-watch                     -a         Cloudtrail watch a user across multiple profiles
commandlist(alias)                   -a         
commands(alias)                      -a         
createaccesskey(alias)               -a         
createkeypair(alias)                 -a         
createreadminuser(alias)             -a         
createreadonlyuser(alias)            -a         
createuser(alias)                    -a         
createusernokey(alias)               -a         
createvpc-2subnets(alias)            -a         
deleteaccesskeys(alias)              -a         
deleteuser(alias)                    -a         
deletevpc(alias)                     -a         
describeusers(alias)                 -a         
detachuserpolicies                   -a -u      Detach all policies from user
du                                   -a -u      Lists groups and policies associated with user/userlist
ec2                                  -a         Describe Instances
ec2-list                             -a         EC2 List
ec2-sg                               -a         Security Group Detail Report
ec2-sgsum                            -a         Security Group Summary Report
ec2-spark                            -a         CloudWatch CPU Utilization with Spark Graphing
ec2-util                             -a         CloudWatch CPU Utilization
gap                                  -a         Get all policy documents
getallpolicies(alias)                -a         
getlocalpolicies(alias)              -a         
getpolicy                            -a -t      Get policy
glp                                  -a         Get local policy documents
groupadduser                         -a -t      Add user/userlist to group
groupcreate                          -a -t      Create group in profile
groupdelete                          -a -u -t   Delete group from profile by group name
groupremoveallusers                  -a         Remove all groups atttach to user
groupremoveuser                      -a         Remove user from group by group name
iamuserchangepassword-add(alias)     -a         
iamuserchangepassword-remove(alias)  -a         
iamusercodecommitpoweruser-add(alias) -a         
iamusercodecommitpoweruser-remove(alias) -a         
keypaircreate                        -a -t      Create a set of keypairs
listaccesskeys(alias)                -a         
listallpolicies(alias)               -a         
listawspolicies(alias)               -a         
listgroups                           -a         List groups in profile
listlocalpolicies(alias)             -a         
listroles(alias)                     -a         
listusergroups                       -a         List groups attached to user
listuserpolicies                     -a -u      List policies atttached to user
listusers2(alias)                    -a         
listusers(alias)                     -a         
listusersingroup                     -a         List users in group
listusers-json(alias)                -a         
newpolicydoc(alias)                  -a         
passwordchange                       -a -u -p   Change a users password
passwordscram                        -a -u      Make a users password unkown (scram)
policybyarn-add                      -a -u -t   Attach policy to user by ARN
policybyarn-remove                   -a -u -t   Detach policy from user by ARN
policybyname-add                     -a -t      Attach local policy to user by policy name
policybyname-remove                  -a -t      Detach local policy from user by policy name
policycodecommitpoweruser-add        -a         Add arn:aws:iam::aws:policy/AWSCodeCommitPowerUser to user
policycodecommitpoweruser-remove     -a         Remove arn:aws:iam::aws:policy/AWSCodeCommitPowerUser from user
policycreate                         -a -t      Create policy bu name and upload policy document this.json
policydelete                         -a -t      Delete local policy ARN
policygetall                         -a         Get all policy documents
policygetlocal                       -a         Get local policy documents
policylistall                        -a         List all policies
policylistaws                        -a         List all AWS policies
policylistlocal                      -a         List local policies
policysetattach                      -a -u      Attach all policies specified in policyset.txt to user
policysetremove                      -a -u      Remove all policies specified in policyset.txt from user
policyupdate                         -a -t -D   Update policy
policyuserchangepassword-add         -a         Add arn:aws:iam::aws:policy/IAMUserChangePassword to user
policyuserchangepassword-remove      -a         Remove arn:aws:iam::aws:policy/IAMUserChangePassword from user
publish                              -a         Publish cuureport.txt
removepolicyset(alias)               -a         
replaceaccesskeys(alias)             -a         
roleslist                            -a         List Roles
scrampassword(alias)                 -a         
test2                                -a         Test Command Two
test                                 -a         Test Command
time(alias)                          -a         
updatepolicy(alias)                  -a         
usercreateadmin                      -a -u -p   Create admin user
usercreate                           -a -u -p   Create a user and assign access keys
usercreatenokey                      -a -u -p   Create a user with no access keys
usercreatereadonly                   -a -u -p   Create readonly user
userdelete                           -a -u      Delete user
userdescribe                         -a -u      Lists groups and policies associated with user/userlist
userlist-2                           -a         User listing (simple format)
userlist                             -a         User listing
userlist-json                        -a         User list in json format
usermenu                             -a         Menu driven user information
utilaccountnumber                    -a         Print account number
utilcommandlist                      -a         List Commands
utilcommands                         -a         Command help
utilnewpolicydoc                     -a         Create new this.json from policydoc.json template
utilswap                             -a         Swap a Policy for a Group
utiltime                             -a         Print time window
vpccreate                            -a -r      Create a Two Subnet VPC
vpcdelete                            -a -r -t   Delete VPC
world                                -a         CloudTrail report for 100 hour window for user across all regions
wwec2                                -a         Another form of describe instances
</pre>
<pre>
User Commands  
usercreateadmin                      -a -u -p   Create admin user
usercreate                           -a -u -p   Create a user and assign access keys
usercreatenokey                      -a -u -p   Create a user with no access keys
usercreatereadonly                   -a -u -p   Create readonly user
userdelete                           -a -u      Delete user
userdescribe                         -a -u      Lists groups and policies associated with user/userlist
userlist-2                           -a         User listing (simple format)
userlist                             -a         User listing
userlist-json                        -a         User list in json format
usermenu                             -a         Menu driven user information
  
Policy Commands  
policybyarn-add                      -a -u -t   Attach policy to user by ARN
policybyarn-remove                   -a -u -t   Detach policy from user by ARN
policybyname-add                     -a -t      Attach local policy to user by policy name
policybyname-remove                  -a -t      Detach local policy from user by policy name
policycodecommitpoweruser-add        -a         Add arn:aws:iam::aws:policy/AWSCodeCommitPowerUser to user
policycodecommitpoweruser-remove     -a         Remove arn:aws:iam::aws:policy/AWSCodeCommitPowerUser from user
policycreate                         -a -t      Create policy bu name and upload policy document this.json
policydelete                         -a -t      Delete local policy ARN
policygetall                         -a         Get all policy documents
policygetlocal                       -a         Get local policy documents
policylistall                        -a         List all policies
policylistaws                        -a         List all AWS policies
policylistlocal                      -a         List local policies
policysetattach                      -a -u      Attach all policies specified in policyset.txt to user
policysetremove                      -a -u      Remove all policies specified in policyset.txt from user
policyupdate                         -a -t -D   Update policy
policyuserchangepassword-add         -a         Add arn:aws:iam::aws:policy/IAMUserChangePassword to user
policyuserchangepassword-remove      -a         Remove arn:aws:iam::aws:policy/IAMUserChangePassword from user
  
</pre>
<pre>
  
Tue Jun 12 12:52:42 EDT 2018
</pre>
