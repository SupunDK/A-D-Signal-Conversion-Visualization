function q_vals = quantization(Amp, q_levels)
    q_vals = zeros( size(Amp,1), size(Amp,2) );
    
    for i = 1:size(Amp,2)
        [val, index] = min(abs(q_levels - Amp(i)));
        %fprintf("%f is approximated to %f\n", Amp(i), q_levels(index)); 
        q_vals(i) = q_levels(index);
    end
end