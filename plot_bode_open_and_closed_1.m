% make a bode plot of a transfer function
close all;  % close all open figures
clear all;
% adjust values in line below as required
Kvco=5.0e7; Kpd=0.001; R2=100; C2=1.0e-9; R1=10000;
Tp=(R1+R2)*C2;
Tz=(R2*C2);
KK=Kvco*Kpd;
% closed loop TF
s=sprintf('Closed loop PLL TF with Kvco=%8.2e Kpd=%8.2e R2=%8.2e C2=%8.2e R1=%8.2e', Kvco,Kpd, R2, C2, R1);
num1=KK*Tz/Tp;
num0=KK/Tp;
den2=1;
den1=(1+KK*Tz)/Tp;
den0=num0;
num = [num1 num0];
den = [den2 den1 den0];
tf(num, den);
h = tf(num,den);
bode(h);

w0 = sqrt(KK/Tp);
zeta = (w0/2)*(Tz+ 1/(KK));
s2=sprintf('Wo = %8.2e,  Zeta = %8.2e', w0, zeta);
%title({s;s2},'FontSize',8);
title(s);
fprintf('Wo = %8.2e,  Zeta = %8.2e,  KK= %8.2e\n', w0, zeta, KK);
text(1.0e4, -10, s2);

% open lop TF
figure(2);
so=sprintf('Open loop PLL TF with Kvco=%8.2e Kpd=%8.2e R2=%8.2e C2=%8.2e R1=%8.2e', Kvco,Kpd, R2, C2, R1);
num1=KK*Tz;
num0=KK;
den2=Tp;
den1=1;
den0=0;
num = [num1 num0];
den = [den2 den1 den0];
tf(num, den);
h = tf(num,den);
%bode(h);
margin(h);
%title(so);

