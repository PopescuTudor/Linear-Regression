function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);

  for i = 1:iter
      %calculez predictia pt. theta curent si matricea de predictori
      H = FeatureMatrix * Theta;

      %calculez eroarea (diferenta dintre predictie si valorile de iesire
      error = H - Y;

      %ecuatia gradientului
      gradient = (1/m) * FeatureMatrix' * error;

      % actualizez theta folosind rata de invatare alpha si gradientul calculat
      Theta = Theta - alpha * gradient;
  end
  Theta = [0; Theta]; %adaug theta0 stabilit in enunt (=0)
endfunction