function ltrim(s) { sub(/^ */, "", s); return s }
function rtrim(s) { sub(/ *$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }



function cutpad(s,n,d,             i,l) { 
    l=length(s);
    if (l > n) s=substr(s,1,n);
    if (l<n) {
        for (i=0;i<(n-l);i++) s = s d;
    }
    return s;
}

function dq(sz) {
     return "\"" sz "\"";
}

# String. RegEx2Replace, Replacement,LengthtoRealize,Padding Character
function anvil(s,re,rpl,n,d,             sz) { 
     sz=s;
     gsub(re,rpl,sz);
     sz = cutpad(sz,n,d);
     return sz;
}
function indent(sz) {
    print "     " sz $0
}
