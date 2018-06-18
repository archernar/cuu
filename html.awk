BEGIN {
    sz ="";
    sz = sz "<html>\n"
    sz = sz "<body>\n"
    sz = sz "<center>\n"
    sz = sz "<br>\n"
    sz = sz "<br>\n"
    sz = sz "<br>\n"
    sz = sz "<br>\n"
    sz = sz "<br>\n"
    sz = sz "<table cellpadding=4 cellspacing=0 border=1>\n"


}
END {
    sz = sz "</table>\n"
    sz = sz "</center>\n"
    sz = sz "</body>\n"
    sz = sz "</html>\n"
    print sz


}


{
    if (!( $1 ~ "index.html")) {
    url=$2
    label=$1
    sz = sz "<tr>\n"
    sz = sz "<td>\n"
    sz = sz "<a href='" url "'>" label "</a>\n"
    sz = sz "</td>\n"
    sz = sz "</tr>\n"
    }

}
