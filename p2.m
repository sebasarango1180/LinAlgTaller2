A = randi([1, 10], [2,3]);
A2 = A' * A;
detA2 = det(A2);
traceA2 = trace(A2);
[V,D] = eig(A2);

A3 = A * A';
detA3 = det(A3);
traceA3 = trace(A3);
[V3,D3] = eig(A3);

