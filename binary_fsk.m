% Refresh
clc;
clear all;
close all;
%Binary FSK Modulation & Demodulation
n = [1 0 1 1 0];
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
c1 = sin(2*pi*2*t); %% Carrier 1
c2 = sin(2*pi*4*t); %% Carrier 2

% BFSK Modulation
for j = 1: length(t)
    if y(j) == 1
        fsk(j) = c2(j);
    else
        fsk(j) = c1(j);
    end
end

%plotting
subplot(3, 1, 2);
plot(t,fsk,'c');
axis([0 length(n) -1 2]);
title('BFSK');
xlabel('Time(s)');
ylabel('Amplitude(V)');

% Demodulation
for j = 1: length(t)
    if fsk(j) == c2(j)
        demod(j) = 1;
    else
        demod(j) = 0;
    end
end
subplot(3, 1, 3);
plot(t, demod, 'm');
axis([0 length(n) -1 2]);
title('Detected Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)'); 

       


