function n = displayQuantization(q_vals, Ts, input_signal, t, m)
    n = 1;
    
    figure;
    hold on;
    plot(t, input_signal);
    stem(Ts, q_vals);
    title("Quantization levels = " + m);
    xlabel("time");
    ylabel("Amplitude");
end