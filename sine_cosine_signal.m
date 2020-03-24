% refresh all first
clc;
clear all;
close all;

%cosine signal genration 
A = 2; %amplitude
f = 2; %frequency
t = 0: 0.01:2; %time
phase = 0; %initial phase
y = A* cos((2*pi*f*t) + phase);
%plotting part
subplot(2,1,1); % to show multiple graphs in one window, different grids.
plot(t, y,'m'); grid on; %hold on; %use hold on to add both together
xlabel('Time');
ylabel('Amplitude');
title('cosine signal');
axis([0 3 -4 4]); %to extend the view of axis

%sine signal generation
y = A* sin((2*pi*f*t) + phase);
%plotting part
subplot(2, 1, 2);
plot(t, y,'c'); grid on;
xlabel('Time');
ylabel('Amplitude');
title('sine signal');
axis([0 3 -4 4]); %to extend the view of axis
