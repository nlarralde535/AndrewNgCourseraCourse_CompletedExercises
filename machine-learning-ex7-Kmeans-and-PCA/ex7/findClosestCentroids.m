function CentroidIndex = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   CentroidIndex = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
m = size(X, 1);

% You need to return the following variables correctly.
% CentroidIndex :: (m x 1) vector of centroid assignments (i.e. each entry in range [1..K])
%     each ROW corresponds to a training example and 
%     each ENTRY is the index/value/label [1...K] of the Centroid 
%         closest to that training example
CentroidIndex  = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside CentroidIndex at the appropriate location.
%               Concretely, CentroidIndex(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i = 1:m
    current_example = X(i, :);
    
      %FIRST calculation of nearest centroid
    centroid_muJ = centroids(1, :);
    current_example_MINUS_muJ = current_example - centroid_muJ; 
    magnitude = current_example_MINUS_muJ * current_example_MINUS_muJ';
        %{ must keep track of
         %   magnitude computed:             magnitude_thereof
         %   current minimum:                minimum_magnitude
         %   centroid index of current min:  min_mag_Centroid_index
        %}
    current_minimum_magnitude_AND_CentroidIndex_VECTOR = [magnitude, 1];
      
      %SUBSEQUENT calculations and comparisons
    for j = 2:K
        centroid_muJ = centroids(j, :);
        current_example_MINUS_muJ = current_example - centroid_muJ; 
        magnitude = current_example_MINUS_muJ * current_example_MINUS_muJ';
        if(magnitude < current_minimum_magnitude_AND_CentroidIndex_VECTOR(1,1))
            current_minimum_magnitude_AND_CentroidIndex_VECTOR = [magnitude, j];
        endif   
    end
      
      %ASSIGN the discovered nearest Centroid index to CentroidIndex(i)
    CentroidIndex(i) = current_minimum_magnitude_AND_CentroidIndex_VECTOR(1,2);
end

% =============================================================

end

