function e_vals = encoding(q_vals, q_levels, m, Ts)
   num_bits = log2(m);
   e_vals = zeros( size(q_vals,2), num_bits);
   
   for i = 1:size(q_vals, 2)
       %fprintf("%f is %f\n", num_bits, find(q_levels == q_vals(i)));
       hold_bits = de2bi( find(q_levels == q_vals(i))-1, num_bits );
       
       e_vals(i, :) = hold_bits;
   end
 
   step = 10^(-3);
   
   Ts_graph = 1:step:size(q_vals,2)*num_bits+1;
   e_vals_graph = 1:step:size(q_vals, 2)*num_bits+1;
   
   Ts_graph(end) = [];
   e_vals_graph(end) = [];
   
   index_count = 0;
   
   for i = 1:size(e_vals, 1)
       for j = 1:size(e_vals, 2)
           for z = 1:(1/step)
               e_vals_graph(index_count+z) = e_vals(i,j); 
           end
           index_count = index_count + (1/step);
       end 
   end
   
   figure;
   
   plot(Ts_graph, e_vals_graph);
   ylim([-0.5, 1.5]);
   grid;
   
end