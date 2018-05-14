function ltrim(s) { sub(/^ */, "", s); return s }
function rtrim(s) { sub(/ *$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }


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





