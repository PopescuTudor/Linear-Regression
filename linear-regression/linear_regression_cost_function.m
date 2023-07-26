function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  
  Theta(1,:) = []; %elimin theta0 = 0;
  m = length(Y);  % nr. de antrenamente
  h = FeatureMatrix*Theta;  % predictia
  Error = (1/(2*m)) * sum((h - Y).^2);   %functia de cost preluata din enunt

endfunction