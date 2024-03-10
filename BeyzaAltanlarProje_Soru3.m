clear all; clc; 

[y, Fs] = audioread('Q3.wav');
N = length(y);
f = (0:N-1)*(Fs/N);
S = abs(fft(y));
plot(f, S);
xlabel('Frekans');
ylabel('Sinyal');





%
%N = 1000;
%fc_bateri = 30; % bateri
%fc_gitar = 500; % gitar
%fc_vokal = 3000; % vokal

% FIR filter
%b_bateri = fir1(N, fc_bateri/(Fs/2));
%b_gitar = fir1(N, [fc_bateri/(Fs/2) fc_gitar/(Fs/2)]);
%b_vokal = fir1(N, fc_vokal/(Fs/2), 'high');

% Bateri sesi filtre
%y_bateri = filter(b_bateri, 1, y);
%audiowrite('Q3_bateriSesi.wav', y_bateri, Fs);

% Gitar sesi filter
%y_gitar = filter(b_gitar, 1, y);
%audiowrite('Q3_gitarSesi.wav', y_gitar, Fs);

% Vokal sesi filter
%y_vokal = filter(b_vokal, 1, y);
%audiowrite('Q3_vokalSesi.wav', y_vokal, Fs);

%[y, Fs] = audioread('Q3.wav');
%sound(y, Fs);

%[y_vokal, Fs] = audioread('Q3_vokalSesi.wav');
%sound(y_vokal, Fs);

%[y_gitar, Fs] = audioread('Q3_gitarSesi.wav');
%sound(y_gitar, Fs);

%[y_bateri, Fs] = audioread('Q3_bateriSesi.wav');
%sound(y_bateri, Fs);







% Bandpass ile deneme... 

% b_bateri = fir1(1024, [100/(Fs/2), 500/(Fs/2)], 'bandpass');
% y_bateri = filter(b_bateri, 1, y(:,1));
% b_gitar = fir1(1024, [500/(Fs/2), 3000/(Fs/2)], 'bandpass');
% y_gitar = filter(b_gitar, 1, y(:,1));

% b_vokal = fir1(1024, [3000/(Fs/2), 8000/(Fs/2)], 'bandpass');
% y_vokal = filter(b_vokal, 1, y(:,1));
% audiowrite('metallica_bateri.wav', y_bateri, Fs);
% audiowrite('metallica_gitar.wav', y_gitar, Fs);
% audiowrite('metallica_vokal.wav', y_vokal, Fs);



%BUTTER 
%butter +bandpass

[y, fs] = audioread('Q3.wav');

% Bateri sesi
[b_bateri,a_bateri] = butter(3, [80 400]/(fs/2));
y_bateri = filter(b_bateri, a_bateri, y);

% Gitar sesi
[b_gitar,a_gitar] = butter(3, [400 3000]/(fs/2));
y_gitar = filter(b_gitar, a_gitar, y);

% Vokal sesi
%[b_vokal,a_vokal] = butter(3, []/(fs/2));
%y_vokal = filter(b_vokal, a_vokal, y);

N = length(y);
Y = fft(y);
f = Fs*(0:(N/2))/N;
P = abs(Y/N).^2; 
P = P(1:N/2+1);
P(2:end-1) = 2*P(2:end-1);


% vokal gitar bandpass uygulama 
f_low = 500;
f_high = 4000;


[b, a] = butter(6, [f_low, f_high]/(Fs/2), 'bandpass');

y_vokal = filter(b, a, y);



audiowrite('Q3_bateri.wav', y_bateri, fs);
audiowrite('Q3_gitar.wav', y_gitar, fs);
audiowrite('Q3_vokal.wav', y_vokal, fs);




