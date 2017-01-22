function g = RGB(z)

% Set node values between 1 and 255 
g = 255.0 ./ (1 + (255 * exp(-z)));

end