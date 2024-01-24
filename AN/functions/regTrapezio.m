function integral=regTrapezio(f,a,b,n)

% REGTRAPEZIO  Calcula uma aproximação para um integral definido de uma 
%              dada função usando a regra do trapézio composta.
%
% integral=REGTRAPEZIO(f,a,b,n)
%   Determina uma aproximação para o valor do integral entre a e b de uma 
%   dada função f, usando a regra do trapézio composta com n subintervalos.
%
%   PARÂMETROS DE ENTRADA:
%     f: função integranda;
%     a,b: reais (com a<b) correspondentes aos extremos do intervalo de
%          integração;
%     n: número inteiro positivo correspondente ao número de subintervalos.
%
%   PARÂMETRO DE SAÍDA:
%     integral: aproximação para o integral calculada usando a regra do
%               trapézio composta com N subintervalos.
%
%  A funcao f deve ser 'vetorizada, i.e, deve usar-se os
%  operadores pontuais  .*, ./ e .^ na sua definição e deve ser
%  especificada como uma função anónima.
%

%------------------------------------------------------------------------
%             VERIFICAÇÂO DOS PARÂMETROS DE ENTRADA
%------------------------------------------------------------------------
% Verificar se n é inteiro e se a<b
if (length(n)~=1) || (fix(n) ~= n) || (n < 1)
    error('n deve ser um número inteiro positivo!');
elseif (a>=b)
    error('a deve ser menor que b!')
end

%------------------------------------------------------------------------
%          DETERMINAÇÂO DE h E CONSTRUÇÃO DO VETOR DOS NÓS
%------------------------------------------------------------------------
h=(b-a)/n;
nos=a:h:b;

%------------------------------------------------------------------------
%                 REGRA DO TRAPÉZIO COMPOSTA
%------------------------------------------------------------------------
fnos=f(nos);  %Vetor dos valores da função integranda nos nós
integral=(h/2)*(fnos(1)+2*sum(fnos(2:end-1))+fnos(end));
