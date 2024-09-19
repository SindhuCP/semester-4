%recursive funtion for IDIF FFT
x1=input('Enter x[n]: ');% taking input
y= ditfft(x1);% calling user defined function
disp(y);% displaying output using user defined function
function c = ditfft(x)% function header, c is return value
    L = length(x);
    if L > 1
        L2 = L/2;
        ce = ditfft(x(1:2:L-1)); % calling function with only even index terms; recursive call
        co = ditfft(x(2:2:L)); % calling function with only odd index terms; recursive call
        tf = exp(1i*2*pi/L).^(0:L2-1);% finding twiddle factor
        c1 = tf.*co;% multiplying with twiddle factor
        c= [(ce+c1)./2,(ce-c1)./2];% dividing by 2 at each stage
    
    else % defining base case
        c=x;
    end
end