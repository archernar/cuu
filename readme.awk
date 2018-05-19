BEGIN {
         print "# cuu"
         print " "
         print "<pre> "
         pr = 1
}

/^[#] README[.]md Start/,/^[#] README[.]md End/ {
     sz = $0
     sub(/^.*print ["]/,"",sz);
     sub(/["]$/,"",sz);
     if (sz ~ /^[#] README[.]md.*/) pr=0;
     if (sz ~ /^usage[(].*/) pr=0;
     if (sz ~ /^$/)          pr=0;
     if (sz ~ /}$/)          pr=0;
     if ( pr == 1) print sz ""
     pr = 1
}

END {
     print "</pre>"
}