function B=div(A)

[m,n,r]=size(A);
B=zeros(m,n);

T=A(:,:,1);
T1=zeros(m,n);
T1(2:m,:)=T(1:m-1,:);

B=B+T-T1;

T=A(:,:,2);
T1=zeros(m,n);
T1(:,2:n)=T(:,1:n-1);

B=B+T-T1;