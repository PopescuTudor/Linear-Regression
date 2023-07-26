function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  
  [lin col] = size(InitialMatrix);
  
  FeatureMatrix = [];
  for i = 1:col
    if strcmp(InitialMatrix{1,i}, "semi-furnished") ...
        || strcmp(InitialMatrix{1,i}, "unfurnished") ...
        || strcmp(InitialMatrix{1,i}, "furnished")
        %pt. fiecare coloana ce contine acesti predictori,
        %trebuie sa concatenam inca o coloana 
        %Astfel, putem realiza codificarea pe 2 biti
        FeatureMatrix = horzcat(FeatureMatrix, zeros(lin, 2));
    else
        FeatureMatrix = horzcat(FeatureMatrix, zeros(lin, 1));
    endif
  endfor
  
  %codificari
  for i = 1:lin
    %j_new este necesar pt ca FeatureMatrix va avea mai multe coloane decat 
    %InitialMatrix, iar j-ul ce va itera prin coloanele mat. initiale va ramane in urma
    j_new = 0; 
    for j = 1:col
      if strcmp(InitialMatrix{i,j}, "yes")
        FeatureMatrix(i,++j_new) = 1;
      elseif strcmp(InitialMatrix{i,j}, "no")  
        FeatureMatrix(i,++j_new) = 0;
      elseif strcmp(InitialMatrix{i,j}, "semi-furnished")
        FeatureMatrix(i,++j_new) = 1;
        FeatureMatrix(i,++j_new) = 0;
      elseif strcmp(InitialMatrix{i,j}, "unfurnished")
        FeatureMatrix(i,++j_new) = 0;
        FeatureMatrix(i,++j_new) = 1;
      elseif strcmp(InitialMatrix{i,j}, "furnished")
        FeatureMatrix(i,++j_new) = 0;
        FeatureMatrix(i,++j_new) = 0;
      else 
        FeatureMatrix(i, ++j_new) = InitialMatrix{i,j};
      endif
    endfor
  endfor
endfunction