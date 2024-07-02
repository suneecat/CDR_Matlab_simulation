function UNRZ_RZ(h)
%Line code UNIPOLAR NRZ and RZ plot
%
%
% NRZ
if (nargin ~= 1)			%  Default input;
    h=[1 0 0 1 1 0 1 0 1 0];
end
if (length(h) < 4),
   error('* INPUT MUST BE AT LEAST 4 BITS OR nil *');
   % return;
end
clf;
n=1;
l=length(h);
h(l+1)=1;
while n<=length(h)-1;
    t=n-1:0.001:n;
if h(n) == 0
    if h(n+1)==0  
        y=(t>n);
    else
        y=(t==n);
    end
    subplot(2,1,1);
    d=plot(t,y);grid on;
    title('NRZ line code format','FontSize',14);
    set(d,'LineWidth',2.5);
    hold on;
    axis([0 length(h)-1 -0.1 1.1]);
    % disp('zero');
else
    if h(n+1)==0
        %y=(t>n-1)-2*(t==n);
        y=(t<n)-0*(t==n);
    else
        %y=(t>n-1)+(t==n-1);
        y=(t<n)+1*(t==n);
    end
    %y=(t>n-1)+(t==n-1);
    subplot(2,1,1);
    d=plot(t,y);grid on;
    title('NRZ line code format','FontSize',14);
    set(d,'LineWidth',2.5);
    hold on;
    axis([0 length(h)-1 -0.1 1.1]);
    % disp('one'); 
end
n=n+1;
end

%POLAR RZ 
n=1;
while n<=length(h)-1;
    t=n-1:0.001:n;
if h(n) == 0
 %   y=0;
    if h(n+1)==0  
    y=(t>n);
    else
        y=(t==n);
    end
    subplot(2,1,2);
    d=plot(t,y);grid on;
    title('RZ line code format','FontSize',14);
    set(d,'LineWidth',2.5);
    hold on;
    axis([0 length(h)-1 -0.1 1.1]);
    % disp('zero');
else
    if h(n+1)==0
        %y=(t>n-1)-2*(t==n);
        y=(t<n-0.5);
    else
        %y=(t>n-1)+(t==n-1);
        y=(t<n-0.5)+1*(t==n);
    end
    %y=(t>n-1)+(t==n-1);
    subplot(2,1,2);
    d=plot(t,y);grid on;
    title('RZ line code format','FontSize',14);
    set(d,'LineWidth',2.5);
    hold on;
    axis([0 length(h)-1 -0.1 1.1]);
    % disp('one'); 
end
n=n+1;
end


