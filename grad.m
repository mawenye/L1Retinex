function B = grad(A)

[m, n] = size(A);
B = zeros(m, n, 2);

Ar = zeros(m, n);
Ar(:, 1:n-1) = A(:, 2:n);
Ar(:, n) = A(:, n);


Au = zeros(m, n);
Au(1:m-1, :) = A(2:m, :);
Au(m, :) = A(m, :);

B(:, :, 1) = Au - A;
B(:, :, 2) = Ar - A;

