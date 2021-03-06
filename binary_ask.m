% Refresh
clc;
clear all;
close all;
%Binary ASK modulation and demodulation
n = [1 0 1 1 0];
%NRZ phase shaping / pulse shaping
i = 1;
t = 0 : 0.01 : length(n);
for j = 1 : length(t)
    if t(j) <= i 
        mod(j) = n(i);
    else
        i = i + 1;
        mod(j) = n(i);
    end
end

%plotting
subplot(3, 1, 1);
plot(t,mod,'c');
axis([0 length(n) -1 2]);
title('Digital Input Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)');
% Carrier
c = cos(2 * pi * 2 * t);
ask = mod .*c; 
% Modulation
%plotting
subplot(3, 1, 2);
plot(t,ask,'m');
axis([0 length(n) -1 2]);
title('BASK');
xlabel('Time(s)');
ylabel('Amplitude(V)');

% Demodulation
for j = 1: length(t)
    if c(j) == ask(j)
        demod(j) = 1;
    else
        demod(j) = 0;
    end
end
subplot(3, 1, 3);
plot(t, demod, 'y');
axis([0 length(n) -1 2]);
title('Detected Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)'); 