
index = 1;

for n=2:100
    data = randn(1000,n);
    [f c] = size(data);
    p = eye(f) - ones(f) / f;
    data_cent = p * data;
    mat_cov = data_cent' * p * data_cent / (f);
    matlab_cov = cov1para(data,0.5);
    %matlab_cov = cov(data);
    d_1(index) = norm(mat_cov - matlab_cov, 1);
    d_2(index) = norm(mat_cov - matlab_cov, 2);
    d_inf(index) = norm(mat_cov - matlab_cov, 'inf');
    d_frob(index) = norm(mat_cov - matlab_cov, 'fro');
    index = index + 1;
end

subplot(2,2,1)
plot(2:100, d_1);
title('norm 1');
subplot(2,2,2)
plot(2:100, d_2);
title('norm 2');
subplot(2,2,3)
plot(2:100, d_inf);
title('norm inf');
subplot(2,2,4)
plot(2:100, d_frob);
title('norm frob');