% load
input_layer = imread("input.jpg");
output_layer = imread("target.jpg");

% set some useful variables
totalOutputHeight = rows(output_layer);
totalOutputWidth = columns(output_layer);
input_layer = double(input_layer);
output_layer = double(output_layer);

% "unroll" images
input_layer = input_layer(:);
output_layer = output_layer(:);
final_pic = zeros(length(output_layer),1); 

% set number and size of nn's
number_nn = ceil(length(input_layer) / 900);
for i = 1:number_nn
  input_layer_size = 900;
  if (i == number_nn)
    input_layer_size = length(input_layer) - (900 * (i - 1));
  end  
  hidden_layer_size = input_layer_size;
  output_layer_size = input_layer_size;

  % Select pixels from image
  input = input_layer(900 * (i - 1) + 1: 900 * (i - 1) + input_layer_size, :);
  output = output_layer(900 * (i - 1) + 1: 900 * (i - 1) + input_layer_size, :);
  
  % Set Theta params
  theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
  theta2 = randInitializeWeights(hidden_layer_size, output_layer_size);
  initial_nn_params = [theta1(:) ; theta2(:)];

  fprintf('\nTraining Neural Network %i of %i... \n', i, number_nn);

  options = optimset('MaxIter', 50);
  lambda = 1;

  % Train network
  costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, ...
                                   input, output, lambda);
for it = 1:20            
  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
  it++
end
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size)), ...
                 hidden_layer_size, (input_layer_size));
                 
  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size))):end), ...
                 output_layer_size, (hidden_layer_size));                 
                 
  % Propagate forwards
  pic = draw(Theta1, Theta2, input);
  final_pic(900 * (i - 1) + 1: 900 * (i - 1) + input_layer_size, :) = pic;  
end

% Assemble final image
final_pic = reshape(final_pic, totalOutputHeight, totalOutputWidth, 3);
imwrite(final_pic, "product.jpg");            