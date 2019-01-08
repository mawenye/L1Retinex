function u = L1Editting(I,f,tol)

[m,n] = size(I);
lambda = 1;

u = I;
d = zeros(m,n,2);
b = zeros(m,n,2);

diff = 1;
k = 0;
Niter = 1000;

while diff > tol && k < Niter
    
    rhs = div(d+f-b);
    oldu = u;
    u = iPoissonDCT2(rhs,I(1,1));
    
    diff = sqrt(sum((u(:)-oldu(:)).^2)/sum(u(:).^2))
    
    d = grad(u)-f+b;
    d = isoshrink(d(:),1/lambda,2);
    d = reshape(d,[m n 2]);
    
    b = b-d+grad(u)-f;

    k = k + 1
end

% figure
% plot(E);