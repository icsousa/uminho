function b=metGaussPP(A,b)

% METGAUSSPP Resolu��o de um sistema de equa��es lineares
%            pelo M�todo de Gauss com Escolha Parcial de Pivot.
%            Faz uso da fun��o SUBINVERSA.
%
% b=METGAUSSPP(A,b) Determina a solu��o de um sistema Ax=b,
%                   usando elimina��o Gaussiana com escolha 
%                   parcial de pivot na redu��o do sistema Ax=b 
%                   � forma triangular superior, seguida de 
%                   substitui��o inversa na resolu��o
%                   do sistema triangular superior.
%                   Usa a fun��o SUBINVERSA.
%
%    PAR�METROS DE ENTRADA:
%           A: matriz quadrada de ordem n (matriz do sistema)
%           b: vetor coluna com n componentes (vetor dos termos independentes)
%                        
%    PAR�METRO DE SA�DA:
%           b: vetor solu��o do sistema Ax=b (vetor b atualizado)

%------------------------------------------------------------------------
%  VERIFICA��O DOS PAR�METROS DE ENTRADA 
%------------------------------------------------------------------------
% Verificar se a matriz A � quadrada e se b tem a dimens�o adequada
[m,n]=size(A);
[mb,nb]=size(b);
if m~=n
    error('A matriz A introduzida n�o � quadrada!')
elseif mb~=n || nb~=1
    error('O vetor b introduzido n�o tem a dimens�o adequada!')
end

%------------------------------------------------------------------------
%  ELIMINA��O DE GAUSS
%------------------------------------------------------------------------
for k=1:n-1  % Contador de passo
    %---------------------------------------------------------------------
    %  ESCOLHA PARCIAL DE PIVOT
    %---------------------------------------------------------------------
     [mx,r]=max(abs(A(k:n,k))); % determina o elemento de maior m�dulo das 
                                % posi��es k a n da coluna k 
                                % e a sua respetiva posi��o
                                                       
     l=r+k-1; % � necess�rio acrescentar k-1 a r porque o elemento desse 
              % vetor na posi��o 1, por exemplo, est� na linha k, etc.
              
     if l~=k                     
     A([k l],:)=A([l k],:); % troca das linhas k e l da matriz A

     b([k l])=b([l k]); % troca das linhas k e l do vetor b
     end

     if A(k,k)==0 % Se todos os elementos da coluna k abaixo da posicao k-1 
                  % forem nulos, a matriz A � singular!
                  error('A matriz do sistema � singular!')
     end
     
     %---------------------------------------------------------------------
     %  ELIMINA��O
     %---------------------------------------------------------------------
     A(k+1:n,k)=A(k+1:n,k)/A(k,k); % c�lculo dos multiplicadores para as linhas k+1 a n
     A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
     b(k+1:n)=b(k+1:n)-A(k+1:n,k)*b(k);
     
end
if A(n,n)==0
    error('A matriz do sistema � singular!')
end

%------------------------------------------------------------------------
% SUBSTITUI��O INVERSA
%------------------------------------------------------------------------
A=triu(A); % Para poder usar a fun��o SUBINVERSA que s� trabalha com matrizes triangulares superiores
b=subInversa(A,b);