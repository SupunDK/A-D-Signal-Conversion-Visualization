function Amp = sampling(Ts, input_signal, t, disp)
    Amp = zeros(size(Ts, 1), size(Ts, 2), 'double');
    
    for i = 1:size(Ts, 2)
        [val, index] = min(abs(t - Ts(i)));
        %fprintf("%f is approximated to %f\n", Ts(i), t(index));
        
        Amp(i) = input_signal(index);
    end
    
    figure;
    hold on;
    plot(t, input_signal);
    stem(Ts, Amp);
    title("Sampling rate = " + disp);
    xlabel("time");
    ylabel("Amplitude");
    hold off;
end