function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

      %   J(theta) = 1/m E[ -y*log(h) - (1-y)*log(1-h) ]
      %  Cost Function setup
      
    z = X*theta;
    h = sigmoid(z);
log_h = log(h);
minus_y = -1 .* y;
    one = ones(size(h));    % a colums of 1's
    one_minus_h = one - h;
one_minus_y = one - y;
log_one_minus_h = log(one_minus_h);

J = (1/m) * ( (minus_y' * log_h) - (one_minus_y' * log_one_minus_h) );

      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      % D/Dtheta(J) = 1/m E[ (h - y) * X ]  
      % Gradiient setup
h_minus_y = h - y;
grad = (1/m) * X' * h_minus_y; 
% =============================================================

end
