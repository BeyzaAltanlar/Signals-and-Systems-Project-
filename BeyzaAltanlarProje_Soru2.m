clear all; clc; 


%SORU2 

%[x, Fs] = audioread('Q2_a.wav');
[x, Fs] = audioread('Q_2b.wav');

% FFT 
N = length(x);
X = fft(x) / N;
f = (0:N/2-1) * Fs / N;


figure;
plot(f, 2 * abs(X(1:N/2)));
xlabel('Frekans (Hz)');
ylabel('Genlik');
title('Sinyal Spektrumu');

% filter
fc = 5000; 
order = 50; 
b = fir1(order, fc / (Fs/2));


y = filter(b, 1, x);

% Filtrelenmis sinyal 
Y = fft(y) / N;
figure;
plot(f, 2 * abs(Y(1:N/2)));
xlabel('Frekans (Hz)');
ylabel('Genlik');
title('Filtrelenmis Sinyal Spektrumu');


%sound(x, Fs);

%sound(y, Fs);
