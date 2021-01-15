%Parameters & Input

w = 10; %the chosen bandwith of the signal
Ts = [pi/w, pi/(2*w), pi/(4*w)]; %the chosen sampling rates
m = 16; %the number of quantization levels
start_time = 0; %starting time of the signal
end_time = 5; %ending time of the signal

t = start_time:0.001:end_time; %time corresponding to the signal
input_signal = input("Enter the equation of the analog signal: "); %the input signal

quantized_levels = linspace(min(input_signal), max(input_signal), m); %the quantization levels

%Signal Processing

Ts1 = start_time:Ts(1):end_time; %sampling times for 2w sampling frequency
%Ts2 = start_time:Ts(2):end_time; %sampling times for 4w sampling frequency
%Ts3 = start_time:Ts(3):end_time; %sampling times for 8w sampling frequency

Amp_Ts1 = sampling(Ts1, input_signal, t, "2w");
%Amp_Ts2 = sampling(Ts2, input_signal, t, "4w");
%Amp_Ts3 = sampling(Ts3, input_signal, t, "8w");

q_vals_Ts1 = quantization(Amp_Ts1, quantized_levels);
%q_vals_Ts2 = quantization(Amp_Ts2, quantized_levels);
%q_vals_Ts3 = quantization(Amp_Ts3, quantized_levels);

displayQuantization(q_vals_Ts1, Ts1, input_signal, t, m);
%displayQuantization(q_vals_Ts2, Ts2, input_signal, t, m);
%displayQuantization(q_vals_Ts3, Ts3, input_signal, t, m);

e_vals_Ts1 = encoding(q_vals_Ts1, quantized_levels, m, Ts1);
