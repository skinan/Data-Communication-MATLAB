% Refresh
clc;
clear all;
close all;
%Binary FSK Modulation & Demodulation
m = [1 0 1 1 0];

% Mapping
for j = 1: length(m)
    if m(j) == 1
        n(j) = 1;
    else
        n(j) = -1;
    end
end

%NRZ Polar phase shaping / pulse shaping
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
plot(t,mod,'m');
axis([0 length(n) -1 2]);
title('Digital Input Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)');

% Carrier
c = sin(2*pi* 3 *t);
% BPSK Modulation
psk = mod .* c;
%plotting
subplot(3, 1, 2);
plot(t,psk,'c');
axis([0 length(n) -1 2]);
title('BPSK');
xlabel('Time(s)');
ylabel('Amplitude(V)');

% Demodulation
for j = 1: length(t)
    if c(j) == psk(j)
        demod(j) = 1;
    else
        demod(j) = -1;
    end
end
subplot(3, 1, 3);
plot(t, demod, 'y');
axis([0 length(n) -1 2]);
title('Detected Sequence');
xlabel('Time(s)');
ylabel('Amplitude(V)'); 

