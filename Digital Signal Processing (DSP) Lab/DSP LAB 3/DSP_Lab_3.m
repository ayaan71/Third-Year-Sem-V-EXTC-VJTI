clc;
close all;
fs=44100;                      
dt = 1/fs;                     
ST = 1; %Stop Time
t = (0:dt:ST-dt)';

%Part A i):
% Analysis of 10 harmonics starting with 
%f=50Hz with an interval of 20Hz.

g1=sin(2*pi*50*t);
plot(t,g1);
figure;
g2=sin(2*pi*70*t);
plot(t,g2);
figure;
g3=sin(2*pi*90*t);
plot(t,g3);
figure;
g4=sin(2*pi*110*t);
plot(t,g4);
figure;
g5=sin(2*pi*130*t);
plot(t,g5);
figure;
g6=sin(2*pi*150*t);
plot(t,g6);
figure;
g7=sin(2*pi*170*t);
plot(t,g7);
figure;
g8=sin(2*pi*190*t);
plot(t,g8);
figure;
g9=sin(2*pi*210*t);
plot(t,g9);
figure;
g10=sin(2*pi*230*t);
plot(t,g10);


%The part A i) was for plotting the graphs 
%This is part A ii) where we listen to the harmonics.

disp("Playing Sound 1")
soundsc(g1,fs);
pause;
disp("Playing Sound 2")
soundsc(g2,fs);
pause;
disp("Playing Sound 3")
soundsc(g3,fs);
pause;
disp("Playing Sound 4")
soundsc(g4,fs);
pause;
disp("Playing Sound 5")
soundsc(g5,fs);
pause;
disp("Playing Sound 6")
soundsc(g6,fs);
pause;
disp("Playing Sound 7")
soundsc(g7,fs);
pause;
disp("Playing Sound 8")
soundsc(g8,fs);
pause;
disp("Playing Sound 9")
soundsc(g9,fs);
pause;
disp("Playing Sound 10")
soundsc(g10,fs);
pause;

%Part A iii):
%Here, we combine all the graphs for different harmonics to get a single
%graph.


g=g1+g2+g3+g4+g5+g6+g7+g8+g9+g10;
plot(t,g);
figure;

%Part B:
%Here, we start with using fftshift function of Matlab. fftshift swaps the
%values of left and right halves of the vector in a x-y graph. Here, the
%vector is g. 

ft=fftshift(fft(g));
t = (0:dt:ST-dt)';
N = size(t,1);
dF = fs/N;                     
f = -fs/2:dF:fs/2-dF;
plot(f,abs(ft));

%Analyzing the sound of Airplane Landing:
disp("Playing Cat Meow Sound")
xlim([-250 250]) % This sets the limit for the x-axis.
[als,fs]=audioread('Cat_Meow_2-Cat_Stevens.mp3');
left=als(1:N,1);
partb = fftshift(fft(left));
figure(13);
plot(f,abs(partb)/N);
xlim([-7000 7000])
soundsc(left,fs)
pause;

%Analyzing my own voice clip
disp("Playing My Voice Clip")
[mvs,fs]=audioread('DSP_Lab_3_file.m4a');
left=mvs(1:N,1);
partb = fftshift(fft(left));
soundsc(left,fs);
figure(14);
plot(f,abs(partb)/N);
xlim([-4000 4000])
pause;