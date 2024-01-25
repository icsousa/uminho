function b=metGaussPP(A,b)

% METGAUSSPP Resolução de um sistema de equações lineares
%            pelo Método de Gauss com Escolha Parcial de Pivot.
%            Faz uso da função SUBINVERSA.
%
% b=METGAUSSPP(A,b) Determina a solução de um sistema Ax=b,
%                   usando eliminação Gaussiana com escolha 
%                   parcial de pivot na redução do sistema Ax=b 
%                   à forma triangular superior, seguida de 
%                   substituição inversa na resolução
%                   do sistema triangular superior.
%                   Usa a função SUBINVERSA.
%
%    PARÂMETROS DE ENTRADA:
%           A: matriz quadrada de ordem n (matriz do sistema)
%           b: vetor coluna com n componentes (vetor dos termos independentes)
%                        
%    PARÂMETRO DE SAÍDA:
%           b: vetor solução do sistema Ax=b (vetor b atualizado)

%------------------------------------------------------------------------
%  VERIFICAÇÂO DOS PARÂMETROS DE ENTRADA 
%------------------------------------------------------------------------
% Verificar se a matriz A é quadrada e se b tem a dimensão adequada
[m,n]=size(A);
[mb,nb]=size(b);
if m~=n
    error('A matriz A introduzida não é quadrada!')
elseif mb~=n || nb~=1
    error('O vetor b introduzido não tem a dimensão adequada!')
end

%------------------------------------------------------------------------
%  ELIMINAÇÃO DE GAUSS
%------------------------------------------------------------------------
for k=1:n-1  % Contador de passo
    %---------------------------------------------------------------------
    %  ESCOLHA PARCIAL DE PIVOT
    %---------------------------------------------------------------------
     [mx,r]=max(abs(A(k:n,k))); % determina o elemento de maior módulo das 
                                % posições k a n da coluna k 
                                % e a sua respetiva posição
                                                       
     l=r+k-1; % É necessário acrescentar k-1 a r porque o elemento desse 
              % vetor na posição 1, por exemplo, está na linha k, etc.
              
     if l~=k                     
     A([k l],:)=A([l k],:); % troca das linhas k e l da matriz A

     b([k l])=b([l k]); % troca das linhas k e l do vetor b
     end

     if A(k,k)==0 % Se todos os elementos da coluna k abaixo da posicao k-1 
                  % forem nulos, a matriz A é singular!
                  error('A matriz do sistema é singular!')
     end
     
     %---------------------------------------------------------------------
     %  ELIMINAÇÃO
     %---------------------------------------------------------------------
     A(k+1:n,k)=A(k+1:n,k)/A(k,k); % cálculo dos multiplicadores para as linhas k+1 a n
     A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
     b(k+1:n)=b(k+1:n)-A(k+1:n,k)*b(k);
     
end
if A(n,n)==0
    error('A matriz do sistema é singular!')
end

%------------------------------------------------------------------------
% SUBSTITUIÇÃO INVERSA
%------------------------------------------------------------------------
A=triu(A); % Para poder usar a função SUBINVERSA que só trabalha com matrizes triangulares superiores
b=subInversa(A,b);