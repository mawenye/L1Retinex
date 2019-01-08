function u=iPoissonDCT2(rhs,a)

[M,N]=size(rhs);

k=1:M;
l=1:N;
k=k';
eN=ones(1,N);
eM=ones(M,1);
k=cos(pi/M*(k-1));
l=cos(pi/N*(l-1));
k=kron(k,eN);
l=kron(eM,l);
lambda=2*(k+l-2);

u=dct2(rhs);
u=u./lambda;
u(1,1)=0;

u=idct2(u);

u=u-u(1,1)+a;
