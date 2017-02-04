M=input ('Enter a matrix with 0s or 1s: \n');


[na,ma]=size(M);
if na ~= ma
    disp('ERROR:matrix A should be a square matrix: \n')
    return
end
disp('B is matrix Developed from SSIM by removing V,A,X,O,C')
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

        
B=M


%function Rem= prac(B);
[na,ma]=size(B);
if na ~= ma
    disp('ERROR:matrix A should be a square matrix: \n')
    return
end
for i=1:na
    for j=1:ma
          if (B(i,j)~=1 && B(i,j) ~= 0)
             error('Data must be only 0s, 1s');
             
          end
    end
end
disp('ReachibilityMatrix is obtained by Adding Identity Matrix')
Rem=B+eye(na)
disp('No.of ones columnwise of Matrix B')
columnOne=sum(B)
disp('No.of Ones Rowwise of Matrix B')
rowOne=sum(B')

%for c=1:1000
%    if mpower(Rem,c)==mpower(Rem,c+1)
%        fprintf('maximum path length: %d\n', c);

%        return;
%    end    
%end     
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%gauss elimination for row reduced echelon form
%disp('performing Guassian elimination for Row Reduction')

%LowerTriangularMatrix=Rem;
%for i = 1:na-1
%   m = -LowerTriangularMatrix(i+1:na,i)/LowerTriangularMatrix(i,i); % multipliers
%   LowerTriangularMatrix(i+1:na,:) = LowerTriangularMatrix(i+1:na,:) + m*LowerTriangularMatrix(i,:);
    
%end

%FinalLowerTriangularMatrix = LowerTriangularMatrix'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%%%%%%
% partitioning

[ii jj] = find(Rem); %// find row and col indices (ii and jj respectively)
rows = accumarray(ii,jj,[], @(w) {sort(w).'}); %'// group jj as per ii, and sort
cols = accumarray(jj,ii,[], @(e) {sort(e).'}); %'// group ii as per jj, and sort
disp('%                 Reachibility Set                    %')
rows{:}
disp('%                 Antecedent Set                      %')
cols{:}
disp('%                 Intersection                        %')
[pp qq] = find(Rem & Rem.');
z = accumarray(pp,qq,[], @(t) {sort(t).'});
z{:}
disp('%                 Ranking                             %')
r = cellfun(@(rows)rows(1),cellfun(@(c,v)find(ismember(c,v)),rows,cols,'un',0),'un',0);
r{:}





%l=rows{:};
%t=10
%while(t~=0){
%    for rows{:}
%        Intersection{:}=rows{:}&&cols{:};
%%    end
 %   if (Intersection==rows) 
        
    







            



%Adjacency matrix
AM=B;
for i=1:na
    for j=1:ma
        if AM(i,i)~=0
           AM(i,i)=AM(j,j)==0;
        end
    end    
end
AM
for i=1:na
    for j = 1:ma
        if(AM(i,j) == 1)
            for k = i+1:na
                if(AM(k,i) == 1)
                    AM(k,j) = 0;
                end
            end
        end
    end

end

AM
ColumnOneAM=sum(AM)
RowOneAM=sum(AM')
%plot(columnOne,ColumnOneAM,columnOne,RowOneAM)

disp('%%%     Maximum pathlength is n if ReachibilityMatrix^n=ReachibilityMatrix^n+1    %%%') 
for l=1:10000
    if (mpower(Rem,l)==mpower(Rem,l+1))
        fprintf('maximum path length: %d\n', l);
        return;
    end  
end     



%[0 1 0 1 0 1 1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0;1 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 1 0 0 1 1 0;0 0 0 0 0 1 0 1 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0;0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 0;0 0 0 1 0 1 0 1 1 0 0 0 0 0 0 1 0 0 0 1 1 1 0;1 1 1 0 1 0 1 1 1 1 1 0 0 1 1 1 0 0 0 1 1 1 0 ;1 1 0 1 0 0 0 1 0 0 0 0 0 1 1 1 0 0 1 1 1 0 0;0 1 1 1 1 0 1 0 1 0 1 1 0 0 0 1 0 0 0 0 0 0 0;1 1 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;1 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0;1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0 0 0 1 0 0 0 0;0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 1 0 0 0 1 1 0 0;0 0 0 0 0 0 0 0 1 0 1 1 1 1 0 1 0 0 0 1 0 1 0;0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0;0 0 1 1 1 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 1;0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 1 0;0 0 0 1 1 0 1 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 0;0 1 0 1 1 0 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 1 0;0 1 1 1 1 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 0 1;0 0 0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 1 1 0 1 0]
%[0 1 0 1 0 1 1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0;1 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 1 0 0 1 1 0;0 0 0 0 0 1 0 1 0 0 1 1 0 0 0 0 0 0 1 0 0 0 0;0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 0;0 0 0 1 0 1 0 1 1 0 0 0 0 0 0 1 0 0 0 1 1 1 0;1 1 1 0 1 0 1 1 1 1 1 0 0 1 1 1 0 0 0 1 1 1 0 ;1 1 0 1 0 0 0 1 0 0 0 0 0 1 1 1 0 0 1 1 1 0 0;0 1 1 1 1 0 1 0 1 0 1 1 0 0 0 1 0 0 0 0 0 0 0;1 1 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;1 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0;1 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0 0 0 1 0 0 0 0;0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 1 0 0 0 1 1 0 0;0 0 0 0 0 0 0 0 1 0 1 1 1 1 0 1 0 0 0 1 0 1 0;0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0;0 0 1 1 1 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 1;0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 0 0 1 0;0 0 0 1 1 0 1 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 0;0 1 0 1 1 0 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 1 0;0 1 1 1 1 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 0 1;0 0 0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 1 1 0 1 0]
%[0 0 0 0 0 0 0;1 0 0 0 0 0 0;1 0 0 0 0 0 0;1 1 0 0 1 0 0;1 1 0 1 0 0 0;1 0 1 0 0 0 1;1 0 1 0 0 1 0]
