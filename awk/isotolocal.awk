{
     for ( i=1;i<=NF;i++i ) {
     if ( $i ~ /20[0-9][0-9]-[0-9][0-9]-/) {
          printf( "%s ", isotolocalwithlapse($i) );
     }
     else {
          printf("%s ", $i);
     }
}
     printf("\n ");
}


function isotolocalwithlapse(sz,                      fmt,yr,mo,dy,hr,mn,se,zu,i,l,n,d,v,szsz,s,szszsz) {
     # sz = "2018-05-21T14:42:36Z"
     # return strftime(fmt, mktime(yr " " mo " " dy " " hr " " mn " " se) - (4 * 3600) )
     yr = substr(sz,1,4)
     mo = substr(sz,6,2)
     dy = substr(sz,9,2)
     hr = substr(sz,12,2)
     mn = substr(sz,15,2)
     se = substr(sz,18,2)
     zu = substr(sz,20,1)

     # mktime(YYYY MM DD HH MM SS)
     fmt = "%m/%d/%Y %H:%M:%S";
     fmt = "%m/%d/%Y-%I:%M:%S%p";
     fmt = "%m/%d-%I:%M:%S%p";
     # Very Short Format
     fmt = "%m%d%I%M%S%p";
     szsz=strftime(fmt, mktime(yr " " mo " " dy " " hr " " mn " " se) - (4 * 3600) );


     i = (systime() - mktime(yr " " mo " " dy " " hr " " mn " " se)) - (4 * 3600) ;
     v=0
     # v=i/(24*3600)
     v=i/(1*3600)
     if ( v > 999) v=999;
     # s= szsz ":" sprintf("%03dD", i/(24*3600)) "";
     # s= szsz ":" sprintf("%2d",v) "";
     s= sprintf("%03d",v);
     return s

}
