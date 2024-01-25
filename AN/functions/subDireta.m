function b=subDireta(L,b)

% SUBDIRETA resolve um sistema triangular inferior usando substitui��o direta
%
% x=SUBDIRETA(L,b)   Determina, por substitui��o direta, a solu��o de um 
%         sistema Lx=b, onde L � uma matriz triangular inferior.
%
%  PAR�METROS DE ENTRADA:
%     L: matriz quadrada, triangular inferior, sem elementos
%        nulos na diagonal (matriz do sistema)
%     b: vetor coluna (vetor dos termos independentes)
% 
%  PAR�METRO DE SA�DA:
%     b: vetor solucao do sistema Lx=b (vetor b atualizado)

%------------------------------------------------------------------------
%      VERIFICA��O DOS PAR�METROS DE ENTRADA
%------------------------------------------------------------------------
% Verifica se a matriz L � quadrada, triangular inferior sem elementos
% nulos na diagonal e se b tem a dimens�o adequada.
[m,n]=size(L);
[mb,nb]=size(b);
if m~=n
    error('A matriz dada n�o � quadrada!')
elseif ( mb~=n || nb~=1 )
    error('O vetor b n�o tem a dimens�o adequada!')
elseif  ~( all(diag(L)) )
    error('A matriz L tem um elemento nulo na diagonal!')
elseif ~( isequal(triu(L,1),zeros(n,n)) )
    error('A matriz L n�o � triangular inferior!')
end


%------------------------------------------------------------------------
%                     SUBSTITUI��O DIRETA
%------------------------------------------------------------------------
for i=1:n
    j=1:i-1;
    b(i)=(b(i)-L(i,j)*b(j))/L(i,i);
end

end