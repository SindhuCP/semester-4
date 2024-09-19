%recursive (radix 2) DIF FFT
x1=input('Enter x[n]: ');% taking input
y= diffft(x1); % calling user defined function
y=bitrevorder(y);% to give bit reversed input to user defined function
disp(y);% displaying output using user defined function
disp(fft(x1));% displaying output using inbuilt function
function c = diffft(x)% function header, c is return value
    L = length(x);
    if L > 1
        L2 = L/2;
        tf = exp(-1j*2*pi/L).^(0:L2-1);% finding twiddle factor
        c1 = diffft(x(1:L2)+x(L2+1:L));% recursive call
        c2 = diffft((x(1:L2)-x(L2+1:L)).*tf);% recursive call
        %cc=[c1';c2'];
        %c= cc(:);%gives first column values then 2nd column
        c=[c1,c2];
    
    else% defining base case
        c=x;
    end

end