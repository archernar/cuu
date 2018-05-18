cuu
 
#!/usr/bin/ksh
Tmp="/tmp/$$
TmpDir="/tmp/dir$$
trap 'rm -f "$Tmp" >/dev/null 2>&1' 0
trap "exit 2" 1 2 3 13 15
rm $Tmp  >/dev/null 2>&1
# -----------------------------------------------------------------------------------------------------------
#   / ___| | | | | | |            / \   _ __      / \ \      / / ___|   / ___| |   |_ _| |_   _|__   ___ | |
#  | |   | | | | | | |  _____    / _ \ | '_ \    / _ \ \ /\ / /\___ \  | |   | |    | |    | |/ _ \ / _ \| |
#  | |___| |_| | |_| | |_____|  / ___ \| | | |  / ___ \ V  V /  ___) | | |___| |___ | |    | | (_) | (_) | |
#   \____|\___/ \___/          /_/   \_\_| |_| /_/   \_\_/\_/  |____/   \____|_____|___|   |_|\___/ \___/|_|
# -----------------------------------------------------------------------------------------------------------
#                                | |/ / ___|| | | | |  _ \ _   _| | ___  ___| | | |
#                                | ' /\___ \| |_| | | |_) | | | | |/ _ \/ __| | | |
#                                | . \ ___) |  _  | |  _ <| |_| | |  __/\__ \_|_|_|
#                                |_|\_\____/|_| |_| |_| \_\\__,_|_|\___||___(_|_|_)
# -----------------------------------------------------------------------------------------------------------
#                                 / ___| __ ___      _| | __ |  _ \ _   _| | ___  ___ 
#                                | |  _ / _` \ \ /\ / / |/ / | |_) | | | | |/ _ \/ __|
#                                | |_| | (_| |\ V  V /|   <  |  _ <| |_| | |  __/\__ \
#                                 \____|\__,_| \_/\_/ |_|\_\ |_| \_\\__,_|_|\___||___/
# -----------------------------------------------------------------------------------------------------------
usage(){
usage(){
     print ""
     
     print "Usage: cuu [-h][-a][-u][-p][-t][-s][-z][-c][-d][-F][-i][-c]"
     Usage: cuu [-h][-a][-u][-p][-t][-s][-z][-c][-d][-F][-i][-c]
     print "       -h  display usage"
            -h  display usage
     print "       -a  cli profile name      (from .aws/config)"
            -a  cli profile name      (from .aws/config)
     print "       -u  operand:  username"
            -u  operand:  username
     print "       -p  operand:  password    (default set in .cuu.txt)"
            -p  operand:  password    (default set in .cuu.txt)
     print "       -t  operand:  thing name  (used to specify a resource or object name)"
            -t  operand:  thing name  (used to specify a resource or object name)
     print "       -s  operand:  start date  (default set in .cuu.txt)"
            -s  operand:  start date  (default set in .cuu.txt)
     print "       -d  show detail/do not apply abbreviations fields"
            -d  show detail/do not apply abbreviations fields
     print "       -F  force mode, do not confirm any command (e.g. deletes)"
            -F  force mode, do not confirm any command (e.g. deletes)
     print "       -i  interactive mode ('q' to quit)"
            -i  interactive mode ('q' to quit)
     print "       -c  command:"
            -c  command:
     print "                     createuser           -a -u -p                  Creates with no privledges"
                          createuser           -a -u -p                  Creates with no privledges
     print "                     createadminuser      -a -u -p                  Creates a user with Administor Access"
                          createadminuser      -a -u -p                  Creates a user with Administor Access
     print "                     createreadonlyuser   -a -u -p                  Creates a user with Read Only"
                          createreadonlyuser   -a -u -p                  Creates a user with Read Only
     print "                     changepassword       -a -u -p                  Changes a users password, Will use PASSWORD var in .cuu.txt"
                          changepassword       -a -u -p                  Changes a users password, Will use PASSWORD var in .cuu.txt
     print "                                                                    NOTE: for commands above, User will need to change password"
                                                                         NOTE: for commands above, User will need to change password
     print "                                                                          after first login.  Password may be set in .cuu.txt"
                                                                               after first login.  Password may be set in .cuu.txt
     print "                     scrampassword        -a -u                     Assign an unknown (scrammed) password"
                          scrampassword        -a -u                     Assign an unknown (scrammed) password
     print "           ls        listusers            -a" 
                ls        listusers            -a" 
     print "                     listusergroups       -a -u"
                          listusergroups       -a -u
     print "                     createaccesskey      -a -u                     Creates an accesskey for the user (-u)"
                          createaccesskey      -a -u                     Creates an accesskey for the user (-u)
     print "                     listaccesskeys       -a -u                     Lists the users (-u) access keys)"
                          listaccesskeys       -a -u                     Lists the users (-u) access keys)
     print "                     deleteaccesskeys     -a -u                     Deletes the users (-u) access keys)"
                          deleteaccesskeys     -a -u                     Deletes the users (-u) access keys)
     print "                     deleteuser           -a -u"
                          deleteuser           -a -u
     print "           lg        listgroups           -a" 
                lg        listgroups           -a" 
     print "                     ec2                  -a                        List instances and securitygroups"
                          ec2                  -a                        List instances and securitygroups
     print "                     getpolicyarn         -a -t                     Lists all defined policies filter with a regex in -t"
                          getpolicyarn         -a -t                     Lists all defined policies filter with a regex in -t
     print "                     listuserpolicies     -a -u"
                          listuserpolicies     -a -u
     print "                     getpolicies          -a -t                     Get the policy documents assciates with the regex in -t"
                          getpolicies          -a -t                     Get the policy documents assciates with the regex in -t
     print "                     detachuserpolicies   -a -u"
                          detachuserpolicies   -a -u
     print "                     attachpolicytouser   -a -u -t                  Specify the policy arn with -t"
                          attachpolicytouser   -a -u -t                  Specify the policy arn with -t
     print "                     addusertogroup       -a -u -t                  Specify the group name with -t"
                          addusertogroup       -a -u -t                  Specify the group name with -t
     print "           ca        cloudtrail-active    -a -s                     Lists active users since start date (-s)"
                ca        cloudtrail-active    -a -s                     Lists active users since start date (-s)
     print "           cu        cloudtrail-user      -a -u -s                  Lists user (-u) activity since start date (-s) "
                cu        cloudtrail-user      -a -u -s                  Lists user (-u) activity since start date (-s) 
     print "           cz        cloudtrail-allusers  -a -s                     Runs cloudtrail-users for all users"
                cz        cloudtrail-allusers  -a -s                     Runs cloudtrail-users for all users
     print "           cw        cloudtrail-watch     -s                        Runs cloudtrail-users for each account in ACCOUNTLIST on the in WATCHUSER in .cuu.txt"
                cw        cloudtrail-watch     -s                        Runs cloudtrail-users for each account in ACCOUNTLIST on the in WATCHUSER in .cuu.txt
     print ""
     
     print "Note: Abbreviations are applied to many fields in the output of cuu. This is done to limit line length where possible"
     Note: Abbreviations are applied to many fields in the output of cuu. This is done to limit line length where possible
     print "      -d will turn off all abbreviations"
           -d will turn off all abbreviations
     print ".cuu.txt    can contain defaults for these settings"
     .cuu.txt    can contain defaults for these settings
     print "            STARTDATE=YYYY-MM-DD    PASSWORD=XYXYXYXYXYX    WATCHUSER=username    ACCOUNTLIST=A1 A2 A3"
                 STARTDATE=YYYY-MM-DD    PASSWORD=XYXYXYXYXYX    WATCHUSER=username    ACCOUNTLIST=A1 A2 A3
     print ""
     
}
}
assert() {
    if [ "$1" == "" ] ; then
         print $2
         exit 1
    fi
}
confirm() {
     if [ "$FORCE" != "yes" ] ; then
          print -n "   Enter '10111' to confirm >> 
          read STRIN
          if [ "$STRIN" != "10111" ] ; then
        Exiting - No Match
               exit 1
          fi
     fi
}
typeset -u COMMAND
COMMAND="
USERNAME="
ACCOUNT="
CREATEUSER="
THING="
COUNT="
ACCTNUMBER="
IN="
OUT="
FORCE="
LOOP="no
REGION="us-east-1
RAN=`tr -cd \#_[:alnum:] < /dev/urandom |  fold -w 18 | head -1 |gawk '{print $0 "!!"}'`
PASSWORD=`gawk -v w=PASSWORD -F= '{b="";gsub(re,b,$1);gsub(re,b,$2);if ($1==w) {print $2;exit;}}' .cuu.txt`
STARTDATE=`gawk -v w=STARTDATE -F= '{b="";gsub(re,b,$1);gsub(re,b,$2);if ($1==w) {print $2;exit;}}' .cuu.txt`
WATCHUSER=`gawk -v w=WATCHUSER -F= '{b="";gsub(re,b,$1);gsub(re,b,$2);if ($1==w) {print $2;exit;}}' .cuu.txt`
WATCHACCOUNT=`gawk -v w=WATCHACCOUNT -F= '{b="";gsub(re,b,$1);gsub(re,b,$2);if ($1==w) {print $2;exit;}}' .cuu.txt`
ACCOUNTLIST=`gawk -v w=ACCOUNTLIST -F= '{b="";gsub(re,b,$1);gsub(re,b,$2);if ($1==w) {print $2;exit;}}' .cuu.txt`


