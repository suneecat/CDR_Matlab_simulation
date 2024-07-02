% make a bode plot of 3rd order transfer function; for PLL with Hogge Phase
% Detector and charge pump
close all;  % close all open figures
clear all;
% 
% input parameters
% e.g Ip=560e-6; Kvco=32.4e6; R2=470; C2=33.0e-9; C1=2.2e-9;
%     Ip=560e-6; Kvco=32.4e6; R2=100; C2=33.0e-9; C1=2.2e-9;
% adjust values in line below as required, Kvco in Hz/V, Ich in A, then
% the 2*pi factor in Kvco*2*pi and Ich/(2*pi) cancels out

Ich=560e-6; Kvco=32.4e6; R2=100; C2=33.0e-9; C1=2.2e-9;
%Kpd=Ich/(2*pi);
Kpd=Ich;
KK=Kvco*Kpd;
% closed loop TF
s=sprintf('Closed loop Hogge PLL TF with Kvco=%8.2e Kpd=%8.2e R2=%8.2e C2=%8.2e C1=%8.2e', Kvco,Kpd, R2, C2, C1);
num1=KK*R2*C2;
num0=KK;
den3 =R2*C2*C1;
den2=C1+C2;
den1=KK*R2*C2;
den0=num0;
num = [num1 num0];
den = [den3 den2 den1 den0];
tf(num, den);
h = tf(num,den);
Wmin=100;
Wmax=1.0e9;
bode(h,{Wmin, Wmax});
%bode(h);
Ich=Kpd*2*pi;
w0 = sqrt(KK/C2);       %approximation
zeta = (w0/2)*(R2*C2);  %approximation
s2=sprintf('Ich = %8.2e, Wo = %8.2e,  Zeta = %8.2e', Ich, w0, zeta);
%title({s;s2},'FontSize',8);
title(s);
fprintf('Ich = %8.2e, Wo = %8.2e,  Zeta = %8.2e,  KK= %8.2e\n', Ich, w0, zeta, KK);
text(1.0e4, -10, s2);

% open lop TF
figure(2);
so=sprintf('Open loop Hogge PLL TF with Kvco=%8.2e Kpd=%8.2e R2=%8.2e C2=%8.2e C1=%8.2e', Kvco,Kpd, R2, C2, C1);
num1=KK*R2*C2;
num0=KK;
den3=R2*C2*C1;
den2=C1+C2;
den1=0;
den0=0;
num = [num1 num0];
den = [den3 den2 den1 den0];
tf(num, den);
h = tf(num,den);
Wmin=100;
Wmax=1.0e9;
bode(h,{Wmin, Wmax});
%bode(h);
title(so);
figure(3);
margin(h);
