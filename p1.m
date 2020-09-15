% Simule varias matriz aletoria $A \in R_{mxn}$ rectangular. Calcule los autovalores de $C = A^{T}A$. Qué
% observa?. Pruebe computacionalmente y en forma teórica que para todo $x \in R_{n}$ se da que $x^{T}Cx \geq 0$

clear all;
close all;

A1 = randn(3,4);
A2 = randn(6,3);
A3 = rand(2,5);

C1 = A1'*A1;
C2 = A2'*A2;
C3 = A3'*A3;

[VC1, DC1] = eig(C1);
[VC2, DC2] = eig(C2);
[VC3, DC3] = eig(C3);

%% Conclusiones

% Para el caso en que m<n, es decir cuando hay menos filas que columnas, se da
% que n-m autovalores de la matriz C = A'A son cero. De igual forma,
% siempre se cumple que los autovalores no nulos son positivos.
% En todos los casos se cumple que el rango de la matriz C es menor a su
% dimensión, por lo que uno o más autovectores no son tenidos en cuenta a
% la hora de reconstruir la matriz C original.
