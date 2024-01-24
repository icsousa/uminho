function integral=regSimpson(f,a,b,n)

% REGSIMPSON  Calcula uma aproximação para um integral definido de uma dada
%             função usando a regra de Simpson composta.
%
% integral=REGSIMPSON(f,a,b,n)
%   Determina uma aproximação para o valor do integral entre a e b da
%   função f, usando a regra de Simpson composta com n subintervalos.
%
%   PARÂMETROS DE ENTRADA:
%     f: função integranda;
%     a,b: reais (com a<b) correspondentes aos extremos do intervalo de
%          integração;
%     n: número par correspondente ao número de subintervalos.
%
%   PARÂMETRO DE SAIDA:
%     integral: aproximação para o integral calculada usando a regra de
%               Simpson composta com n subintervalos.
%
%  A funcao f deve ser 'vetorizada', i.e, deve usar-se os
%  operadores pontuais  .*, ./ e .^ na sua definição e deve ser
%  especificada como uma função anónima.

%------------------------------------------------------------------------
%             VERIFICAÇÂO DOS PARÂMETROS DE ENTRADA
%------------------------------------------------------------------------
% Verificar se n é inteiro e par e se a<b
if (length(n)~=1) || (fix(n) ~= n) || (n < 1)
    error('n deve ser um número inteiro positivo!');
elseif rem(n,2)~=0
    error('n deve ser um número par!')
elseif (a>=b)
    error('a deve ser menor que b')
end

%------------------------------------------------------------------------
%          DETERMINAÇÃO DE h E CONSTRUÇÂO DO VETOR DOS NÓS
%------------------------------------------------------------------------
h=(b-a)/n;
nos=a:h:b;

%------------------------------------------------------------------------
%                 REGRA DE SIMPSON COMPOSTA
%------------------------------------------------------------------------
fnos=f(nos);          % Vetor dos valores da função dada nos nós
fnosPares=fnos(2:2:end-1);      % Nos pares
fnosImpares=fnos(3:2:end-2);  % Nos ímpares
integral=(h/3)*(fnos(1)+4*sum(fnosPares)+2*sum(fnosImpares)+fnos(end));