% refresh all first
clc;
clear all;
close all;
% Bipolar Line Coding : AMI (Alternate Mark Inversion)
n = [0 1 0 0 1 0];
m = [0 0 0 0 0 0];
c = 1;
% mapping
for j = 1:length(n)
    if n(j) == 1
        m(j) = 0;
    else
        if c == 1;
            m(j) = c;
            c = -1;
        else
            m(j) = c;
            c = 1;
        end
    end
end
% pulse shaping
i = 1;
t = 0:0.01:length(m);
for j=1:length(t)
    if t(j) <= i
        y(j) = m(i);
    else
        i = i + 1;
    end
end
% plotting
plot(t, y, 'm'); grid on;
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Bipolar AMI');
axis([0, length(m), -2, 2]);