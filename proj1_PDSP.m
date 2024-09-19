%DIT FFT

function c=proj1_PDSP(x)
	L=length(x);
	if L>1
		L2=L/2; 
		ce=proj1_PDSP(x(1:2:L-1));% cause starts from 1
		co=proj1_PDSP(x(2:2:L));
		tf=exp(-1i*2*pi /L).^(0:L2-1);% twiddle factors
		c1= tf.*co;
		c=[(ce+c1),(ce-c1)];
	else
		c=x;
end