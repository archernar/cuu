# CUU - An AWS CLI Wrapper
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-s][-d][-j][-F][-B][-E][-R][-Z][-i][-c]
       -h  display usage
       -a  cli profile name      (from .aws/config)
       -u  operand:  username
       -p  operand:  password    (default set in ~/.cuu.txt)
       -t  operand:  thing name  (used to specify a resource or object name)
       -s  operand:  start date  (default set in ~/.cuu.txt)
       -d  limits abbreviations
       -j  use long datetime fields
       -F  force mode, do not confirm any command (e.g. deletes)
       -B  show full user names
       -E  show event names
       -R  show raw records in output
       -Z  user iso time
       -i  interactive mode ('q' to quit)
       -c  command:
                 createuser               -a -u -p         Creates with no privledges
                 createadminuser          -a -u -p         Creates a user with Administor Access
                 createreadonlyuser       -a -u -p         Creates a user with Read Only
                 changepassword           -a -u -p         Changes a users pwd, Will use PASSWORD in ~/.cuu.txt
                                                           NOTE: for commands above, User will change password
                                                           after first login.  Password may be set in ~/.cuu.txt
                 scrampassword            -a -u            Assign an unknown (scrammed) password
       lu        listusers                -a <LIST>        Lists users" 
       du        describeusers            -a <LIST>        Lists users and their attached groups and policies" 
                 listusergroups           -a -u
                 removeuserfromallgroups  -a -u            Remove the user from attach attached groups
                 createaccesskey          -a -u            Creates an accesskey for the user (-u)
                 listaccesskeys           -a -u            Lists the users (-u) access keys)
                 deleteaccesskeys         -a -u            Deletes the users (-u) access keys)
                 deleteuser               -a -u
       lg        listgroups               -a" 
       lp        listpolicies             -a               Lists all defined policies
       lpl       listpolicies-local       -a               Lists local (user managed) policies
       lpa       listpolicies-aws         -a               Lists aws policies
                 getpolicyarn             -a -t            Lists all defined policies filter with a regex in -t
                 listuserpolicies         -a -u
                 getpolicies              -a -t            Get the policy docs assocaiated with the regex in -t
                 detachuserpolicies       -a -u
                 attachpolicytouser       -a -u -t         Specify the policy arn with -t
                 addusertogroup           -a -u -t         Specify the group name with -t
                 ec2                      -a               List instances and securitygroups
                 ec2-sg                   -a               Security groups detail listing
                 ec2-sgsum                -a               Security groups summary listing (incl. empty SGs)
       ca        cloudtrail-active        -a -s            Lists active users since start date (-s)
       cu        cloudtrail-user          -a -u -s         Lists user (-u) activity since start date (-s)
       cz        cloudtrail-allusers      -a -s            Runs cloudtrail-users for all users
       cw        cloudtrail-watch         -s               Runs cloudtrail-users for each profile in PROFILELIST
                                                           on the WATCHUSER in ~/.cuu.txt
Specific Policy Commands
                 iamuserchangepassword-add    -a -u <LIST> Adds Policy
                 iamuserchangepassword-remove -a -u <LIST> Adds Policy
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
</pre>
<pre>
  
Sat May 26 10:00:51 EDT 2018
</pre>
