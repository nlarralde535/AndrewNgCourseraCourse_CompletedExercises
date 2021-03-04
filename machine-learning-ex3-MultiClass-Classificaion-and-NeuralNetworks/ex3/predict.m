function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

    % add the bias term(s) to X
X_1 = [ones(m, 1) X];

a1 = X_1 * Theta1';

    % add the bias term(s) to a1
a2 = [ones(m,1) a1];
a2 = a2 * Theta2';

    % use max() to fill p with the INDEX of the max value from each row of Y
    % Note: If you only use 1 output argument max() 
    %       returns the max VALUES of each row. But if you
    %       call max with 2 output arguemtns, the 2nd argument 
    %       gets the INDEX of the 1st occurence of the max 
    %       value. Hence p must be the 2nd output argument. 
[predictions p] = max(a2, [], 2);






% =========================================================================


end
