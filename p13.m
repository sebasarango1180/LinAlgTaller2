clear all
% data import 
importedData = importdata('portfolio100.txt');
D = importedData(:,2:end);

%Ax = b
B = D(1:500, :);
A = B'*B;
x= randi([1, 20], [100,1]);
b = A*x;
xinv = inv(A) * b;
Dxinv = norm(xinv-x);
disp('inversa');
disp(Dxinv);

% LUx = b
[L U P] = lu(A);
NA = P*A;
Nb = P*b;
y = inv(L) * Nb;
xLU = inv(U) * y;
DxLU = norm(xLU-x);
disp('inversa LU');
disp(DxLU);

%
yLU2 = L \Nb; % lo mismo a inv(L) * Nb
xLU2 = U \ y; % lo mismo a inv(U) * y
DxLU2 = norm(xLU2-x);
disp('inversa LU generalizada')
disp(DxLU2);

%inversa generalizada/ inversa pennrose
xgen = A \ b;
Dxgen = norm(xgen-x);
disp('Inversa generalizada');
disp(Dxgen);

%QRx = b
[Q, R] = qr(A);
Qb = Q' * b;
xQR = R \ Qb;
DxQR = norm(xQR-x);
disp('Inversa QR');
disp(DxQR);

%cholesky LL'x = b
% y =L'*x
L = chol(A);
y = L' \ b;
xChol = L\ y;
DxChol = norm(xChol-x);
disp('Cholesky');
disp(DxChol);
