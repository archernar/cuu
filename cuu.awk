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


function configrecord(szIn,               sz,a,n,newline) {
     n = split(szIn,a," ");
     newline="\n"
     sz = sz newline
     sz = sz szIn newline
     sz = sz newline
     sz = sz "[profile " a[6] "]" newline
     sz = sz "output = text" newline
     sz = sz "region = us-east-1" newline
     sz = sz "aws_access_key_id=" a[2] newline
     sz = sz "aws_secret_access_key=" a[4] newline
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
     return strftime(fmt, mktime(yr " " mo " " dy " " hr " " mn " " se) - (4 * 3600) )
}





