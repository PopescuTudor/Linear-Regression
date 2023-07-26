function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  
  Theta(1,:) = []; %elimin theta0 = 0
  
  m = length(Y); %nr de antrenamente
  
  %ecuatia costului Lasso extrasa din enunt
  Error = (1 / m) * sum((Y - FeMatrix*Theta).^2) + lambda * sum(abs(Theta(:)));
endfunction