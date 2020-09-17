clear
means = zeros([15,1]);
cova = hilb(15);
n = 1000;
n_contamination = 100;

D = mvnrnd(means, cova, n);
detD = det(cov(D));
for j = 0:25
   index = randi([1,15]);
   means = zeros([15,1]);
   means(index) = j;
   
   C = mvnrnd(means, cova, n_contamination);
   S = [D
       C];
   
   S_cov = cov(S);
   det(S_cov)
   det(cov(D))
   
   [S_vec, S_val] = eig(S_cov);
   
   CLW = cov1para(S);
   [CLW_vec, CLW_val] = eig(CLW);
   
    [idx,dm,mm,cov_cur,wval0,ndir] = kur_main(S);
    [CUR_vec, CUR_val] = eig(cov_cur);
   
   if j == 0
       vec_0 = S_vec;
       CLW_vec_0 = CLW_vec;
   end
   
   distances(j+1) = norm(vec_0 - S_vec, 'fro');
   CLW_distances(j+1) = norm(CLW_vec_0 - CLW_vec, 'fro');
   
end

plot(1:26, distances,'o') 
hold on 
plot(1:26, CLW_distances, 'or')