while getopts "r:Ff:ds:n:c:u:a:p:t:ihb" arg
do
	case $arg in
            r)
               REGION=$OPTARG  
               ;;
            F)
               FORCE="yes
               ;;
            f)
               FILE=$OPTARG
               ;;
            i)
               LOOP="yes
               ;;
            d)
               DETAIL="yes
               ;;
            s)
               STARTDATE=$OPTARG
               ;;
            n)
               COUNT=$OPTARG
               ;;
            c)
               COMMAND=$OPTARG
               ;;
            u)
               USERNAME=$OPTARG  
               ;;
            a)
               ACCOUNT=$OPTARG
               ;;
            p)
               PASSWORD=$OPTARG
               ;;
            t)
               THING=$OPTARG
               ;;
	    h)
               usage
	       exit 0
               ;;
	    *)
	       exit 0
	       ;;
	esac
done
shift $(($OPTIND - 1))

while [[ 0 -eq 0 ]];do

	case "$COMMAND" in
            CA)                    COMMAND="CLOUDTRAIL-ACTIVE" ;;
            CU)                    COMMAND="CLOUDTRAIL-USER" ;;
            CW)                    COMMAND="CLOUDTRAIL-WATCH" ;;
            CZ)                    COMMAND="CLOUDTRAIL-ALLUSERS" ;;
            LU)                    COMMAND="LISTUSERS" ;;
            LG)                    COMMAND="LISTGROUPS" ;;
            LR)                    COMMAND="LISTROLES" ;;
            LA)                    COMMAND="LISTACCESSKEYS" ;;
	esac
