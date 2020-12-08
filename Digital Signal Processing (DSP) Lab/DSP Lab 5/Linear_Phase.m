clc;
clear all;
h=input("Enter impulse response:");
m=length(h);
temp=h;
L=0;
% T1
if rem(m,2)==1 && isequal(h,flip(temp))
 L=(m-1)/2;
 a=[h(L+1) 2*h(L:-1:1)];
 n=(0:1:L);
 w=(-500:1:500)'*pi/1000;
 Hr=cos(w*n)*a';

 figure()
 subplot(211)
 plot(w/pi,abs(Hr)/max(Hr))
 xlabel("w");
 ylabel("|H(w)|");

 subplot(212)
 plot(w,-(m-1)*w/2)
 xlabel("w");
 ylabel("<(w)");
 disp("Type 1")
% T2
elseif rem(m,2)==0 && isequal(h,flip(temp))
 L=m/2;
 b=2*(h(L:-1:1));
 n=(1:1:L);
 n=n-0.5;
 w=(-500:1:500)'*pi/1000;
 Hr=cos(w*n)*b';

 figure()
 subplot(211)
 plot(w/pi,abs(Hr)/max(Hr))
 xlabel("w");
 ylabel("|H(w)|");

 subplot(212)
 plot(w,-(m-1)*w/2)
 xlabel("w");
 ylabel("<(w)");
 disp("Type 2")
% T3
elseif rem(m,2)==1 && isequal(h,-flip(temp))
 L=(m-1)/2;
 c=2*(h(L+1:-1:1));
 n=(0:1:L);
 w=(-500:1:500)'*pi/1000;
 Hr=sin(w*n)*c';

 figure()
 subplot(211)
 plot(w/pi,abs(Hr)/max(Hr))
 xlabel("w");
 ylabel("|H(w)|");

 subplot(212)
 plot(w,-((m-1)*w/2)+pi/2)
 xlabel("w");
 ylabel("<(w)");
 disp("Type 3")
% T4
elseif rem(m,2)==0 && isequal(h,-flip(temp))
 L=m/2;
 d=2*(h(L:-1:1));
 n=(1:1:L);
 n=n-0.5;
 w=(-500:1:500)'*pi/500;
 Hr=sin(w*n)*d';

 figure()
 subplot(211)
 plot(w/pi,abs(Hr)/max(Hr))
 xlabel("w");
 ylabel("|H(w)|");

 subplot(212)
 plot(w,-((m-1)*w/2)+pi/2)
 xlabel("w");
 ylabel("<(w)");
 disp("Type 4")
else
 fvtool(h,1);
 disp("Not of any type");
end
b=h;
a=1;
Fs=8000;
Ts=1/Fs;
Ns=512;
t=[0:Ts:Ts*(Ns-1)];
x1=sin(2*pi*500*t);
x2=sin(2*pi*1000*t);
x3=sin(2*pi*2000*t);
x4=sin(2*pi*3000*t);
x=2+x1+x2+x3+x4;
y=filter(b,a,x);
figure();
n=length(x);
f=(0:Ns-1)*(Fs/Ns);
x1=fft(x,Ns);
y1=fft(y,Ns);
subplot(211);
plot(f,abs(x1));
title('Spectrum of Orignal Signal')
ylabel('|H(w)|')
xlabel('w')
subplot(212);
plot(f,abs(y1));
title('Spectrum of Filtered Signal')
ylabel('|H(w)|')
xlabel('w')
% Real Signal
[cat,fs]=audioread("Cat_Meow_2-Cat_Stevens.mp3");
cat=cat(:,1);
nc=length(cat);
disp(nc);
f=(-(nc/2):(nc/2)-1)*(fs/nc);
yc=filter(b,a,cat);
xc=fftshift(fft(cat));
yc=fftshift(fft(yc));
figure();
ylabel('|H(w)|')
xlabel('w')
subplot(211);
plot(f,abs(xc));
title('Spectrum of Original Signal')
subplot(212);
plot(f,abs(yc));
title('Spectrum of Filtered Signal')