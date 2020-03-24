% Refresh
clc;
clear all;
close all;
%Binary ASK modulation and demodulation
n = [1 0 1 0];
%NRZ phase shaping / pulse shaping
i = 1;
t = 0 : 0.01 : length(n);
for j = 1 : length(t)
    if t(j) <= i 
        y(j) = n(i);
    else
        i = i + 1;
        y(j) = n(i);
    end
end

%plotting
subplot(3, 1, 1);
plot(t,y,'m');
axis([0 length(n) -1 2]);
title('Digital Input Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)');
% Carrier
x = cos(2 * pi * 2 * t);
ask = y .*x; 
subplot(3, 1, 2);
%plotting
plot(t,ask,'m');
axis([0 length(n) -1 2]);
title('ASK');
xlabel('Time(s)');
ylabel('Amplitude(V)');

for j = 1: length(t)
    if x(j) == ask(j)
        k(j) = 1;
    else
        k(j) = 0;
    end
end
subplot(3, 1, 3);
plot(t, k, 'm');
axis([0 length(n) -1 2]);
title('Detected Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)'); 