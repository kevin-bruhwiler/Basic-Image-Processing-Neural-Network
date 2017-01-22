function pic = draw(Theta1, Theta2, X)

% forward propagation
h1 = RGB(X' * Theta1');
pic = RGB(h1 * Theta2');

end
