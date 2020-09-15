filename = 'portfolio100.txt';
delimiterIn = ' ';
headerlinesIn = 1;
Data = importdata(filename,delimiterIn);
Data = Data(:,2:end);
[f c] = size(Data);

asimetria = skewness(Data); %Asimetria
curtosis = kurtosis(Data); %Curtosis
varianza = var(Data); %Varianza

pon = 1:f;
pon = pon / f;

sum_v = sum(varianza) * sum(pon);

m = mean(Data);


for i=1:c
    d(i) = sum(Data(:,i) - m(i))^2 * pon(i);
end

varianza_interior = sum(d);

varianza_global = varianza_interior + sum_v;


%%%%% Agregando ultima fila
for i=1:c
    prom(i) = sum(Data(:,i)) / f;
end

new_data = Data;
new_data(end+1,:) = prom;

asimetria_2 = skewness(new_data); %Asimetria
curtosis_2 = kurtosis(new_data); %Curtosis
varianza_2 = var(new_data); %Varianza

pon_2 = 1:f;
pon_2 = pon_2 / f;

sum_v_2 = sum(varianza_2) * sum(pon_2);

m_2 = mean(new_data);


for i=1:c
    d(i) = sum(new_data(:,i) - m_2(i))^2 * pon(i);
end

varianza_interior_2 = sum(d);

varianza_global_2 = varianza_interior + sum_v;