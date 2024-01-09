format long

%Ex.1
%a)
p3 = @(x) x^3 - 3.1 * x^2 + 2.3 * x - 0.3;
yp3 = [p3(-0.5), p3(-1), p3(0), p3(3)];

%b)
fplot(p3,[-1,4]);
hold on, plot([-0.5, -1, 0, 3],[-2.35, -6.7, -0.3, 5.7], 'o');

%Ex.2
%a)
x2 = [-0.5, -1, 0, 3];
V2 = vander(x2);

det(V2);
prod = 1;

for i = 1:4
    for j = i + 1:4
        prod = prod * (x2(i) - x2(j));
    end
end

%b)
y2 = [-2.35, -6.7, -0.3, 5.7];

z2 = V2/y2;

%Ex.4 
%a) functions/polLagrange.m

%c)
n = 1;
x4 = rand(1, n);
y4 = rand(1, n);
m = 3;
z4 = rand(1, m);

valpol = polLagrange(x4,y4,z4);

%Ex.7
%a) functions/tabDifDiv.m

%b)
x7 = [0, 0.2, 0.4, 0.5, 0.6];
y7 = cos(x7);

ex7 = tabDifDiv (x7, y7);

%Ex.8
%a)
f8 = @(x) sin(x);
x8 = [0.2, 0.4, 0.5, 0.55, 0.6, 0.63 , 0.67];
y8 = f8(x8);

tab8 = tabDifDiv(x8,y8);

%b)
r8 = polDifDiv(x8, y8, sin(0.32));

%Ex.9 - functions/polDifDiv.m

%Ex.10
%a)
f10 = @(x) exp(x);
x10 = [-1.5, 0, 1, 1.6, 2.1];
y10 = f10(x10);
z10 = [-2, 0.1, 1.65, 2.3, 4];

p104 = polDifDiv(x10, y10, z10);

%b)
fplot(f10, [-2,4]);
hold on, plot(p104, '+');

%Ex.11
%a)
x11 = [0.2, 0.25, 0.4, 0.55, 0.6, 0.7];
y11 = [0.3624, 0.3153, 0.1700, 0.0208, -0,0292, -0.1288];

tab11 = tabDifDiv(x11, y11);

%b)
p11 = polDifDiv(x11, y11, 0.3);

%c)
plot(p11, '.');
plot(x11, y11, '|');





 





