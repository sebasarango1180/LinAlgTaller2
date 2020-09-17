% Se le ocurre alguna alternativa robusta para el método PCA?. Escrı́bala con detalle y si está interesado
% en éstas versiones robustas, programe algo sencillo y me busca luego para el diseño de algo más
% elaborado que podrı́a suponer un proyecto integrador o incluso un trabajo de grado.

clear all;

A = randn(50,8)*10;

[U, D, V] = ImprovedPCA(A,5);


%% Improved PCA

function [U, D, V] = ImprovedPCA(Data, Components)
    
    n = size(Data,1); % Rows of data matrix
    p = size(Data,2); % Columns of data matrix
    
    if nargin > 1
      k = Components+1;
    else
      k = p;
    end
    
    C = Data - (1/n)*ones(n,n)*Data; % Remove mean from data
    
    % Diagonal matrix with standard
    % deviations for every variable in the main diagonal.
    % S = diag(diag(sqrt((1/(n-1))*(C'*C))));
    
    S = diag(std(C));
    
    Z = C*pinv(S); % Standardized input
    
    [U, D, V] = svd(Z);
    
    D(k:end, k:end) = 0; % Remove singular values from threshold
    
end
