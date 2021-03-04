function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

    % compute   Y      = h( X * all_theta')
    %        (5000x10)
z = X * all_theta';
Y = sigmoid(z);

    % use max() to fill p with the INDEX of the max value from each row of Y
    % Note: If you only use 1 output argument max() 
    %       returns the max VALUES of each row. But if you
    %       call max with 2 output arguemtns, the 2nd argument 
    %       gets the INDEX of the 1st occurence of the max 
    %       value. Hence p must be the 2nd output argument. 
[predictions p] = max(Y, [], 2);

    % Randomly select 100 rows from p to display
    % I did this as a sanity check to make sure that 
    % I was indeed getting different vlaues for the 
    % predicted classes. 
rand_indices = randperm(m); % m is the number of training examples, this is fine
printf('100 random entries from p: \n');
display( p(rand_indices(1:100), :) );

% =========================================================================


end
