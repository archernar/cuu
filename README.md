# CUU - An AWS CLI Wrapper
<pre>
Usage: cuu [-h][-a][-u][-p][-t][-s][-z][-c][-d][-F][-i][-c]
       -h  display usage
       -a  cli profile name      (from .aws/config)
       -u  operand:  username
       -p  operand:  password    (default set in .cuu.txt)
       -t  operand:  thing name  (used to specify a resource or object name)
       -s  operand:  start date  (default set in .cuu.txt)
       -d  limits abbreviations
       -F  force mode, do not confirm any command (e.g. deletes)
       -i  interactive mode ('q' to quit)
       -c  command:
                 createuser           -a -u -p    Creates with no privledges
                 createadminuser      -a -u -p    Creates a user with Administor Access
                 createreadonlyuser   -a -u -p    Creates a user with Read Only
                 changepassword       -a -u -p    Changes a users pwd, Will use PASSWORD in .cuu.txt
                                                  NOTE: for commands above, User will change password
                                                  after first login.  Password may be set in .cuu.txt
                 scrampassword        -a -u       Assign an unknown (scrammed) password
       ls        listusers            -a" 
                 listusergroups       -a -u
                 createaccesskey      -a -u       Creates an accesskey for the user (-u)
                 listaccesskeys       -a -u       Lists the users (-u) access keys)
                 deleteaccesskeys     -a -u       Deletes the users (-u) access keys)
                 deleteuser           -a -u
       lg        listgroups           -a" 
                 ec2                  -a          List instances and securitygroups
                 getpolicyarn         -a -t       Lists all defined policies filter with a regex in -t
                 listuserpolicies     -a -u
                 getpolicies          -a -t       Get the policy docs assocaiated with the regex in -t
                 detachuserpolicies   -a -u
                 attachpolicytouser   -a -u -t    Specify the policy arn with -t
                 addusertogroup       -a -u -t    Specify the group name with -t
       ca        cloudtrail-active    -a -s       Lists active users since start date (-s)
       cu        cloudtrail-user      -a -u -s    Lists user (-u) activity since start date (-s)
       cz        cloudtrail-allusers  -a -s       Runs cloudtrail-users for all users
       cw        cloudtrail-watch     -s          Runs cloudtrail-users for each acct in ACCOUNTLIST
                                                  on the WATCHUSER in .cuu.txt
Note: Abbreviations are applied to output fields to limit line length
       -d will limit abbreviations
.cuu.txt  can contain defaults for these setting
       STARTDATE=YYYY-MM-DD  PASSWORD=XYXYXYXYXYX  WATCHUSER=username  ACCOUNTLIST=A1 A2 A3
</pre>
