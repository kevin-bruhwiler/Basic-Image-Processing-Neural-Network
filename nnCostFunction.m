function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, ...
                                   X, y, lambda)

% Unroll parameters
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size)), ...
                 hidden_layer_size, (input_layer_size));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size))):end), ...
                 output_layer_size, (hidden_layer_size));

% Some useful variables
m = size(X, 1);
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% Cost Function
Xcost = X;
Xcost = RGB(Theta1 * Xcost);
predict = RGB(Theta2 * Xcost);
J = (1/m) * sum((predict - y) .^ 2);
   
% Backpropagation
z2 = Theta1 * X;
a2 = RGB(z2)';
z3 = Theta2 * a2';
a3 = RGB(z3);
delta3 = (a3 - y);
delta2 = (Theta2' * delta3) .* RGBGradient(z2);
Theta1_grad = (Theta1_grad + (delta2 * X'));
Theta2_grad = (Theta2_grad + (delta3 * a2));  
Theta1_grad = (1/m) * Theta1_grad + (lambda / m) * Theta1;
Theta2_grad = (1/m) * Theta2_grad + (lambda / m) * Theta2;

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
