function o = orderM(M)
startSum = sum(M);
rankS = rankL(startSum);
%[m,n] = size(rankS);
a=M^2;
rankC = rankL(sum(M)) ;
o = 1;
while(rankC ~= rankS)
    a = a * M ;
    rankC = rankL(sum(M));
    o = o +1 ;
end