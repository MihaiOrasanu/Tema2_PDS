%% I. PROIECTAREA FILTRELOR CU RĂSPUNS FINIT LA IMPULS
clc; clear all; close all;

N = 29;     %lungimea filtrului
Ft = 4200;  %frecventa de taiere
Fs = 16000; %frecventa de esantionare

%% punctul a
n = N-1;                            %ordinul filtrului
f = [0 2*Ft/Fs 2*Ft/Fs 1];  %2*Ft/Fs  reprezinta frecventa de taiere normata
m = [1 1 0 0];              %vectorul amplitudine normata al filtrului 
figure(1), plot(f,m);       %reprezentarea grafica a filtrului
%------------
h = fir2(n, f, m);          %functia de modelare a filtrului cu argumentele vectorii ordin, frecventa normata si amplitudine normata
n = 0:N-1;                  %vectorul de distributie al ordinului filtrului
figure(2), stem(n,h), grid, title('Coeficientii filtrului'); %graficul coeficientiilor filtrului
%------------
figure(3), zplane(h,1), title('Diagrama zerourilor'); %diagrama zerourilor pentru filtrul proiectat cu fir2
%------------
N_fft = 512;     %numarul de esantioane pentru tranformata Fourier
H = fft(h, N_fft); %functia de transfer a filtrului prin Fast Fourier Transform
w = -pi: 2*pi/N_fft: pi-2*pi/N_fft;  %vectorul pulsatie normata
figure(4), plot(w, fftshift(abs(H))), grid, title('Caracteristica amplitudine-pulsatie normata'); %graficul caracteristicii amplitudine-pulsatie normata
figure(5), plot(w, fftshift(angle(H))), grid, title('Caracteristica faza-pulsatie normata');      %graficul caracteristicii faza-pulsatie normata
%------------
F = -Fs/2: Fs/N_fft: Fs/2 -Fs/N_fft;     %vectorul frecventa
figure(6), plot(F, 20*log10(fftshift(abs(H)))), grid, title('Caracteristica amplitudine-frecventa normata'); %graficul caracteristicii amplitudine-frecventa normata
%% punctul b
clc; clear all; close all;

N = 29;
Ft = 4200;
Fs = 16000;
f = [0 2*Ft/Fs-0.01 2*Ft/Fs 1];  %2*Ft/Fs 0.45 -> 0.52
m = [1 1 0 0];
%------------
n2 = N-1;
h2 = firpm(n2, f, m);   %functia de modelare a filtrului prin metoda Parks-McClellan
n2 = 0:N-1;             %%vectorul de distributie al ordinului filtrului
%------------
figure(7), stem(n2,h2), grid, title('Coeficientii filtrului'); %graficul coeficientiilor filtrului
%------------
figure(8), zplane(h2,1), title('Diagrama zerourilor');  %diagrama zerourilor
%------------
N_fft = 512;   %numarul de esantioane pentru tranformata Fourier
H2 = fft(h2, N_fft);  %functia de transfer a filtrului prin Fast Fourier Transform
w2 = -pi: 2*pi/N_fft: pi-2*pi/N_fft;  %vectorul pulsatie normata al filtrului
figure(9), plot(w2, fftshift(abs(H2))), grid, title('Caracteristica amplitudine-pulsatie normata');
figure(10), plot(w2, fftshift(angle(H2))), grid, title('Caracteristica faza-pulsatie normata');
%------------
F2 = -Fs/2: Fs/N_fft: Fs/2 -Fs/N_fft;  %vectorul frecventa al filtrului pentru transformata Fourier
figure(11), plot(F2, 20*log10(fftshift(abs(H2)))), grid, title('Caracteristica amplitudine-frecventa normata');  %graficul caracteristicii amplitudine-frecventa normata
%% II. PROIECTAREA FILTRELOR CU RĂSPUNS INFINIT LA IMPULS

%punctul a
clc; clear all; close all;

Ft = 4200;  %frecventa de taiere
Fs = 16000; %frecventa de esantionare
w = 2*pi*Ft; %pulsatia
n = 5;       %ordinul filtrului
%modelarea filtrului digital pornind de la un filtru analogic de tip Butterworth
[bs,as] = butter(n, w, 's')
[bd,ad] = impinvar(bs,as,Fs)
%afisarea caracteristicilor filtrului analogic modelat
[ha,wa] = freqs(bs,as);
figure(1), freqs(bs, as),
		title('Raspunsul in frecventa al filtrului analogic'),
		figure(2), zplane(bs, as),
		title('Diagrama poli zerouri a filtrului analogic')
%afisarea caracteristicilor filtrului digital rezultat
[hd,wd] = freqz(bd,ad);
figure(3), freqz(bd,ad), title('Raspunsul in frecventa al filtrului digital')
ylim([-25 5])
figure(4), zplane(bd,ad), title('Diagrama poli zerouri a filtrului digital')
%Caracteristica amplitudine - frecventa a filtrului digital rezultat
F = wd*Fs/(2*pi);
figure(5), plot(F, 20*log10(abs(hd))), grid, xlabel('F[Hz]'), ylabel('|H(z)|'),
title('Caracteristica amplitudine[dB] - frecventa[Hz] a filtrului digital')
%% punctul b
clear; clc; close all;

n = 5;
Fs = 16000;
Ft = 4200;
 
% metoda directa de proiectare
Wn = 2*Ft/Fs;
[bd, ad] = butter(n, Wn); 
[Hd, Wd] = freqz(bd, ad);

%Reprezentați grafic răspunsul în frecvență și poziția polilor și a zerourilor pentru filtrul digital
figure(1), freqz(bd, ad),
title('Raspunsul in frecventa al filtrului digital')

figure(2), zplane(bd, ad),
title('Diagrama poli zerouri a filtrului digital') 

%Reprezentarea grafica a caracteristicii amplitudine - frecventa a filtrului digital proiectat
F = Wd/(2*pi);
figure(3), plot(F, 20*log10(abs(Hd))), grid,
xlabel('F[Hz]'), ylabel('|H(z)|'), title('Caracteristica amplitudine[dB]-frecventa[Hz] a filtrului digital')

% Aplicarea unui semnal sinusoidal cu functia chirp
t = 0: 1/Fs: 1; 
x = chirp(t, 0, 1, Fs/2);
figure(4), plot(x, t), ylabel('x'), xlabel('t'),
title('Semnalul de intrare'), grid, xlim([-1 1])

figure(5), spectrogram(x, 512, 256, 512, Fs, 'yaxis'), colormap(jet)
title('Spectograma semnalului de intrare')

y = filter(bd, ad, x);
figure(6), plot(y, t), ylabel('y'), xlabel('t'),
title('Semnalul de la iesire'), grid, xlim([-1.5 1.5])

figure(7),spectrogram(y, 512, 256 ,512, Fs, 'yaxis'), colormap(jet)
title('Spectograma semnalului de la iesire')
