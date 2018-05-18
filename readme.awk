BEGIN {
         print "## cuu"
         print " "
         print "<pre> "
     flag = 0
}

/Usage:/,/^[}]/ {
     flag = 1
     sz = $0
     sub(/^.*print ["]/,"",sz);
     sub(/["]$/,"",sz);
     sub(/^[}]$/,"",sz);
     print sz ""
}

END {
     print "</pre>"
}
