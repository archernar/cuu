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
cuu commands
  
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
  
Tue Jun 12 12:54:02 EDT 2018
</pre>
