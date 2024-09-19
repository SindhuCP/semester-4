% pdsp proj 3

Fs=1000;%sampling frequency  
t=0:1/Fs:1; %time vector
x=5*sin(2*pi*10*t); %sine signal
noise=0.5*randn(size(x));%noise using randn inbuilt function
x_noisy=x+noise; 
cutoff=14;
order=74;%order of the filter
nyquist_freq=0.5*Fs; 
cutoff_normalized=cutoff/ nyquist_freq;
b=fir1(order,cutoff_normalized,"low",kaiser(order+1));% fir 1 using kaiser window
y=filtfilt(b,1,x_noisy);  % filters without phase delay
%calculation of snr 
snr_original=snr(x_noisy,Fs);
snr_filtered=snr(y,Fs);
snr_wave= snr(x);
fprintf('SNR of signal with noise: %.2f dB\n', snr_original);
fprintf('SNR of the filtered signal: %.2f dB\n', snr_filtered);
fprintf('SNR of the original signal: %.2f dB\n', snr_wave);

figure;
%plotting all the required signals
subplot(411);
plot(t,x);
title('Original signal');
subplot(412);
plot(t,noise);
title('Noise signal');
subplot(413);
plot(t,x_noisy);
title('Original signal with noise');
subplot(414);
plot(t,y);
title('Filtered signal');