function a = rankL(mat)
%[m,n] = sort(mat);
m = unique(mat);
%cdiff = diff(m);
for i=1:length(mat)
    a(i)=find(m==mat(i));
end