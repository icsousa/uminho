function b=metGauss(A,b)

% METGAUSS Resolução de um sistema de equações lineares pelo Método de Gauss.
%          Faz uso da função SUBINVERSA.
%
% b=METGAUSS(A,b) Determina a solução de um sistema Ax=b,
%                 usando eliminação Gaussiana na redução do sistema Ax=b 
%                 à forma triangular superior, seguida de 
%                 substituição inversa na resolução
%                 do sistema triangular superior.
%                 Usa a função SUBINVERSA.
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
     if A(k,k)==0
         error('Foi encontrado um pivot nulo!')
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