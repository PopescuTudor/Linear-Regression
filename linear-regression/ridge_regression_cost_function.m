function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
    Theta(1,:) = []; %elimin theta0 = 0
    m = length(Y); %nr de antrenamente
    
    %ecuatia costului Ridge extrasa din enunt
    Error = (1/(2*m)) * sum((FeMatrix * Theta - Y).^2) + lambda * sum(Theta(:).^2);
endfunction