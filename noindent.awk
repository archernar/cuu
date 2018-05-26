BEGIN {
    if (length(A) > 0) D = " ";
}
{
    print A D $0
}
