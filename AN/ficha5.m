format long

%Ex.1
f1 = @(x) log(x);
a1 = 1;
b1 = 2;
eta1 = 1.5;
h1 = b1 - a1;

%a)
r1a = (h1/2) * (f1(a1) + f1(b1)) - (h1^3/12) * (-1/(eta1^2));

%b) O valor da aproximação será menor que o valor exato, pois a regra do
%trapézio tende a subestimar o valor de integrais de funções concavas.

%c)
valorexato1 = 2 * log(2) - 1;

erro1 = abs(valorexato1 - r1a);

%Ex.2
f2 = @(x) log(x);
a2 = 1;
b2 = 2;
eta2 = 1.5;
h2 = (b2 - a2) / 2;
m2 = (a2 + b2) / 2;

%a)
r2a = (h2/3) + (f2(a2) + 4 * f2(m2) + f2(b2)) - (h2^5/90) * (-6/eta2^4);

%b) O valor da aproximação será menor que o valor exato, mas tende a ser
%mais preciso do que quando foi utilizado a regra do trápezio.

%c)
valorexato2 = 2 * log(2) - 1;

erro2 = abs(valorexato2 - r2a);

%Ex.3
f3 = @(x) exp(-x);
a3 = 0;
b3 = 1;
eta3 = 0.5;
h3 = b3 - a3;

%a)
aprox3a = (h3/2) * (f3(a3) + f3(b3)) - (h3^3/12) * exp(eta3);
valorexato3a = exp(-1) - 1;

erro3a = valorexato3a - aprox3a;

%b)
a31 = 0;
b31 = 1/2;
a32 = 1/2;
b32 = 1;
eta3b1 = 0.25;
eta3b2 = 0.25;
h31 = b31 - a31;
h32 = b32 - a32;

aprox3b = (h31/2) * (f3(a31) + f3(b31)) - (h31^3/12) * exp(eta3b1) + (h32/2) * (f3(a32) + f3(b32)) - (h32^3/12) * exp(eta3b2);
valorexato3b = exp(-1/2) - 1 + exp(-1) - exp(-1/2);

erro3b = valorexato3b - aprox3b;

%Ex.4 && Ex.5 - functions/regTrapezio.m
%Ex.6 && Ex.7 - functions/regSimpson.m

%Ex.8
f8 = @(x) (4./1+x.^2);
a8 = 0;
b8 = 1;
valorexato8 = pi;

%a)
for k8a = 1:8
    n8a = 2^k8a;
    tn8a = regTrapezio (f8, a8, b8, n8a);
end

%b)
for k8b = 1:8
    n8b = 2^k8b;
    tn8b = regSimpson (f8, a8, b8, n8b);
end

%Ex.9 - Repetir o ex. anterior com f9 = @(x) x^(1/2);

%Ex.10
f10 = @(x) 5 * x;
h10 = 5;
a10 = 0;
b10 = 30;
n10 = (b10 - a10)/h10;

r10 = regSimpson (f10, a10, b10, n10);

%Ex.11
f11 = @(x) sin(x);
dff11 = @(x) cos(x);
f11i = @(x) sqrt(1. + (dff11(x)).^2);
a11 = 0;
b11 = 37;
n20 = 20;
n40 = 40;

t20 = regTrapezio (f11i, a11, b11, n20);
t40 = regTrapezio (f11i, a11, b11, n40);

s20 = regSimpson (f11i, a11, b11, n20);
s40 = regSimpson (f11i, a11, b11, n40);











