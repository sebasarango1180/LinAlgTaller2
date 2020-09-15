% Obtenga la descomposición en valores singualares de una foto suya en escala de grises. Represéntela
% de nuevo utilizando sólo el valor singular mayor, luego los dos mayores, luego los tres mayores y ası́
% hasta agotarlos. Cuál cree usted que serı́a en esta foto un corte óptimo?

clear all;
close all;

img = imread("my_picture7.jpg");
grayscale_img = double(rgb2gray(img));

figure("Name", "Original Image")
imshow(uint8(grayscale_img))
title("Original Image")

[U,S,V] = svd(grayscale_img); % SVD of image

fig = 1;
for n=[1,5,20,500] % desired number of singular values
    D = S;
    D(n:end, n:end) = 0; % Remove singular values from threshold
    recover = U*D*V';
    
    subplot(2, 2, fig)
    imshow(uint8(recover))
    title(n + " First Singular Values")
    fig = fig + 1;
end

%% Conclusiones

% Aquí es evidente que los primeros valores singulares de la imagen otorgan poca información,
% reflejando composiciones de trazos simples como esquinas y cruces. sin embargo, al aumentar la cantidad de 
% valores singulares que aportan a la composición de la imagen, esta logra reproducirse a un nivel más cercano a la original.
% 
% Si bien hay alternativas desde el punto de vista de optimización para determinar
% el número óptimo de valores singulares a usar, una opción válida para determinar
% el sub-rango útil puede ser analizar la matriz diagonal de valores singulares,
% denotada en MATLAB como $S$. En dicha matriz, basta con buscar la primer caída
% significativa de un valor singular $s_{i}$ al siguiente $s_{i+1}$, pues esto
% implica que la información provista por el valor $i+1$ y posteriores es considerablemente
% menor a la del valor $i$. En general, buscar un par contiguo de valores singulares
% tal que $s_{i} - s_{i+1} \geq umbral $.

% Para el caso particular de este ejercicio, un punto de corte razonable
% puede encontrarse en $i = 100$, pues los valores singulares a partir de este
% poseen un peso considerablemente reducido y se evidencia que la imagen allí
% ya logra verse bien recuperada. 

