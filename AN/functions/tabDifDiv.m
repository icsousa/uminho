function DD=tabDifDiv(x,y)

% TABDIFDIV Constroi uma tabela de diferen�as divididas.
%
% DD=TABDIFDIV(x,y) Constroi uma matriz DD cujas colunas s�o
%   as diferen�as divididas relativas a uma tabela de pontos (x_i,y_i).
%
%   PAR�METROS DE ENTRADA:
%      x: vetor de n+1 componentes distintas (n�s);
%      y: vetor da mesma dimens�o que x (valores nodais);
%
%   PAR�METRO DE SA�DA:
%      DD: matriz quadrada (n+1)x(n+1) tendo, na coluna k,  as diferen�as divididas
%          de ordem k-1 relativas aos pontos (x_i,y_i).
%          Na coluna k, como h� apenas n-k+2 diferen�as divididas,
%          os elementos acima da posi��o k s�o definidos como zero.

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

%--------------------------------------------------------------------------
% Escreve x e y como vetores coluna
x=x(:);
y=y(:);

%--------------------------------------------------------------------------
%             CONSTRU��O DA MATRIZ DD DAS DIFEREN�AS DIVIDIDAS
%--------------------------------------------------------------------------
DD=zeros(n+1); % Inicializa a matriz DD com zeros
DD(:,1)=y;   % Torna a primeira coluna de DD igual ao vetor y
% C�lculo recursivo das diferen�as divididas e armazenamento nas colunas de DD
for k=2:n+1
    i=k:n+1;
    DD(i,k)=(DD(i-1,k-1)-DD(i,k-1))./(x(i-k+1)-x(i));
end