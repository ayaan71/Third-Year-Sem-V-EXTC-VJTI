clc;
clear;
close all;
% t = linspace(-50,5);
wc=input("Enter Cutoff frequency: ");
t=0:0.1:2*pi/wc;
y = wc*sinc(wc*(t));
plot(t,y)
M=input('Enter the length of window:');    
w1=boxcar(M); % Rectangular 
w2=triang(M);
w3=hanning(M);
w4=hamming(M);
w5=blackman(M);
w6=kaiser(M);
% plot(t,w);
s1=conv(w1,y);
s2=conv(w2,y);
s3=conv(w3,y);
s4=conv(w4,y);
s5=conv(w5,y);
s6=conv(w6,y);
figure()
subplot(231)
plot(s1);
title('Response with rectangular window');
subplot(232)
plot(s2);
title('Response with triangular window');
subplot(233)
plot(s3);
title('Response with Hanning window');
subplot(234)
plot(s4);
title('Response with Hamming window');
subplot(235)
plot(s5);
title('Response with Blackman window');
subplot(236)
plot(s6);
title('Response with Kaiser window');
