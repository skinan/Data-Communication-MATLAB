% refresh all first
clc;
clear all;
close all;
% line coding
% rz polar
n = [1 0 1 0];
% pulse shaping with maping concurrently
a = 0;
b = 0.5;
i = 1;
t = 0:0.01:length(n);
for j = 1:length(t)
    if n(i) == 1
        if t(j) >= a && t(j) <= b
            y(j) = n(i);
        else if t(j) > b && t(j) <= i
            y(j) = 0;
        else
            a = a + 1;
            b =  b + 1;
            i = i + 1;
            end
        end
    end
    if n(i) == 0 
        if t(j) >= a && t(j) <= b
            y(j) = -1;
        else if t(j) > b && t(j) <= i
            y(j) = n(i);
        else
            a = a + 1;
            b =  b + 1;
            i = i + 1;
            end
        end
    end
end               
%plotting
plot(t, y, 'm'); grid on;
xlabel('Time (s)');
ylabel('Amplitude (V)');
axis([0, 4, -2, 2]);