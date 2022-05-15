clc;
c=[2 10 4 5;6 12 8 11;3 9 5 7]
a=[12 25 20]
b=[25 10 15 5]
if sum(a)==sum(b)
    disp('Balanced')
else
    disp('Unblanced')
if (sum(a)<sum(b))
    c(end+1,:)=zeros(1,size(a,2))
    a(end+1)=sum(b)-sum(a)
else (sum(b)<sum(a))
    c(:,end+1)=zeros(1,size(a,2))
    b(end+1)=sum(a)-sum(b)
end
end
ic=c
x=zeros(size(c))
[m,n]=size(c)
BFS=m+n-1
for i=1:size(c,1)
    for j=1:size(c,2)
        hh=min(c(:));
        [ri,ci]=find(hh==c)
        x11=min(a(ri),b(ci))
        [val,ind]=max(x11)
        ii=ri(ind)
        jj=ci(ind)
        y11=min(a(ii),b(jj))
        x(ii,jj)=y11
        a(ii)=a(ii)-y11
        b(jj)=b(jj)-y11
        c(ii,jj)=inf
    end
end
disp('intial BFS = ')
ib=array2table(x);
disp(ib);

initialc=sum(sum(ic.*x));
disp('intial bfs = ');
disp(initialc);

