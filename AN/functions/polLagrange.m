function valpol=polLagrange(x,y,z)

% POLLAGRANGE  Cálculo do valor de um polinómio interpolador num conjunto de
%            pontos.
%
% VALPOL=POLLAGRANGE(x,y,z) Calcula P(z), onde P é o polinómio interpolador
%      dos pontos (x_i,y_i). O polinómio P (de grau <= n, onde n=length(x)-1)
%      é calculado usando a forma de Lagrange.
%
% PARÂMETROS DE ENTRADA:
%      x: vetor de n+1 componentes distintas (nós de interpolação);
%      y: vetor com a mesma dimensão que x (valores nodais);
%      z: vetor de m componentes com os pontos onde se pretende calcular
%         os valores do polinómio interpolador.
%
% PARÂMETRO DE SAÍDA:
%      valpol: valpol=(P(z_1),...,P(z_m)), onde P é o polinómio de grau 
%              <=n interpolador dos pontos (x_i,y_i).
%

%--------------------------------------------------------------------------
%             VERIFICAÇÕES SOBRE PARÂMETROS DE ENTRADA
%--------------------------------------------------------------------------
% Verifica se x e y são vetores da mesma dimensão e se os elementos
% de x são distintos
n=length(x)-1;
if length(y) ~= n+1
   error('Os vetores x e y devem ter a mesma dimensão!') 
elseif ~all(diff(sort(x)))
   error('As abcissas devem ser distintas!');
end

%------------------------------------------------------------------------
%                      CÁLCULO DE valpol
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