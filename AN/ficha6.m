%Ex.1
%a)
A1a = [1 2 3; 4 5 6];
b1a = [1;1];
x1a = A1a\b1a;

%b)
A1b = [3 1; 2 1; 1 0];
b1b = [5; 4; 1];
x1b = A1b\b1b;

%c)
A1c = [3 1; 2 1; 1 0];
b1c = [5; 4; 0];
x1c = A1c\b1c;

%d)
A1d = [3 1 2; 2 1 6; 5 2 8];
b1d = [5; 4; 1];
x1d = A1d\b1d;

%Ex.2 - functions/subDireta.m
%c)
A2c = tril(hilb(5));
b2c = ones(5,1);

r2c = subDireta(A2c, b2c);

%Ex.3 - functions/subInversa.m
%c)
A3c = triu(hilb(5));
b3c = ones(5,1);

r3c = subInversa(A3c, b3c);

%Ex.4 - functions/metGauss.m
%c)
A4c = rand(4);
b4c = ones(4,1);

r4c = metGauss(A4c,b4c);

%Ex.5
%a)
A5a = [2 4 1; 0.5 1 1.25; 2 3 4];
b5a = ones(3,1);

% r5a = metGauss(A5a,b5a); <- Ao realizar este código é nos dado um erro e
% diz-nos que "Foi encontrado um pivot nulo!".

%b)
valorAl = 1 + 2^(-52);
A5b = [2 4 1; 0.5 valorAl 1.25; 2 3 4];
b5b = ones(3,1);

r5b = metGauss(A5b,b5b);

%Ex.6 - functions/metGaussPP.m

%Ex.7
A7 = [2 2 -2 4; 1 5 7 -10; 0 1 5 3; -1 1 6 -5];

%a)
[L7, U7, P7] = lu(A7);

%b)
b7b = ones(4,1);
%Ly = b;
y7b = L7 \ (P7*b7b);
%Ux = y;
x7b = U7 \ y7b;

%Ex.8
A8 = [17 24 1 8; 23 5 7 14; 4 6 13 29; 10 12 19 21];
[L8, U8, P8] = lu(A8);
b8 = [16; 3; 44; 42];

y8 = L8 \ (P8*b8);
x8 = U8 \ y8;

%Ex.9
%a)
A9 = hilb(10);
x9 = ones(10,1);
b9 = A9 * x9;

%b)
xtil = A9 \ b9;

%Ex.10
%a)
e10 = 2 ^(-52); 
x10 = [10; 1];
A10 = [e10 1; 1 1];
L10 = [1 0; e10^(-1) 1];
U10 = [e10 1; 0 1-e10^-10]; 

y10 = U10 * x10;
b10 = L10 * y10;



