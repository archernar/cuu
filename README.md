# CUU - An AWS CLI Wrapper
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-d][-D][-j][-F][-B][-E][-R][-Z][-i][-c]
      -a  operand:  cli profile name      (from .aws/config)
      -u  operand:  username
      -p  operand:  password    (default may be set in ~/.cuu.txt)
      -t  operand:  thing name  (specify a resource or object name)
      -T  operand:  time window in minutes (to specify now-T to now)
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
          Optional :ULIST: may specify a user, a list of users, or the special keyword ALLUSERS
          Optional :PLIST: may specify a profile, a list of profiles, or the special keyword ALLPROFILES
          ----------------------------------------------------------------------------------------------
User Commands
     lu     listusers                -a :PLIST:    List users" 
            deleteuser               -a -u         Delete the user
     du     describeusers            -a :PLIST:    List users and their attached groups and policies" 
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
     gap    getallpolicies           -a <-t arn>   Get all policy docs defined for this profile
     glp    getlocalpolicies         -a <-t arn>   Get all local policy docs defined for this profile
                                                   Use -t arn for a specific policy
            listuserpolicies         -a -u
            detachuserpolicies       -a -u
            attachpolicytouser       -a -u -t      Specify the policy arn (-t)
Group Commands
     lg     listgroups               -a            List all groups defined" 
            listusergroups           -a -u         Lists groups associated with user
            addusertogroup           -a -u -t      Add user to a group (-t)
            removeuserfromallgroups  -a -u         Remove the user from attach attached groups
EC2 Commands
            ec2                      -a            List instances and securitygroups
            ec2-sg                   -a            Security groups detail listing
            ec2-sgsum                -a            Security groups summary listing (incl. empty SGs)
CloudTrail Commands
     ca     cloudtrail-active        -a -T         Lists active users in time window
     cu     cloudtrail-user          -a -u -T      Lists user activity in time window
     cz     cloudtrail-allusers      -a -T         Runs cloudtrail-users for all users
     cw     cloudtrail-watch         -T            Runs cloudtrail-users for each profile in PROFILELIST
                                                   on the WATCHUSER in ~/.cuu.txt
Specific Policy Commands
            iamuserchangepassword-add    -a -u :ULIST: Adds Policy
            iamuserchangepassword-remove -a -u :ULIST: Removes Policy
Other
            time                     -T            Print time window
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
</pre>
<pre>
  
Wed May 30 07:25:21 EDT 2018
</pre>
