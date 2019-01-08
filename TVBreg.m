
function u = TVBreg(I, t, tol)

[m,n] = size(I);

DI = grad(I);
d = isoshrink(DI(:), t, 2);
d = reshape(d, [m n 2]);

%%
u = zeros(m, n);
b = zeros(m, n, 2);

lambda = 2;
nIter = 1000;
k = 0;
diff = 1;

while k < nIter && diff > tol
    
    oldu = u;
    
    rhs = div(d - b);
    u= iPoissonDCT2(rhs, I(1,1));

    diff = sqrt(sum((oldu(:)-u(:)).^2)/sum((u(:).^2)))    
    Du = grad(u);

    d = reshape(DI+lambda*(Du+b),[],1);
    d = isoshrink(d,t,2)/(1 + lambda);
    d = reshape(d, [m n 2]);
    
    b = b+Du-d;
    
    k = k+1
end