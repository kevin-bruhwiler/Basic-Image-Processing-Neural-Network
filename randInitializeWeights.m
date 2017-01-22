function W = randInitializeWeights(L_in, L_out)

% Set initial parameters randomly
W = zeros(L_out, L_in);
epsilon = .5;
W = rand(L_out, L_in) * 2 * epsilon - epsilon; 

end
