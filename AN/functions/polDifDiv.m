function valpol=polDifDiv(x,y,z)

% POLDIFDIV  Cálculo do valor de um polinómio interpolador num conjunto de
%            pontos.
%
% VALPOL=POLDIFDIV(x,y,z) Calcula P(z), onde P é o polinómio interpolador
%      dos pontos (x_i,y_i). O polinómio P (de grau <= n, onde n=length(x)-1)
%      é calculado usando a forma de Newton com diferencas divididas.
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
% Esta função invoca a funcao TABDIFDIV

%------------------------------------------------------------------------
%             VERIFICAÇÕES DOS PARÂMETROS DE ENTRADA
%------------------------------------------------------------------------
% As verificações relativas a x e y são feitas quando invocarmos
% a função TABDIFDIV

% Uso da função TABDIFDIV para calcular as diferenças divididas
DD=tabDifDiv(x,y);
% Extrair a diagonal principal de DD 
% (que contém as diferenças divididas necessárias ao calculo de valpol)
dfdv=diag(DD);

%------------------------------------------------------------------------
%                      CÁLCULO DE valpol
%------------------------------------------------------------------------
n=length(dfdv)-1;
valpol=ones(size(z)); % Inicialização do vetor valpol
valpol(:)=dfdv(n+1);
for i=n:-1:1
    valpol=dfdv(i)+valpol.*(z-x(i)); % Uso da forma encaixada
end