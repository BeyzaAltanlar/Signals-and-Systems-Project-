clear all; clc; 

% SORU 1 

%[x,Fs] = audioread('Q1.wav');
%subplot(2,1,1)
%N=length(x);
%t=(0:N-1)/Fs;
%plot (t,x);

%subplot(2,1,2)
%X= fftshift( abs(fft(x)) ) ;
%f= (-N/2: (N/2)-1)*(Fs/N);

%plot(f,X);

%sound (x, Fs); % 

[x, Fs] = audioread('Q1.wav');
dur = length(x) / Fs; % uzunluk
t = linspace(0, dur, length(x)); % zaman dizisi
figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Ses Sinyalinin Zaman Boyutlu Grafiği');
N = length(x); 
f = (0:N/2-1) * Fs / N; % frekans dizisi
X = fft(x) / N; % FFT
Pxx = 2 * abs(X(1:N/2)).^2; % guc spektrumu

f_kadin = [165 255]; % Kdin sesinin frekans
f_erkek = [85 180]; % Erkek sesinin frekans

kadin_idx = (f >= f_kadin(1)) & (f <= f_kadin(2)); % Kadin frekans araligi
kadin_Pxx = Pxx(kadin_idx); % Kadin frekans bilesen

erkek_idx = (f >= f_erkek(1)) & (f <= f_erkek(2)); % Erkek frekans araligi
erkek_Pxx = Pxx(erkek_idx); % Erkek frekans bilesen


figure;
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Ses Sinyalinin Zaman Boyutlu Grafiği');

figure;
plot(f(kadin_idx), kadin_Pxx);
xlabel('Frequency (Hz)');
ylabel('Power');
title('Kadın Sesinin Frekans Bileşenleri');

figure;
plot(f(erkek_idx), erkek_Pxx);
xlabel('Frequency (Hz)');
ylabel('Power');
title('Erkek Sesinin Frekans Bileşenleri');






% Kadin ve erkek seslerinin frekans 
%hold on
%line([f_kadin(1) f_kadin(1)], ylim, 'LineWidth', 2, 'Color', 'r');
%line([f_kadin(2) f_kadin(2)], ylim, 'LineWidth', 2, 'Color', 'r');
%line([f_erkek(1) f_erkek(1)], ylim, 'LineWidth', 2, 'Color', 'g');
%line([f_erkek(2) f_erkek(2)], ylim, 'LineWidth', 2, 'Color', 'g');
%hold off


figure;
plot(f, Pxx);
xlabel('Frequency (Hz)');
ylabel('Power');
title('Ses Sinyalinin Frekans Boyutlu Grafiği');

hold on;
color_kadin = 'r';
color_erkek = 'g';

hold on;
line([f_kadin(1) f_kadin(1)], [0 max(Pxx)], 'Color', color_kadin, 'LineWidth', 2);
line([f_kadin(2) f_kadin(2)], [0 max(Pxx)], 'Color', color_kadin, 'LineWidth', 2);
line([f_erkek(1) f_erkek(1)], [0 max(Pxx)], 'Color', color_erkek, 'LineWidth', 2);
line([f_erkek(2) f_erkek(2)], [0 max(Pxx)], 'Color', color_erkek, 'LineWidth', 2);
legend('Ses Sinyali', 'Kadın Frekans Aralığı', 'Erkek Frekans Aralığı');
text(f_kadin(1), max(Pxx), ['Kadın: ' num2str(f_kadin(1)) '-' num2str(f_kadin(2)) ' Hz'], 'Color', color_kadin, 'VerticalAlignment', 'top');
text(f_erkek(1), max(Pxx), ['Erkek: ' num2str(f_erkek(1)) '-' num2str(f_erkek(2)) ' Hz'], 'Color', color_erkek, 'VerticalAlignment', 'top');



