%Consulte en qué consiste el producto Kronecker y verifique comptacionalmente
% que si A y B son cuadradas de órdenes n y p los np vectores propios de su
% producto de Kronecker, A B, son el producto de Kronecker de los vectores
% propios de A y B.

clear all;
close all;

% Generate 2 square matrices Anxn Bpxp
n = 3; p = 5;

A = rand(n)*10;
B = rand(p)*10;

% Kronecker product between A and B 
K = kron(A,B); % Kronecker

% Generate eigenvalues/vectors for A and B
[vec_A, val_A] = eig(A);
[d_a, index_a]=sort(diag(val_A), 'descend');
val_A = diag(d_a);
vec_A = vec_A(:,index_a);

[vec_B, val_B] = eig(B);
[d_b, index_b] = sort(diag(val_B), 'descend');
val_B = diag(d_b);
vec_B = vec_B(:,index_b);

% Generate eigenvalues/vectors for Kronecker product matrix, K
[vec_K, val_K] = eig(K);
[d_k, index_k] = sort(diag(val_K),'descend');
val_K = diag(d_k);
vec_K = vec_K(:,index_k);

% Compute Kronecker prod of eigenvectors of matrices A and B
K_vecAB = kron(vec_A, vec_B);


%% Conclusiones

% Al realizar el eigenanálisis de las 3 matrices, se aprecia que los
% autovalores del producto Kronecker (K) entre A y B son iguales al producto 
% Kronecker entre los autovalores de A y B.

