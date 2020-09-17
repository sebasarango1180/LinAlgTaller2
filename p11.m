
clear all

n = 1000;
e = random('normal', 0, sqrt(0.2), n, 1);
sum = 0;
for i=1:6
    X(:,i) = mvnrnd(i,1,1000);
    sum = sum + (i^3)*X(:,i);  
end

y = 15 + sum + e;
A = [ones(n,1), X];

tic;
B = A\y;
time1 = toc;

tic;
fitlm (X, y)
time2 = toc;

for i=1:50
    no_singular(:,i) = mvnrnd(5,5,50);      
end
det_singular = det(no_singular);
S = [ones(n,1), X];

tic;
B1 = S\y;
time3 = toc;

tic;
fitlm (S, y)
time4 = toc;
