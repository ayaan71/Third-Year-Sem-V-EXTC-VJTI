%QUESTION A 1.)
%WE ARE SUPPOSED TO CONVOLVE  
%x(t) = u(t) - u(t-5) WITH  h(t) = (sin(2.pi.t))/(2.pi.t)

clc
t=-10:0.01:10;

%Working on function h; sinc(x) returns (sin(pi.x))/(pi.x); therefore;
h=sinc(2*t);
i=1; %initialised

%Working on function x, where u(t) is denoted with inbuilt heaviside(t)
%In MATLAB heaviside(0) = 0.5

for w=-10:0.01:10 
 if(w==0)
 x(i)=heaviside(w)-heaviside(w-5)+0.5;
 i=i+1;
 elseif(w==5)
 x(i)=heaviside(w)-heaviside(w-5)-0.5;
 i=i+1;
 else
 x(i)=heaviside(w)-heaviside(w-5);
 i=i+1;
 end
end

%conv() flips the signal, so what we do is that we give a flipped signal
%input
% For Plotting the graphs:

% For plotting the figure of x(t) and h(t)
sgtitle("The Input Signal and its Impulse Response")
subplot(2,1,1)
plot(t,x)
title("x(t)")
subplot(2,1,2)
plot(t,h)
title("h(t)")
figure;


% Convolution of x(t) with h(t) and its plot code is as follows:
y=conv(x,h,'same')*0.01;  %Simple Convolution
sgtitle("y(t) & g(t) at b=1")
subplot(2,1,1)
plot(t,y)
title("y(t)")
xflip=fliplr(x); %For flipping signal with respect to y-axis
g=conv(xflip,h,'same')*0.01; %Convolution without flipping
subplot(2,1,2)
plot(t,g)
title("g(t)")
figure;


% Case 1: 0<b<1 at b=0.6
t=-10:0.01:10;
h=sinc(0.6*2*t); %since b=0.6
y=conv(x,h,'same')*0.01;  %Simple Convolution
sgtitle("Plot of y(t) and g(t) at b=0.6 ")
subplot(2,1,1)
plot(t,y)
title("y(t)")
xflip=fliplr(x); %For flipping signal with respect to y-axis
g=conv(xflip,h,'same')*0.01; %Convolution without flipping
subplot(2,1,2)
plot(t,g)
title("g(t)")
figure;


% Case 2: 1<b<finite positive value at b=2.4
t=-10:0.01:10;
h=sinc(2.4*2*t); %since b=2.4
y=conv(x,h,'same')*0.01;
sgtitle("Plot of y(t) and g(t) at b=2.4")
subplot(2,1,1)
plot(t,y)
title("y(t)")
xflip=fliplr(x);
g=conv(xflip,h,'same')*0.01;
subplot(2,1,2)
plot(t,g)
title("g(t)")
