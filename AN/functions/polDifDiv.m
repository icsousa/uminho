function valpol=polDifDiv(x,y,z)

% POLDIFDIV  C�lculo do valor de um polin�mio interpolador num conjunto de
%            pontos.
%
% VALPOL=POLDIFDIV(x,y,z) Calcula P(z), onde P � o polin�mio interpolador
%      dos pontos (x_i,y_i). O polin�mio P (de grau <= n, onde n=length(x)-1)
%      � calculado usando a forma de Newton com diferencas divididas.
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
% Esta fun��o invoca a funcao TABDIFDIV

%------------------------------------------------------------------------
%             VERIFICA��ES DOS PAR�METROS DE ENTRADA
%------------------------------------------------------------------------
% As verifica��es relativas a x e y s�o feitas quando invocarmos
% a fun��o TABDIFDIV

% Uso da fun��o TABDIFDIV para calcular as diferen�as divididas
DD=tabDifDiv(x,y);
% Extrair a diagonal principal de DD 
% (que cont�m as diferen�as divididas necess�rias ao calculo de valpol)
dfdv=diag(DD);

%------------------------------------------------------------------------
%                      C�LCULO DE valpol
%------------------------------------------------------------------------
n=length(dfdv)-1;
valpol=ones(size(z)); % Inicializa��o do vetor valpol
valpol(:)=dfdv(n+1);
for i=n:-1:1
    valpol=dfdv(i)+valpol.*(z-x(i)); % Uso da forma encaixada
end