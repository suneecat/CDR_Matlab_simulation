function power_spectrum_nrz_rz
% plot frequency power spectrum of NRZ and RZ (unipolar) random data
% pulse amplitude is set to sqrt(2) and 2 respectively to normalize signal
% power to unity
%
Rb=1;  % data rate in bits/sec
Tb = 1/Rb;
f = 0:0.01:4*Rb; % frequency points
% NRZ, unipolar  
%x =pi*Tb*f;
x =Tb*f;
temp1 = sinc(x);  % sinc(x) = sin(pi*x)/(pi*x)
temp2 = delta(f);
%temp2 = temp2(:);

%[k,l] = size(temp1);
%[m,n] = size(temp2);
%fprintf('length of temp1 = %d  length of temp2 = %d\n', length(temp1), length(temp2));
%fprintf('size of temp1 = %d %d  size of temp2 = %d %d\n', k,l,m,n);
amp=sqrt(2);
P_nrz = (amp^2)*Tb/4*(temp1.*temp1).*(1+temp2/Tb);

% RZ, unipolar
x =Tb*f/2;
temp1 = sinc(x);
for k=-20:20
   dlt(k+21,:)=delta(f(:)-k/(Tb));
   end;
   temp2 = sum(dlt,1);
%temp2 = temp2(:);
amp=2;
P_rz = (amp^2)*Tb/16*(temp1.*temp1).*(1+temp2./(Tb));
fprintf('P_rz at 0 is = %8.3f \n', P_rz(1,1) );

subplot(2,1,1);
plot(f,P_nrz,'LineWidth',2);
title('normalized NRZ power spectrum','FontSize',14);
%ylabel('Magnitude of P(f)');
grid;


subplot(2,1,2);
plot(f,P_rz,'LineWidth',2);
title('normalized RZ power spectrum','FontSize',14);
%ylabel('Magnitude of P(f)');
grid;


function dirac = delta(x)
    for i=1:length(x)
        if x(i)==0
      dirac(i)=1;
        else
      dirac(i)=0;
        end;
    end;
end

end
