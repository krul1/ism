function m = binary(m)
for i=1:na
    for j=1:ma
        if M(i,j)=='V'
            M(i,j)==1 & M(j,i)==0;
        end
        if M(i,j)=='A'
            M(i,j)==0 & M(j,i)==1;
        end
        if M(i,j)=='X'
            M(i,j)==1 & M(j,i)==1;
        end
        if M(i,j)=='O'
            M(i,j)==0 & M(j,i)==0;
        end
        if M(i,j)=='C'
            M(i,j)==0 & M(j,i)==0;
        end
    end    
end
