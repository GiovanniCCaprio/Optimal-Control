%% EXERCICIO CONTROLE ÓTIMO

% Dados
A = [0 2;0 2];
B = [0; 1];
Q = [1; 0]*[1 0];
R = 1;
x0 =[1;1]; %posição inicial;
T = 10;

%dimensoes
n = size(A,1);
m = size(B,2);

% Resolução
Aa = [A -B*inv(R)*B'; -Q -A'];
Phi = expm(Aa*T);
Phi22 = Phi(3:4,3:4);
Phi21 = Phi(3:4,1:2);
dt = T/200;
t = 0:dt:T;
M = Phi(n+1:2*n, n+1:2*n)*Phi(n+1:2*n, 1:n);

for k = 1:length(t)
    G{k} = [zeros(m,n) -inv(R)*B']*expm(Aa*t(k))*[eye(n);-M];
    u(k) = G{k}*x0;
   % x{k} = expm*(Aa*t(k)*x0);
    
end

plot(t,u,'-b')