# -----------------------------------------------------------------------------------------------------------------------
# Notes
# https://aws.amazon.com/blogs/security/a-simple-way-to-export-your-iam-settings/
# aws --profile ECD3 iam get-account-authorization-details 
#   aws --profile ECD3 iam list-policies
#   aws --profile ECD3 iam list-policies |  grep SAND
#   aws --profile ECD3 iam list-policies --scope Local
#   sz = "aws --profile " A " iam delete-access-key --user-name " U " --access-key-id  " $2
#   sz = "aws --profile " A " iam list-policy-versions --policy-arn " $2
#   aws --profile $ACCOUNT -output json iam create-policy-version --policy-arn $T --policy-document file://$FILE --set-as-default
#   aws --profile $ACCOUNT iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess         --user-name $USERNAME
#   aws --profile $ACCOUNT iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/CloudWatchFullAccess   --user-name $USERNAME
#   aws --profile $ACCOUNT iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitPowerUser --user-name $USERNAME
#
# -----------------------------------------------------------------------------------------------------------------------

if [ "$COMMAND" == "TEST" ] ; then
     " 
fi
if [ "$COMMAND" == "GETPOLICIES" ] ; then
               assert "$ACCOUNT"  "Account not specified
               assert "$THING"  "Account not specified
               aws --profile $ACCOUNT iam list-policies --scope Local | egrep $THING | gawk -v A=$ACCOUNT '
               {
                   printf("%-4s %s\n",$5,$2);
                   sz = "aws --profile " A " --output json iam get-policy-version --policy-arn " $2 " --version-id " $5 " > policies/" A "-" $5 "-" $9 
                   system(sz)
               }'

