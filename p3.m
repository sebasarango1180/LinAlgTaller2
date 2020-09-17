
clear all
for n= 1:100
    mu = zeros(1,n);
    sigma = hilb(n);
    A = mvnrnd(mu,sigma,3);
    C = A' * A;
    C2 = A*A'; %large
    detC(n) = det(C);
    detC2(n) = det(C2);
    traceC(n) = trace(C);
    traceC2(n) = trace(C2);
end

plot( detC,'r');
hold on
plot( detC2, 'b');
legend("det A' * A","det A*A'");


%%%%
a = [    2.0000    4.0000    5.0000  220.0000
    6.0000    9.0000    8.0000  490.0000
    4.1000    5.0000    3.0000  274.0000];

b = [    2.0000    4.0000    5.0000  220.0000
    6.0000    9.0000    8.0000  490.0000
    4.2000    5.0000    3.0000  274.0000];

A = [    2.0000    4.0000    5.0000  
    6.0000    9.0000    8.0000  
    4.1000    5.0000    3.0000  ];

