function [r,erro,niter]=metNewtonRaphson(f,fder,x0,tol,maxit,imp)

% METNEWTONRAPHSON Calcula uma aproximação para um zero de uma função e
%           uma estimativa para o erro cometido, usando o método de Newton-Raphson.
%
% [r,erro,niter]=METNEWTONRAPHSON(f,fder,x0,tol,maxit,imp)
%       Calcula uma aproximação para um zero de f e uma estimativa
%       para o respetivo erro, usando o método de Newton-Raphson.
%       A estimativa para o erro é o valor absoluto da diferença das duas
%       últimas aproximações obtidas.
%       O processo iterativo pára quando a estimativa do erro for inferior
%       a tol ou quando for atingido o número máximo de iterações permitido
%       (maxit).
% 
%    PARÂMETROS DE ENTRADA:
%       f: uma função (cujo zero se pretende aproximar)
%       fder: uma função (derivada da função f)
%       x0: um número real (aproximação inicial)
%       tol: real positivo (tolerância para o erro). Por defeito, tol=1e-6.
%       maxit: inteiro positivo (número máximo de iterações a efetuar).
%              Por defeito, maxit=30.
%       imp:  se for igual a zero, não são visualizados resultados intermédios.
%             Por defeito, imp=1, sendo, portanto, vista uma tabela de
%             resultados intermédios.
%
%    PARÂMETROS DE SAÍDA:
%       r: aproximação para um zero de f
%       erro: estimativa para o erro
%       niter: número de iterações efetuadas
%
% As funções f e fder devem ser especificadas como funções anónimas ou 
% através de function_handle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PARÂMETROS  POR DEFEITO   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (nargin<6), imp=1; end
if (nargin<5), maxit=30; end
if (nargin<4), tol=1e-6; end
if (nargin<3), error('Tem de introduzir a função, a sua derivada e uma aproximação inicial!'); end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   VERIFICAÇÂO DOS PARÂMETROS DE ENTRADA   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verificar se maxit é inteiro positivo e se tol é positivo
if (length(maxit)~=1) || (fix(maxit) ~= maxit) || (maxit < 1)
    error('maxit deve ser um inteiro positivo!'); 
elseif (length(tol)~=1) || (tol<=0)
    error('A tolerância para o erro deve ser um número real positivo!')
end
if (~(imp==0))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   CABEÇALHO PARA TABELA DE RESULTADOS   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(['  k ','     Aproximação   ','  Erro '])
disp('_________________________________________')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PROCESSO ITERATIVO   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%
niter=0;               % Inicializa o contador de iterações
erro=tol+1;            % Inicializa o erro inicial (superior à tolerância)
while ( erro>tol && niter < maxit )
    f0=f(x0);
    fder0=fder(x0);
    r=x0-f0/fder0;     % Calcula a nova aproximação
    erro=abs(r-x0);    % Calcula uma estimativa para o erro
    niter=niter+1;     % Incrementa o contador de iterações
    
    % Impressão dos resultados intermédios
    if (~(imp==0))
    fprintf('%3.0f    %12.8g   %4.2e\n',niter,r,erro) 
    end
    
    x0=r;     % Armazena em x0 a última aproximação     
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MENSAGEM DE NÃO CONVERGÊNCIA   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if niter==maxit
        disp(' ')
        disp('Foi atingido o número máximo de iterações!')
end