function b=subDireta(L,b)

% SUBDIRETA resolve um sistema triangular inferior usando substituição direta
%
% x=SUBDIRETA(L,b)   Determina, por substituição direta, a solução de um 
%         sistema Lx=b, onde L é uma matriz triangular inferior.
%
%  PARÂMETROS DE ENTRADA:
%     L: matriz quadrada, triangular inferior, sem elementos
%        nulos na diagonal (matriz do sistema)
%     b: vetor coluna (vetor dos termos independentes)
% 
%  PARÂMETRO DE SAÍDA:
%     b: vetor solucao do sistema Lx=b (vetor b atualizado)

%------------------------------------------------------------------------
%      VERIFICAÇÃO DOS PARÂMETROS DE ENTRADA
%------------------------------------------------------------------------
% Verifica se a matriz L é quadrada, triangular inferior sem elementos
% nulos na diagonal e se b tem a dimensão adequada.
[m,n]=size(L);
[mb,nb]=size(b);
if m~=n
    error('A matriz dada não é quadrada!')
elseif ( mb~=n || nb~=1 )
    error('O vetor b não tem a dimensão adequada!')
elseif  ~( all(diag(L)) )
    error('A matriz L tem um elemento nulo na diagonal!')
elseif ~( isequal(triu(L,1),zeros(n,n)) )
    error('A matriz L não é triangular inferior!')
end


%------------------------------------------------------------------------
%                     SUBSTITUIÇÃO DIRETA
%------------------------------------------------------------------------
for i=1:n
    j=1:i-1;
    b(i)=(b(i)-L(i,j)*b(j))/L(i,i);
end

end