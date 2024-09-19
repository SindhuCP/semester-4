%pdsp proj2

Fs=1000; %sampling frequency
t=0:1/Fs:1;% time vector
y=sin(2*pi*10*t);% sine wave
noise=0.2*randn(size(y));%noise using inbuilt function randn
y_noisy=sin(2*pi*10*t)+noise;
order=4;      
cutoff=15;% cuttoff frequency 
[b,a]=butter(order,cutoff/(Fs/2),'low');% we send the order,the normalized frequency and the low pass filter  
y_filtered=filtfilt(b,a,y_noisy);%[ filters the signal without phase delay]
figure;
% plotting all the signals
subplot(411);
plot(t,y);
title('Original Signal');
subplot(412);
plot(t,noise);
title('Noise signal')
subplot(413);
plot(t,y_noisy);
title('Noisy Signal');
subplot(414);
plot(t,y_filtered);
title('Filtered Signal');
%calculating the snr of all 3 signals
snr_original=snr(y,Fs);
snr_noisy=snr(y_noisy,Fs);
snr_filtered=snr(y_filtered,Fs);
fprintf('SNR of original signal %.2f dB\n', snr_original);
fprintf('SNR of signal with noise: %.2f dB\n', snr_noisy);
fprintf('SNR of the filtered signal: %.2f dB\n', snr_filtered);