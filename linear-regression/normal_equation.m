function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)

  b = FeaturesMatrix' * Y; %vectorul rezultatul al sistemului

  A = FeaturesMatrix' * FeaturesMatrix; %matricea sistemului


  [lin col] = size(A);
  [linf colf] = size(FeaturesMatrix)	

  Theta = zeros(colf, 1);
  %verific daca matricea sistemului este pozitiv definita
  if issymmetric(A) == 1 && all(eig(A) > 0) == 1
    
  	%initializari inainte de while loop
	  Theta_prev = Theta;

	  r = b - A * Theta;

	  v = r;

	  r_prev = r;

	  tol_sq = tol*tol;
	  k = 1;
    
    %algoritmul Normal Equation (descris in README)
	  while k < iter && r_prev' * r_prev > tol_sq
	    matt = v'*A;

	    t = (r_prev' * r_prev)/(matt*v);

	    Theta = Theta_prev + t*v;
	    Theta_prev = Theta;

	    r = r_prev - t*A*v;

	    sk = (r' * r)/(r_prev' * r_prev);
	    r_prev = r;


	    v = r + sk * v;

	    k = k + 1;

  	endwhile
  endif
  Theta = [0; Theta]; %adaug theta0, stabilit in enunt (=0)
endfunction