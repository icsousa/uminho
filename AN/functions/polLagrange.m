function valpol=polLagrange(x,y,z)

% POLLAGRANGE  C�lculo do valor de um polin�mio interpolador num conjunto de
%            pontos.
%
% VALPOL=POLLAGRANGE(x,y,z) Calcula P(z), onde P � o polin�mio interpolador
%      dos pontos (x_i,y_i). O polin�mio P (de grau <= n, onde n=length(x)-1)
%      � calculado usando a forma de Lagrange.
%
% PAR�METROS DE ENTRADA:
%      x: vetor de n+1 componentes distintas (n�s de interpola��o);
%      y: vetor com a mesma dimens�o que x (valores nodais);
%      z: vetor de m componentes com os pontos onde se pretende calcular
%         os valores do polin�mio interpolador.
%
% PAR�METRO DE SA�DA:
%      valpol: valpol=(P(z_1),...,P(z_m)), onde P � o polin�mio de grau 
%              <=n interpolador dos pontos (x_i,y_i).
%

%--------------------------------------------------------------------------
%             VERIFICA��ES SOBRE PAR�METROS DE ENTRADA
%--------------------------------------------------------------------------
% Verifica se x e y s�o vetores da mesma dimens�o e se os elementos
% de x s�o distintos
n=length(x)-1;
if length(y) ~= n+1
   error('Os vetores x e y devem ter a mesma dimens�o!') 
elseif ~all(diff(sort(x)))
   error('As abcissas devem ser distintas!');
end

%------------------------------------------------------------------------
%                      C�LCULO DE valpol
%------------------------------------------------------------------------
valpol=0;
for i=0:n
    num=1;den=1;
    for j=0:n
        if j~=i
            num=num.*(z-x(j+1));
            den=den.*(x(i+1)-x(j+1));
        end
    end
    valpol=valpol+y(i+1).*(num./den);
end