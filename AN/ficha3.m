format long

%Ex.1
%b)
f1 = @(x) x .* exp(-x) - 0.25;
a11 = 0;
a12 = 1;
b11 = 1;
b12 = 3;
tol1 = 1e-4;

r11 = metBisseccao(f1, a11, b11, tol1);
r12 = metBisseccao(f1, a12, b12, tol1);

%Ex.2 - Se a função tiver um zero de ordem par, então a função toma o mesmo
%sinal à esquerda e à diretia do zero. Se a função tiver de um zero de
%ordem ímpar, então o sinal da função muda ao cruzar o zero.

%Ex.3 - functions/metBisseccao.m 

%Ex.4
%a)
a4 = 1;
b4 = 2;

%b) O Número de Interações é dado pela expressão ((log(b-a) - log(tol)) /
%log(2))
tol4 = 1e-10;

nI41 = ((log(b4 - a4) - log(tol4)) / log(2));

%c)
f4 = @(x) x .* log(x - 1);

nI42 = metBisseccao (f4, a4, b4, tol4);

%d)
newTol4 = 1e-20;

nI43 = metBisseccao (f4, a4, b4, newTol4);

%Ex.7 - functions/metNewtonRaphson.m







