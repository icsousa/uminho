function integral=regTrapezio(f,a,b,n)

% REGTRAPEZIO  Calcula uma aproxima��o para um integral definido de uma 
%              dada fun��o usando a regra do trap�zio composta.
%
% integral=REGTRAPEZIO(f,a,b,n)
%   Determina uma aproxima��o para o valor do integral entre a e b de uma 
%   dada fun��o f, usando a regra do trap�zio composta com n subintervalos.
%
%   PAR�METROS DE ENTRADA:
%     f: fun��o integranda;
%     a,b: reais (com a<b) correspondentes aos extremos do intervalo de
%          integra��o;
%     n: n�mero inteiro positivo correspondente ao n�mero de subintervalos.
%
%   PAR�METRO DE SA�DA:
%     integral: aproxima��o para o integral calculada usando a regra do
%               trap�zio composta com N subintervalos.
%
%  A funcao f deve ser 'vetorizada, i.e, deve usar-se os
%  operadores pontuais  .*, ./ e .^ na sua defini��o e deve ser
%  especificada como uma fun��o an�nima.
%

%------------------------------------------------------------------------
%             VERIFICA��O DOS PAR�METROS DE ENTRADA
%------------------------------------------------------------------------
% Verificar se n � inteiro e se a<b
if (length(n)~=1) || (fix(n) ~= n) || (n < 1)
    error('n deve ser um n�mero inteiro positivo!');
elseif (a>=b)
    error('a deve ser menor que b!')
end

%------------------------------------------------------------------------
%          DETERMINA��O DE h E CONSTRU��O DO VETOR DOS N�S
%------------------------------------------------------------------------
h=(b-a)/n;
nos=a:h:b;

%------------------------------------------------------------------------
%                 REGRA DO TRAP�ZIO COMPOSTA
%------------------------------------------------------------------------
fnos=f(nos);  %Vetor dos valores da fun��o integranda nos n�s
integral=(h/2)*(fnos(1)+2*sum(fnos(2:end-1))+fnos(end));
