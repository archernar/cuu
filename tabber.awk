BEGIN {
    D1="\t";
    D2="\t";
    D3="\t";
    D5="\t";
    if (length(A) > 0) D1 = " ";
    if (length(B) > 0) D2 = " ";
    if (length(C) > 0) D3 = " ";
    if (length(D) > 0) D4 = " ";
}
{
    print A D1 B D2 C D3 D D4 $0
}
