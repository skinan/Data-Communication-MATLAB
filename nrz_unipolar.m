% refresh all first
clc;
clear all;
close all;

%start
n = [1 0 1 0];%bianry input sequence
%NRZ pulse shaping
i = 1; %dividing into 1 unit each
t = 0 : 0.01 : length(n);
for j = 1 : length(t)
    if t(j) <= i % each values of time
        y(j) = 5 * n(i); % setting amplitudes
   
    else
        i = i + 1;
        y(j) = 5 * n(i)
    end
end
plot(t,y, 'm'); grid on;
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('NRZ Unipolar');
axis([0 length(n) -2 6]); %to extend the view of axis