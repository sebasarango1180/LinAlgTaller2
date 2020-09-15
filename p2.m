% Simule cualquier matriz aletoria A rectangular. Calcule el determinante y la traza de A ′ ∗ A y
% también de A ∗ A ′ . Comente los resultados. Identifique cómo se relacionan los autovalores y au-
% tovectores de A ′ ∗ A y de A ∗ A ′ . Veáse una aplicación de esto en las ecuaciones (4) y (5) de
% https://sites.cs.ucsb.edu/~ mturk/Papers/jcn.pdf. 1

clear all;
close all;

A = randn(4);

Det_AtA = det(A'*A);
T_AtA = trace(A'*A);

Det_AAt = det(A*A');
T_AAt = trace(A*A');

[V_AtA, D_AtA] = eig(A'*A);
[V_AAt, D_AAt] = eig(A*A');

%% Conclusiones

% Al analizar el determinante de ambas matrices, se concluye que el
% determinante es igual en ambas sin importar el orden de transposición. De
% igual forma, se conserva la misma equivalencia respecto a las trazas.
% 
% Respecto a los autovalores, en ambas matrices sus valores propios son
% iguales y distintos de cero. No es el caso de los autovectores, que son
% distintos para cada una de las matrices compuestas.
