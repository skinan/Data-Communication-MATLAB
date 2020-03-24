n = [1 1 0 1 1 0];
%m = [0 0 0 0];
i = 1;
t = 0:0.01:length(n);

for j = 1:length(t)
    if n(j) == 1
        if i == 1
            m(j) = 1;
            i = -1;
        else
            m(j) = -1;
            i = 1;
        end
    else
        m(j) = 0;
    end
end

%NRZ pulse shaping
i = 1; %dividing into 1 unit each
t = 0 : 0.01 : length(n);
for j = 1 : length(t)
    if t(j) <= i % each values of time
        y(j) = 5 * n(i); % setting amplitudes
   
    else
        i = i + 1;
        y(j) = n(i); 
    end
end

plot(t, y, 'm'); grid on
xlabel('Time (s)');
ylabel('Amplitude (V)');
%axis([0, 4, -2, 2]);