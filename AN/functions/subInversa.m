function b=subInversa(U,b)

% SUBINVERSA resolve um sistema triangular superior usando substitui��o inversa.
%
% b=SUBINVERSA(U,b) Determina, por substitui��o inversa, a solu��o de um 
%          sistema Ux=b, onde U  � uma matriz triangular superior.
%
%   PAR�METROS DE ENTRADA:
%    U: matriz quadrada, triangular superior, sem elementos diagonais nulos
%      (matriz do sistema)
%    b: vetor coluna (vetor dos termos independentes)
%                        
%   PAR�METRO DE SA�DA:
%    b: vetor solucao do sistema Ux=b (vetor b atualizado)

%------------------------------------------------------------------------
%     VERIFICA��O DOS PAR�METROS DE ENTRADA 
%------------------------------------------------------------------------
% Verifica se a matriz U � quadrada, triangular superior sem elementos 
% nulos na diagonal e se b tem a  dimens�o adequada.
[m,n]=size(U);
[mb,nb]=size(b);
if m~=n
    error('A matriz dada n�o � quadrada!')
elseif ( mb~=n || nb~=1 )
    error('O vetor b n�o tem a dimens�o adequada!')
elseif ~( all(diag(U)) )
    error('A matriz U tem um elemento nulo na diagonal!')
elseif ~( isequal(tril(U,-1),zeros(n,n)) )
    error('A matriz U n�o � triangular superior!')
end

%------------------------------------------------------------------------
%                     SUBSTITUI��O INVERSA
%------------------------------------------------------------------------
for i=n:-1:1
    j=i+1:n;
    b(i)=(b(i)-U(i,j)*b(j))/U(i,i);
end

end