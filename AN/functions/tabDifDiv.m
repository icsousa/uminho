function DD=tabDifDiv(x,y)

% TABDIFDIV Constroi uma tabela de diferenças divididas.
%
% DD=TABDIFDIV(x,y) Constroi uma matriz DD cujas colunas são
%   as diferenças divididas relativas a uma tabela de pontos (x_i,y_i).
%
%   PARÂMETROS DE ENTRADA:
%      x: vetor de n+1 componentes distintas (nós);
%      y: vetor da mesma dimensão que x (valores nodais);
%
%   PARÂMETRO DE SAÍDA:
%      DD: matriz quadrada (n+1)x(n+1) tendo, na coluna k,  as diferenças divididas
%          de ordem k-1 relativas aos pontos (x_i,y_i).
%          Na coluna k, como há apenas n-k+2 diferenças divididas,
%          os elementos acima da posição k são definidos como zero.

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

%--------------------------------------------------------------------------
% Escreve x e y como vetores coluna
x=x(:);
y=y(:);

%--------------------------------------------------------------------------
%             CONSTRUÇÃO DA MATRIZ DD DAS DIFERENÇAS DIVIDIDAS
%--------------------------------------------------------------------------
DD=zeros(n+1); % Inicializa a matriz DD com zeros
DD(:,1)=y;   % Torna a primeira coluna de DD igual ao vetor y
% Cálculo recursivo das diferenças divididas e armazenamento nas colunas de DD
for k=2:n+1
    i=k:n+1;
    DD(i,k)=(DD(i-1,k-1)-DD(i,k-1))./(x(i-k+1)-x(i));
end