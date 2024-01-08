function r=metBisseccao(f,a,b,tol)

% METBISSECCAO Determina uma aproximação para um zero de uma função usando o método da bissecção.
%
% r=METBISSECCAO(f,a,b,tol) Determina uma aproximação para um zero de f no intervalo [a,b].
%
%      PARÂMETROS DE ENTRADA:
%          f: função da qual se pretende saber o zero
%          a: extremo esquerdo do intervalo inicial (onde está o zero de f)
%          b: extremo direito do intervalo inicial (onde está o zero de f)
%          tol: tolerância para o erro na aproximação. Por defeito
%               tol=1e-4.
%
%      PARÂMETROS DE SAÍDA:
%          r: aproximação para o zero de f
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  TOLERÂNCIA POR DEFEITO   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin<4, tol=1e-4; end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  VERIFICAÇÃO DOS PARÂMETROS DE ENTRADA  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if a>=b
    error('a deve ser menor que b!')
end
fa=f(a);
fb=f(b);
if fa*fb>=0 
    error('O intervalo inicial não foi uma escolha adequada!')
elseif length(tol)~=1 || tol<=0
    error('A tolerância para o erro deve ser um número real positivo!')
end

%%%%%%%%%%%%%%%%%%%%%%%%%
%  MÉTODO DA BISSECÇÃO  %
%%%%%%%%%%%%%%%%%%%%%%%%%

disp([' k ','       a_k    ', '     b_k    ',  '     x_k     ','    Erro    '])
disp('-----------------------------------------------------')
k=0;
erro=tol+1;
while erro>tol 
    r=(a+b)/2;
    erro=(b-a)/2;
    fprintf('%2.0f    %10.6f  %10.6f  %10.6f  %10.2e\n',k,a,b,r,erro)
    fr=f(r);
    if fa*fr<0
        b=r;
        fb=fr;
    elseif fa*fr>0
        a=r;
        fa=fr;      
    else 
        disp('Foi encontrada uma raiz para a equação!')
        return
    end
    k=k+1;
end