function ltrim(s) { sub(/^ */, "", s); return s }
function rtrim(s) { sub(/ *$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }
function cutpad(s,n,             i,l) { 
    l=length(s);
    if (l > n) s=substr(s,1,n);
    if (l<n) {
        for (i=0;i<(n-l);i++) s = s " ";
    }
    return s;
}

# // https://stackoverflow.com/questions/18851914/how-to-pass-a-regular-expression-to-a-function-in-awk?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

function indent(sz) {
    print "     " sz $0
}

function jget(szIn, re, def,          sz,szOut,a) {
     szOut = def;
     if (match(szIn,re) != 0) {
          sz=szIn;
          sub(re,"",sz);
          if (match(sz, /^[{]/) == 1) {
               sub(/[}].*$/,"}",sz);
          }
          else {
               split(sz,a,",");
               sz = a[1];
          }
          sub(/["]/, "", sz); 
          sub(/["]/, "", sz); 
          szOut = sz;
     }
     else {
          szOut = "NOT FOUND!";
     }
     return szOut;
}


function configrecord(szIn,szProfile,szUser,szProfileName,               sz,a,n,newline) {
     n = split(szIn,a," ");
     newline="\n"
     sz = sz newline
     sz = sz szIn newline
     sz = sz newline
     sz = sz "[profile " szProfileName "]" newline
     sz = sz "iamuser = " szUser newline
     sz = sz "iamprof = " szProfile newline
     sz = sz "output = text" newline
     sz = sz "region = us-east-1" newline
     sz = sz "aws_access_key_id = \"" a[2] "\"" newline
     sz = sz "aws_secret_access_key = \"" a[4] "\"" newline
     sz = sz newline
     sz = sz "For Java Programs" newline
     sz = sz "String aws_access_key_id=\"" a[2] "\";" newline
     sz = sz "String aws_secret_access_key=\"" a[4] "\";" newline
     sz = sz newline
     return sz
}



function isotolocal(sz,                      fmt,yr,mo,dy,hr,mn,se,zu) {
     # sz = "2018-05-21T14:42:36Z"
     yr = substr(sz,1,4)
     mo = substr(sz,6,2)
     dy = substr(sz,9,2)
     hr = substr(sz,12,2)
     mn = substr(sz,15,2)
     se = substr(sz,18,2)
     zu = substr(sz,20,1)

     # mktime(YYYY MM DD HH MM SS)
     fmt = "%m/%d/%Y %H:%M:%S";
     fmt = "%m/%d/%Y %I:%M:%S%p";
     return strftime(fmt, mktime(yr " " mo " " dy " " hr " " mn " " se) - (4 * 3600) )
}


function isonow() {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     return strftime(fmt, systime() + (4 * 3600) )
}
function isonowhour() {
     fmt = "%Y-%m-%dT%H:00:00Z";
     return strftime(fmt, systime() + (4 * 3600) )
}
function isoyesterday(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) - (24 * 3600 * n) )
}
function isoyesterfiveday() {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     fmt = "%Y-%m-%dT%H:00:00Z";
     return strftime(fmt, (systime() + (4 * 3600)) - (24 * 3600 * 5) )
}
function isoyestertenday() {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     fmt = "%Y-%m-%dT%H:00:00Z";
     return strftime(fmt, (systime() + (4 * 3600)) - (24 * 3600 * 10) )
}
function isoyesterhour(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) - (1 * 3600 * n) )
}
function isoyesterminute(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) - (1 * 60 * n) )
}

function isofutureday(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) + (24 * 3600 * n) )
}
function isofuturehour(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) + (1 * 3600 * n) )
}
function isofutureminute(n) {
     fmt = "%Y-%m-%dT%H:%M:%SZ";
     if ( n <=0 ) n = 1;
     return strftime(fmt, (systime() + (4 * 3600)) + (1 * 60 * n) )
}

