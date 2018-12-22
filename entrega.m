%% EXERCICIO CONTROLE �TIMO - Giovanni Chemello Caprio
clc, clear all, close all

% Dados
A = [0 2;0 2];
B = [0; 1];
Q = [1 0;0 0];
R = 1;
T = 10;

%dimensoes
n = size(A,1);
m = size(B,2);

% Resolu��o
dt = T/1000;
t = 0:dt:T;
N = length(t)+1;
P{N+1} = zeros(n); % P(T)= 0
W{N+1} = zeros(n); % P(T)= 0

% 1 Solu��o
for k = N:-1:1
    Anovo = (-1/2)*eye(2)+dt*A; 
    Rnovo = R/dt;
    Qnovo = dt*Q + P{k+1};
    
    [P{k},L,G] = care(Anovo,B,Qnovo,Rnovo);  %G = autovalores , L = autovalores
   
end

% 2 Solu��o
for k = N:-1:1
    W{k} = W{k+1} + dt*(A'*W{k+1} + W{k+1}*A - W{k+1}*B*inv(R)*B'*W{k+1} + Q);
   
end

% Primeiro elemento (1,1) de cada solu��o
for i=1:N-1
   p(i) = P{i}(1,1); 
   w(i) = W{i}(1,1); 
end

% Plot do primeiro elemento
plot(t,p,'--',t,w,'k') 
xlabel('t')
ylabel('P(t)')
legend('1� Solu��o','2� Solu��o')