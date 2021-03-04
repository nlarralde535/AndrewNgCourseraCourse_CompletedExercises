function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% J = (1/2m) E_1-m_( h(x_i) - y_i )^2    +    (l/2m) E_(theta^2)

predictions = X*theta;

squaredErrors = (predictions - y) .^2;

theta_regd = theta(2:end, :);

J = 1/(2*m) * sum(squaredErrors)  +  (lambda/(2*m)) * sum(theta_regd.^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%

theta_regd_prepended_zero = [0; theta_regd];

unregd_grad =  (1/m) .* (X' * (predictions - y));

grad = unregd_grad + ((lambda/m) .* theta_regd_prepended_zero);  


 








% =========================================================================

grad = grad(:);

end
