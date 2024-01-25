function b=subInversa(U,b)

% SUBINVERSA resolve um sistema triangular superior usando substituição inversa.
%
% b=SUBINVERSA(U,b) Determina, por substituição inversa, a solução de um 
%          sistema Ux=b, onde U  é uma matriz triangular superior.
%
%   PARÂMETROS DE ENTRADA:
%    U: matriz quadrada, triangular superior, sem elementos diagonais nulos
%      (matriz do sistema)
%    b: vetor coluna (vetor dos termos independentes)
%                        
%   PARâMETRO DE SAÍDA:
%    b: vetor solucao do sistema Ux=b (vetor b atualizado)

%------------------------------------------------------------------------
%     VERIFICAÇÃO DOS PARÂMETROS DE ENTRADA 
%------------------------------------------------------------------------
% Verifica se a matriz U é quadrada, triangular superior sem elementos 
% nulos na diagonal e se b tem a  dimensão adequada.
[m,n]=size(U);
[mb,nb]=size(b);
if m~=n
    error('A matriz dada não é quadrada!')
elseif ( mb~=n || nb~=1 )
    error('O vetor b não tem a dimensão adequada!')
elseif ~( all(diag(U)) )
    error('A matriz U tem um elemento nulo na diagonal!')
elseif ~( isequal(tril(U,-1),zeros(n,n)) )
    error('A matriz U não é triangular superior!')
end

%------------------------------------------------------------------------
%                     SUBSTITUIÇÃO INVERSA
%------------------------------------------------------------------------
for i=n:-1:1
    j=i+1:n;
    b(i)=(b(i)-U(i,j)*b(j))/U(i,i);
end

end