function e_vals = encoding(q_vals, q_levels, m, Ts)
   num_bits = log2(m);
   e_vals = zeros( size(q_vals,2), num_bits);
   
   for i = 1:size(q_vals, 2)
       %fprintf("%f is %f\n", num_bits, find(q_levels == q_vals(i)));
       hold_bits = de2bi( find(q_levels == q_vals(i))-1, num_bits );
       
       e_vals(i, :) = hold_bits;
   end
   
   Ts_graph = ones(1, size(q_vals,2)*num_bits);
   e_vals_graph = ones(1, size(q_vals, 2)*num_bits);
   
   pos = 1;
   
   bias = Ts(2) / (2 * num_bits);
   
   for i = 1:size(Ts, 2)
       Ts_graph(1, pos:pos+num_bits-1) = linspace(Ts(i) + bias, Ts(i)+Ts(2)-bias, num_bits);
       e_vals_graph(1, pos:pos+num_bits-1) = e_vals(i,:);
       pos = pos + num_bits;
   end
   
   figure;
   
   stem(Ts_graph, e_vals_graph);
   
end