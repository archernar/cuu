# CUU - An AWS CLI Wrapper
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-s][-d][-D][-j][-F][-B][-E][-R][-Z][-i][-c]
      -h  display usage
      -a  cli profile name      (from .aws/config)
      -u  operand:  username
      -p  operand:  password    (default set in ~/.cuu.txt)
      -t  operand:  thing name  (used to specify a resource or object name)
      -s  operand:  start date  (default set in ~/.cuu.txt)
      -d  limits abbreviations
      -D  Specify a document\file to upload (e.g. a policy document)
      -j  use long datetime fields
      -F  force mode, do not confirm any command (e.g. deletes)
      -B  show full user names
      -E  show event names
      -R  show raw records in output
      -Z  user iso time
      -i  interactive mode ('q' to quit)
      -c  command:
          Optional :ULIST: may specify a user, a list of users, or the special keyword ALLUSERS
          Optional :PLIST: may specify a profile, a list of profiles, or the special keyword ALLPROFILES
          ----------------------------------------------------------------------------------------------
User Commands
     lu     listusers                -a :PLIST:    Lists users" 
            deleteuser               -a -u
     du     describeusers            -a :PLIST:    Lists users and their attached groups and policies" 
            createuser               -a -u -p      Creates with no privledges
            createadminuser          -a -u -p      Creates a user with Administor Access
            createreadonlyuser       -a -u -p      Creates a user with Read Only
     scram  scrampassword            -a -u         Assign an unknown (scrammed) password
            changepassword           -a -u -p      Changes a users pwd, Will use PASSWORD in ~/.cuu.txt
                                                   NOTE: for commands above, User will change password
                                                   after first login.  Password may be set in ~/.cuu.txt
            listaccesskeys           -a -u         Lists the users (-u) access keys)
            createaccesskey          -a -u         Creates an accesskey for the user (-u)
            deleteaccesskeys         -a -u         Deletes the users (-u) access keys)
Policy Commands
     lp     listallpolicies          -a            Lists all defined policies
     lpl    listlocalpoliciesl       -a            Lists local (user managed) policies
     lpa    listawspolicies          -a            Lists aws policies
     gap    getallpolicies           -a <-t arn>   Get all policy docs defined for this profile
     glp    getlocalpolicies         -a <-t arn>   Get all local policy docs defined for this profile
                                                   Use -t arn for a specific policy
            listuserpolicies         -a -u
            detachuserpolicies       -a -u
            attachpolicytouser       -a -u -t      Specify the policy arn with -t
Group Commands
     lg     listgroups               -a            List all groups defined" 
            addusertogroup           -a -u -t      Specify the group name with -t
            listusergroups           -a -u         Lists groups associated with user
            removeuserfromallgroups  -a -u         Remove the user from attach attached groups
EC2 Commands
            ec2                      -a            List instances and securitygroups
            ec2-sg                   -a            Security groups detail listing
            ec2-sgsum                -a            Security groups summary listing (incl. empty SGs)
CloudTrail Commands
     ca     cloudtrail-active        -a -s         Lists active users since start date (-s)
     cu     cloudtrail-user          -a -u -s      Lists user (-u) activity since start date (-s)
     cz     cloudtrail-allusers      -a -s         Runs cloudtrail-users for all users
     cw     cloudtrail-watch         -s            Runs cloudtrail-users for each profile in PROFILELIST
                                                    on the WATCHUSER in ~/.cuu.txt
Specific Policy Commands
            iamuserchangepassword-add    -a -u :ULIST: Adds Policy
            iamuserchangepassword-remove -a -u :ULIST: Removes Policy
Note: Abbreviations are applied to output fields to limit line length
            -d will limit abbreviations
</pre>
<pre>
~/.cuu.txt  can contain defaults for these settings
PASSWORD=
STARTDATE=2018-05-01T00:00:00Z
WATCHPROFILE=
WATCHUSER=
PROFILELIST=
POLICYLIST=
GROUPREMOVE=
POLICYADD=
</pre>
<pre>
  
Mon May 28 00:34:22 EDT 2018
</pre>
