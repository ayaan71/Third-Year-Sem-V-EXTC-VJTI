%PART B]
%WE ARE SUPPOSED TO 
%Write a sample script to convolve following discrete time signals; 
%Plot x(n), h(n) and convolved output y(n). 
%x(n) = u(n) - u(n-5)   with   h(n) = n.x(n);

clc
i=1;
x = 0:1:20;

%Working on function x, where u(t) is denoted with inbuilt heaviside(t)
%In MATLAB heaviside(0) = 0.5
%For Function x[n]

for w=-10:1:10
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

n=-10:1:10;

%Function h[n]
h=n.*x;

sgtitle("The Input Signal and its Impulse Response")
subplot(2,1,1)
stem(n,x)
title("x(n)")
subplot(2,1,2)
stem(n,h)
title("h(n)")
figure;

%Convolution
y=conv(x,h,'same');


sgtitle("y(n) & g(n)")
subplot(2,1,1)
stem(n,y)
title("y(n)")

%Convolution without flip
xflip=fliplr(x); %To flip signal with respect to y-axis
g=conv(xflip,h,'same'); %Since the conv() flips the signal we input a flipped signal.
subplot(2,1,2)
stem(n,g)
title("g(n)")