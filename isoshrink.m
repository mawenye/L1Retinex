function d=isoshrink(v,t,m)

s = size(v,1);
r = s / m;
vv = reshape(v, r, []);
vv = vv';
q = sqrt(sum(vv.^2));
q = q';
q = kron(ones(m, 1), q);
indx = find(q > t);
d = zeros(s, 1);
d(indx) = v(indx) - t * (v(indx))./q(indx);