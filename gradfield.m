function f = gradfield(I, t)

dI = grad(I);

normdI = sqrt(dI(:,:,1).^2 + dI(:,:,2).^2);
index = normdI < t;

f1 = dI(:,:,1);
f1(index) = 0;

f2 = dI(:,:,2);
f2(index) = 0;

f(:,:,1) = f1;
f(:,:,2) = f2;
