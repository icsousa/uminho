function integral=regSimpson(f,a,b,n)

% REGSIMPSON  Calcula uma aproxima��o para um integral definido de uma dada
%             fun��o usando a regra de Simpson composta.
%
% integral=REGSIMPSON(f,a,b,n)
%   Determina uma aproxima��o para o valor do integral entre a e b da
%   fun��o f, usando a regra de Simpson composta com n subintervalos.
%
%   PAR�METROS DE ENTRADA:
%     f: fun��o integranda;
%     a,b: reais (com a<b) correspondentes aos extremos do intervalo de
%          integra��o;
%     n: n�mero par correspondente ao n�mero de subintervalos.
%
%   PAR�METRO DE SAIDA:
%     integral: aproxima��o para o integral calculada usando a regra de
%               Simpson composta com n subintervalos.
%
%  A funcao f deve ser 'vetorizada', i.e, deve usar-se os
%  operadores pontuais  .*, ./ e .^ na sua defini��o e deve ser
%  especificada como uma fun��o an�nima.

%------------------------------------------------------------------------
%             VERIFICA��O DOS PAR�METROS DE ENTRADA
%------------------------------------------------------------------------
% Verificar se n � inteiro e par e se a<b
if (length(n)~=1) || (fix(n) ~= n) || (n < 1)
    error('n deve ser um n�mero inteiro positivo!');
elseif rem(n,2)~=0
    error('n deve ser um n�mero par!')
elseif (a>=b)
    error('a deve ser menor que b')
end

%------------------------------------------------------------------------
%          DETERMINA��O DE h E CONSTRU��O DO VETOR DOS N�S
%------------------------------------------------------------------------
h=(b-a)/n;
nos=a:h:b;

%------------------------------------------------------------------------
%                 REGRA DE SIMPSON COMPOSTA
%------------------------------------------------------------------------
fnos=f(nos);          % Vetor dos valores da fun��o dada nos n�s
fnosPares=fnos(2:2:end-1);      % Nos pares
fnosImpares=fnos(3:2:end-2);  % Nos �mpares
integral=(h/3)*(fnos(1)+4*sum(fnosPares)+2*sum(fnosImpares)+fnos(end));