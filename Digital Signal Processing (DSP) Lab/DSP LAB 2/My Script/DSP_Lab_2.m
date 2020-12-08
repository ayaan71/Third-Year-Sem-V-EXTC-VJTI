clc
clear  all


[hootie,fs]=audioread('8D_Sugar_and_Brownies.wav'); % loads hootie.wav
out=hootie;

% channels
left=hootie(:,1);
right=hootie(:,2);


% plotting
figure(1);
time=(1/44100)*length(left);
t=linspace(0,time,length(left));
plot(t,left);
xlabel('time (sec)');
ylabel('relative signal strength');

figure(2);
time=(1/44100)*length(right);
t=linspace(0,time,length(right));
plot(t,right);
xlabel('time (sec)');
ylabel('relative signal strength');

figure(3);
time=(1/44100)*length(hootie);
t=linspace(0,time,length(hootie));
plot(t,hootie);
xlabel('time (sec)');
ylabel('relative signal strength');

% Listen
% pause
soundsc(left,fs);       % plays left channel as mono
disp('playing left channel as mono');
 pause;
soundsc(right,fs);    % plays right channel mono (sound nearly the same)
disp('playing right channel as mono');
 pause;
soundsc(hootie,fs);     % plays stereo (ahhhů)
disp('playing stereo Ahhh');
 pause;
 


 
disp('Sampling rate demo');
soundsc(hootie,fs); % Orig?
pause;
  
disp('Sampling rate demo');
soundsc(hootie,fs/2.5); % How slow can you go?
pause;

disp('Sampling rate demo');
soundsc(hootie,fs*3) % !
pause;