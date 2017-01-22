function g = RGBGradient(z)
 % Gradient of the RGB function
g = zeros(size(z));
g = RGB(z) .* (255 - RGB(z));

end
