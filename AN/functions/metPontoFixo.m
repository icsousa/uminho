function [r,erro,niter]=metPontoFixo(g,x0,tol,maxit,imp)

% METPONTOFIXO Calcula uma aproximação para o ponto fixo de uma função e
%              uma estimativa para o erro cometido.
%
% [r,erro,niter]=METPONTOFIXO(g,x0,tol,maxit,imp)
%       Calcula uma aproximação para um ponto fixo de g e uma estimativa
%       para o respetivo erro, usando o método do Ponto Fixo.
%       A estimativa para o erro é o valor absoluto da diferença das duas
%       últimas aproximações obtidas.
%       O processo iterativo pára quando a estimativa do erro for inferior
%       a tol ou quando for atingido o número máximo de iterações permitido,
%       maxit.
% 
%    PARÂMETROS DE ENTRADA:
%       g: uma função (função iterativa)
%       x0: um número real (aproximação inicial)
%       tol: real positivo (tolerância para o erro). Por defeito, tol=1e-6.
%       maxit: inteiro positivo (número máximo de iterações a efetuar).
%              Por defeito, maxit=30.
%       imp:  se for igual a zero, não são visualizados resultados intermédios.
%             Por defeito, imp=1, sendo, portanto, vista uma tabela de
%             resultados intermédios.
%
%    PARÂMETROS DE SAÍDA:
%       r: aproximação para o ponto fixo de g (g(r)=r).
%       erro: estimativa para o erro.
%       niter: número de iterações efetuadas.
%
% A função g deve ser especificada como uma função anónima ou através de
% uma function_handle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PARÂMETROS  POR DEFEITO   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (nargin<5), imp=1; end
if (nargin<4), maxit=30; end
if (nargin<3), tol=1e-6; end
if (nargin<2), error('Tem de introduzir a função iterativa e a aproximação inicial!'); end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   VERIFICAÇÂO DOS PARÂMETROS DE ENTRADA   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verificar se maxit é inteiro positivo e se tol é positivo
if (length(maxit)~=1) || (fix(maxit) ~= maxit) || (maxit < 1)
    error('O parâmetro maxit deve ser um inteiro positivo!'); 
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
    r=g(x0);           % Calcula a nova aproximação
    erro=abs(r-x0);    % Calcula uma estimativa para o erro
    niter=niter+1;     % Incrementa o contador de iterações
    
    % Impressão dos resultados intermédios
    if (~(imp==0))
    fprintf('%3.0f    %12.8g   %4.2e\n',niter,r,erro) 
    end
    
    x0=r;  % Armazena em x0 a última aproximação     
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MENSAGEM DE NÃO CONVERGÊNCIA   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if niter==maxit
        disp(' ')
        disp('Foi atingido o número máximo de iterações!')
end