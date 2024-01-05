format long

%Ex.1
%a)
coe1 = [1,0,0,0];
coe2 = [1,1,0,1,0,1,0,1,1];

base = 2;

r1 = polyval(coe1,base);
r2 = polyval(coe2,base);

%b)
r12 = bin2dec('1000');
r22 = bin2dec('110101011');

%c)
c1 = 'A10F9';
c2 = '235604';
c3 = c2;

rc1 = hex2dec(c1);
rc2 = base2dec(c2,8);
rc3 = base2dec(c3,8);

%Ex.2
n1 = 1325;
n2 = 128;

b1 = dec2bin(n1);
b2 = dec2bin(n2);

h1 = dec2hex(n1);
h2 = dec2hex(n2);

o1 = dec2base(n1,8);
o2 = dec2base(n2,8);

%Ex.3
%b)
coeficiente1 = [1,0,1,1];
base1 = 1/2;
result1 = polyval(coeficiente1,base1);

coeficiente2 = [1,0,1,1];
result2 = polyval(coeficiente2,base1);

coeficiente3 = [1,0,1,1];
result3 = polyval(coeficiente3,base1);


coeficiente41 = [1,0];
coeficiente42 = [1,1,1,1,1,1,1,0,1];
result4 = polyval(coeficiente41,base) + polyval(coeficiente42,base1);

%Ex.4
n41 = 0.125;
n42 = 1/3;
n43 = 0.1;
n44 = 0.2;

r41 = dec2bin(n41);
r42 = dec2bin(n42);
r43 = dec2bin(n43);
r44 = dec2bin(n44);

%Ex.5
%a) Não existe associatividade da adição e da multiplicação num sistema de
%vírgula flutuante, devido à precisão do próprio MATLAB.

%b) A distribuidade da multiplicação em relação à adição não é mantida
%devido ás limitações de precisão e arredondamento associados as operações.

%c) Uma das soluções possíveis é 0 porque em um sistema de ponto flutuante
%padrão, somar um número muito pequeno a 1 não altera o resultado de
%maneira perceptível devido à limitação da precisão do MATLAB.

%Ex.6
%a)
k = 1;
v61 = repmat(0.1, k, 80000);

r61 = 8000 - sum(v61);

%b)
v62 = repmat(0.125, k, 80000);

r62 = 10000 - sum(v62);

%c) O segundo valor é 0, devido ás limitações na precisãoi do MATLAB.

%Ex.7
%b) O valor "realmax" representa o maior número da vírgula flutuante 
%positivo que pode ser representado no sistema, enquanto o valor "realmin"
%representa o menor número da vírgula flutuante positiva que pode ser
%representado no sistema.

%Ex.8
%a)
mP10 = floor(log10(realmax));

%b)
k8 = 1;
while 10^(-k8) > 0
    k8 = k8 + 1;
end

maiorK8 = k8 - 1;

%Ex.9
%a)
k9 = 1;
while 1 + 2^(-k9) > 1
    k9 = k9 + 1;
end

maiorK9 = k9 - 1;

%b) A diferença entre eles é muito pequena.

%c,d) O "eps" é a menor diferença entre 1.0 e o próximo número da vírgula
%flutuante representável.

%Ex.10
x = 15;
x_fl = round (x);

majorante10 = abs(x - (x + eps(x_fl)));









