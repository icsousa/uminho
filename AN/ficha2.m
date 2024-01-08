format long

%Ex.1
%a)
xa = 1/3;
xpa = 0.3333;

eaa = abs(xa - xpa);
era = abs((xa - xpa) / xa);

%b)
xb = 10.375;
xpb = 10.373;

eab = abs(xb - xpb);
erb = abs((xb - xpb) / xb);

%c)
xc = 0.0000234;
xpc = 0.0000212;

eac = abs(xc - xpc);
erc = abs((xc - xpc) / xc);

%d)
xd = 0.721 * 10^(-6);
xpd = 0.724 * 10^(-6);

ead = abs(xd - xpd);
erd = abs((xd - xpd) / xd);

%Ex.2 - Para 1/6 seria 0.167 e 0.16667, para 1/11, 0.091 e 0.09091, para 
%pi/100, 0.031 e 0.03142, patra e^3, 2.72 e 2.7183 e por fim para ln(5)
%seria 1.61 e 1.6094.

%Ex.3
n52 = 2^52;
n53 = 2^53;

s52 = (1 + (1/n52))^n52;
s53 = (1 + (1/n53))^n53;

% Devido à precisão do MATLAB o valor da sucessão de termo geral Sn quando o
%n = 53 acaba por ser 1, o que nos indica que é o limite, ou seja, é e.

%Ex.5
x5 = 100;
k5 = 1;

while k5 < 11
    y5 = 10^(-k5);
    r5 = ((x5 + y5)^2 - x5^2 - 2 * x5 * y5) / y5^2;
    k5 = k5 + 1;
end

% Quando o valor de k chegou a 7, começou a existir erros nos resultados
% devido ao y ser um valor muito pequeno, pois y = 10^(-k).

%Ex.6
%b)
xf6 = pi * 10^(-8);
xg6 = pi * 10^(-9);

fx = (1 - cos(xf6) / sin(xf6));

gx = (sin(xg6) / 1 + cos(xg6));

%Ex.8
%a) 
delta = 0.001;
x81 = 1;
x82 = 100;
x83 = 1000;

rx1 = sqrt(x81);
rx2 = sqrt(x82);
rx3 = sqrt(x83);

rdx1 = sqrt(x81 + delta);
rdx2 = sqrt(x82 + delta);
rdx3 = sqrt(x83 + delta);

comp11 = x81 + delta;
comp12 = x82 + delta;
comp13 = x83 + delta;

% Enquanto que as somas de x + delta apresentavam sempre números diferentes
% de a.s., sqrt(x + delta) apresentavam sempre o mesmo número de a.s.

%Ex.9
%c)
x91 = 10;
f9x1 = sqrt(x91 + 1) - sqrt(x91);
g9x1 = (1 / sqrt(x91 + 1) + sqrt(x91));

x92 = 10^7;
f9x2 = sqrt(x92 + 1) - sqrt(x92);
g9x2 = (1 / sqrt(x92 + 1) + sqrt(x92));

x93 = 10^11;
f9x3 = sqrt(x93 + 1) - sqrt(x93);
g9x3 = (1 / sqrt(x93 + 1) + sqrt(x93));

x94 = 10^16;
f9x4 = sqrt(x94 + 1) - sqrt(x94);
g9x4 = (1 / sqrt(x94 + 1) + sqrt(x94));

% Esta discrepância existe devido à precisão do próprio MATLAB.

