fi
# ----------------------------------------------------
# Fundamental User Commands
#       Create User, Change Password, Delete User
# ----------------------------------------------------
if [ "$COMMAND" == "CREATEADMINUSER" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT"  "Account not specified
               assert "$PASSWORD" "Password not specified
               aws --profile $ACCOUNT iam create-user --user-name $USERNAME
               aws --profile $ACCOUNT iam create-login-profile --user-name $USERNAME --password $PASSWORD  --password-reset-required
               aws --profile $ACCOUNT iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess    --user-name $USERNAME
               print $USERNAME
               print $PASSWORD
fi
if [ "$COMMAND" == "CREATEREADONLYUSER" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT"  "Account not specified
               assert "$PASSWORD" "Password not specified
               aws --profile $ACCOUNT iam create-user --user-name $USERNAME
               aws --profile $ACCOUNT iam create-login-profile --user-name $USERNAME --password $PASSWORD  --password-reset-required
               aws --profile $ACCOUNT iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess         --user-name $USERNAME
fi
if [ "$COMMAND" == "CREATEUSER" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT"  "Account not specified
               assert "$PASSWORD" "Password not specified
               aws --profile $ACCOUNT iam create-user --user-name $USERNAME
               aws --profile $ACCOUNT iam create-login-profile --user-name $USERNAME --password $PASSWORD  --password-reset-required
fi
if [ "$COMMAND" == "CHANGEPASSWORD" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT"  "Account not specified
               assert "$PASSWORD" "Password not specified
               confirm
               aws --profile $ACCOUNT iam update-login-profile --user-name $USERNAME --password $PASSWORD  --password-reset-required
fi
if [ "$COMMAND" == "SCRAMPASSWORD" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT"  "Account not specified
               RAN=`tr -cd \#_[:alnum:] < /dev/urandom |  fold -w 18 | head -1 |gawk '{print $0 "!!"}'`
               assert "$PASSWORD" "Password not specified
               confirm
               aws --profile $ACCOUNT iam update-login-profile --user-name $USERNAME --password $RAN
fi
if [ "$COMMAND" == "DELETEUSER" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               confirm
               aws --profile $ACCOUNT iam list-access-keys --user-name $USERNAME | gawk -v A=$ACCOUNT -v U=$USERNAME '
               {
                   sz = "aws --profile " A " iam delete-access-key --user-name " U " --access-key-id  " $2
                   system(sz)
               }'
               aws --profile $ACCOUNT iam list-attached-user-policies --user-name $USERNAME | gawk -v A=$ACCOUNT -v U=$USERNAME '
               {
                   sz = "aws --profile " A " iam detach-user-policy --user-name " U " --policy-arn " $2
                   system(sz)
               }'
               aws --profile $ACCOUNT iam delete-login-profile --user-name $USERNAME 
               aws --profile $ACCOUNT iam delete-user --user-name $USERNAME 
fi
if [ "$COMMAND" == "ACCOUNTNUMBER" ] ; then
               assert "$ACCOUNT" "Account not specified
               ACCTNUMBER=`aws --profile $ACCOUNT sts get-caller-identity | gawk '{print $1}'`
               print $ACCTNUMBER
fi
# ----------------------------------------------------
# These commands operate on accounts
# ----------------------------------------------------
if [ "$COMMAND" == "LISTROLES" ] ; then
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT --no-paginate iam list-roles 
               # | gawk '/^ROLES/ {printf("%s\n",$2);}' | sort
fi
if [ "$COMMAND" == "LISTUSERS" ] ; then
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT iam list-users | gawk '{if (NF==6) printf("%-40s %-24s %s\n",$NF,"",$2); else printf("%-40s %-24s %s\n",$NF,$4, $2)}' | sort
fi
if [ "$COMMAND" == "LISTGROUPS" ] ; then
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT iam list-groups | gawk '{printf("%-44s %s\n",$5,$2)}' | sort
fi
if [ "$COMMAND" == "GETPOLICYARN" ] ; then
               assert "$ACCOUNT" "Account not specified
               assert "$THING" "Thing not specified
               aws --profile $ACCOUNT iam list-policies | gawk '{print $2}' | egrep -i $THING
fi
# ----------------------------------------------------
# These commands operate on users
# ----------------------------------------------------
if [ "$COMMAND" == "LISTUSERPOLICIES" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT iam list-attached-user-policies --user-name $USERNAME | gawk '{print $0}'
fi
if [ "$COMMAND" == "LISTUSERGROUPS" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT iam list-groups-for-user --user-name $USERNAME | gawk '{print $5}'
fi
if [ "$COMMAND" == "DETACHUSERGROUPS" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               confirm
               aws --profile $ACCOUNT iam list-groups-for-user --user-name $USERNAME | gawk -v A=$ACCOUNT -v U=$USERNAME '
               {
                   sz = "aws --profile " A " remove-user-from-group --user-name " U " --group-name " $5
                   system(sz)
               }'
fi
if [ "$COMMAND" == "DETACHUSERPOLICIES" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               confirm
               aws --profile $ACCOUNT iam list-attached-user-policies --user-name $USERNAME | gawk -v A=$ACCOUNT -v U=$USERNAME '
               {
                   sz = "aws --profile " A " iam detach-user-policy --user-name " U " --policy-arn " $2
                   system(sz)
               }'
fi
if [ "$COMMAND" == "ATTACHPOLICYTOUSER" ] ; then
               assert "$ACCOUNT" "Account not specified
               assert "$THING" "Thing not specified
               ACCTNUMBER=`aws --profile $ACCOUNT sts get-caller-identity | gawk '{print $1}'`
               aws --profile $ACCOUNT iam attach-user-policy --policy-arn $THING  --user-name $USERNAME
fi
if [ "$COMMAND" == "ADDUSERTOGROUP" ] ; then
               assert "$ACCOUNT" "Account not specified
               assert "$THING" "Thing not specified
               aws --profile $ACCOUNT iam add-user-to-group --group-name $THING  --user-name $USERNAME
fi

if [ "$COMMAND" == "CLOUDTRAIL-ACTIVE" ] ; then
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT --output text cloudtrail lookup-events --start-time $STARTDATE | gawk '
               /^EVENTS/ {
                    print $NF 
               }' | sort | uniq
fi

if [ "$COMMAND" == "CREATEACCESSKEY" ] ; then
               assert "$ACCOUNT" "Account not specified
               assert "$USERNAME" "Account not specified
               aws --profile $ACCOUNT --output text iam create-access-key --user-name $USERNAME | gawk '
               @include "cuu.awk" 
               { 
                   print configrecord($0); 
               }'
fi
if [ "$COMMAND" == "LISTACCESSKEYS" ] ; then
               assert "$ACCOUNT" "Account not specified
               assert "$USERNAME" "Account not specified
               aws --profile $ACCOUNT --output text iam list-access-keys --user-name $USERNAME
fi
if [ "$COMMAND" == "DELETEACCESSKEYS" ] ; then
               assert "$USERNAME" "Username not specified
               assert "$ACCOUNT" "Account not specified
               confirm
               aws --profile $ACCOUNT iam list-access-keys --user-name $USERNAME | gawk -v A=$ACCOUNT -v U=$USERNAME '
               {
                   sz = "aws --profile " A " iam delete-access-key --user-name " U " --access-key-id  " $2
                   system(sz)
               }'
fi

if [ "$COMMAND" == "EC2" ] ; then
               assert "$ACCOUNT" "Account not specified
     \n\n\n"}/INSTANCES/{print $0}/SECURITYGROUPS/{print $0 "\n\n\n"}'
fi


# aws --profile  ce get-cost-and-usage --granularity MONTHLY --metrics BlendedCost --time-period Start=2018-04-01,End=2018-04-30  

if [ "$COMMAND" == "CLOUDTRAIL-ALLUSERS" ] ; then
               assert "$ACCOUNT" "Account not specified
               aws --profile $ACCOUNT iam list-users | gawk -v A=$ACCOUNT '{
                    sz = "cuu -a " A " -c cu -u " $NF
                    system(sz)
               }' 
fi

if [ "$COMMAND" == "CLOUDTRAIL-WATCH" ] ; then
               assert "ACCOUNTLIST" "Account List not specified
               if [ "$USERNAME" == "" ] ; then
                    assert "$WATCHUSER"    "User not specified
                    for sz in $ACCOUNTLIST; do
                         cuu -a $sz -c CU -u $WATCHUSER
                    done
               else
                    assert "$USERNAME"    "User not specified
                    for sz in $ACCOUNTLIST; do
                         cuu -a $sz -c CU -u $USERNAME 
                    done
               fi
fi
if [ "$COMMAND" == "CLOUDTRAIL-USER" ] ; then
               assert "$ACCOUNT"  "Account not specified
               assert "$USERNAME" "Username not specified
               if [ "$USERNAME" == "ALL" ] ; then
                 aws --profile $ACCOUNT --region $REGION --output text cloudtrail lookup-events --no-paginate --start-time $STARTDATE  > $Tmp
               else
                 aws --profile $ACCOUNT --region $REGION --output text cloudtrail lookup-events --no-paginate --start-time $STARTDATE --lookup-attributes AttributeKey=Username,AttributeValue=$USERNAME > $Tmp
               fi
               cat $Tmp | gawk  -v ACCT=$ACCOUNT -v DETAIL=$DETAIL '
               @include "cuu.awk
               /^EVENTS/ {
                    sz=$0;
                    time=jget($0, "^.*[\"]eventTime[\"]:","NA");
                    ip=  jget($0, "^.*[\"]sourceIPAddress[\"]:","NA");
                    ty=  jget($0, "^.*[\"]eventType[\"]:","NA");
                    en=  jget($0, "^.*[\"]eventName[\"]:","NA");
                    req= jget($0, "^.*[\"]requestParameters[\"]:","NA");
                    resp= jget($0, "^.*[\"]responseElements[\"]:","NA");

                    name=$NF;
                    sub(/HIDDEN_DUE_TO_SECURITY_REASONS/,"HIDDEN",name);
                    if (match(DETAIL,/^yes/) == 0) {
                         if (length(name) > 10) name =substr(name,1,10);
                         sub(/^Aws/, "", ty);
                         sub(/^Console/, "Con", ty);
                         gsub(/["]/, "", resp);
                         gsub(/Validation/, "Valid", resp);
                         gsub(/Region/, "Reg", resp);
                         gsub(/Required/, "Req", resp);
                         gsub(/Bucket/, "Bk", resp);
                         gsub(/Service/, "Sv", resp);
                         gsub(/[ ]/, "", resp);
                         gsub(/createDate/, "cD", resp);
                         gsub(/userName/, "uN", resp);
                         gsub(/userName/, "uN", req);
                         gsub(/userId/, "uID", resp);
                         gsub(/AIDA................/, "AIDA..", resp);
                         gsub(/Jan/,"01",resp); gsub(/Feb/,"02",resp); gsub(/Mar/,"03",resp); gsub(/Apr/,"04",resp); gsub(/May/,"05",resp); gsub(/Jun/,"06",resp);
                         gsub(/Jul/,"07",resp); gsub(/Aug/,"08",resp); gsub(/Sep/,"09",resp); gsub(/Oct/,"10",resp); gsub(/Nov/,"11",resp); gsub(/Dec/,"12",resp);
                         gsub(/,2018/,"2018",resp);
                         gsub(/GroupName/,"GName",req);
                         gsub(/StreamName/,"SName",req);
                         gsub(/GroupName/,"GName",resp);
                         gsub(/StreamName/,"SName",resp);
                         gsub(/Permission/,"Perm",resp);
                         gsub(/Protocol/,"Prtcl",resp);
                         gsub(/Permission/,"Perm",req);
                         gsub(/Protocol/,"Prtcl",req);
                         gsub(/Port/,"P",req);
                         gsub(/request/,"req",req);
                         gsub(/request/,"req",resp);

                         gsub(/[Ss]ecurity/,"Sec",resp);
                         gsub(/[Ss]ecurity/,"Sec",req);
                         gsub(/functionName/,"fName",resp);
                         gsub(/functionName/,"fName",req);

                         gsub(/instance/,"inst",req);
                         gsub(/instance/,"inst",resp);
                         gsub(/group/,"grp",req);
                         gsub(/group/,"grp",resp);
                         gsub(/Profile/,"Prf",req);
                         gsub(/Profile/,"Prf",resp);
                         gsub(/[Nn]etwork/,"net",req);
                         gsub(/[Nn]etwork/,"net",resp);
                         gsub(/[Ii]nterface/,"inter",req);
                         gsub(/[Ii]nterface/,"inter",resp);

                         gsub(/Configuration/,"Config",en);
                         gsub(/Config/,"Cfg",en);
                         gsub(/Permission/,"Perm",en);
                         gsub(/Function/,"Func",en);
                         gsub(/Resource/,"Res",en);
                         gsub(/Update/,"Upd",en);
                         gsub(/Create/,"Cr",en);
                         if (length(ty) > 10) ty =substr(ty,1,10);
                    }
                    if (length(req) > 256) req=substr(req,1,256) "(TRUNCATED)";
                    if (length(resp) > 256) resp=substr(resp,1,256) "(TRUNCATED)";
     -
     acct","time","name","eventtype","eventname","req","resp
                    print trim(ACCT), time, name, ty , en, "IN-" req
                    print trim(ACCT), time, name, ty , en, "OU-" resp
               }' |  column -t
fi

if [ "$LOOP" == "yes" ] ; then
     if [ "$COMMAND" == "EXIT" ] ; then
                    exit 0
     fi
     if [ "$COMMAND" == "QUIT" ] ; then
                    exit 0
     fi
     if [ "$COMMAND" == "Q" ] ; then
                    exit 0
     fi
     if [ "$COMMAND" == "h" ] ; then
                    usage
     fi
     if [ "$COMMAND" == "H" ] ; then
                    usage
     fi
else
     exit 0
fi

print -n "cuu "$ACCOUNT" "$USERNAME" "$THING">> 
read COMMAND
     set -A array $COMMAND
     if [ "${array[0]}" == "ACCOUNT" ] ; then
          ACCOUNT="${array[1]}
     fi
     if [ "${array[0]}" == "USERNAME" ] ; then
         USERNAME="${array[1]}
     fi
     if [ "${array[0]}" == "THING" ] ; then
         THING="${array[1]}
     fi
done

exit 1
