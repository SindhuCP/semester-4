%recursive function for IDIT FFT
x1=input('Enter x[n]: ');% taking input
y= iditfft(x1);% calling user defined function
y=bitrevorder(y);% to give bit reversed input to user defined function
disp(y);% displaying output using user defined function
function c = iditfft(x)% function header, c is return value
    L = length(x);
    if L > 1
        L2 = L/2;
        tf = exp(1j*2*pi/L).^(0:L2-1);% finding twiddle factor
        c1 = iditfft((x(1:L2)+x(L2+1:L))./2);% recursive call
        c2 = iditfft((x(1:L2)-x(L2+1:L)).*tf./2);% recursive call
        %cc=[c1';c2'];
        %c= cc(:);%gives first column values then 2nd column
        c=[c1,c2]
    else% defining base case
        c=x;
    end

end