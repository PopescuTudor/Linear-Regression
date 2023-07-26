function [Y, InitialMatrix] = parse_csv_file(file_path)

  file = fopen(file_path, 'r');
  
  %extrag linie cu linie datele din fisier, fara prima linie (header)
  data = textscan(file, '%s',  'HeaderLines', 1, 'Delimiter', '\n');
  
  %calculez nr. de linii si coloane
  col = length(strsplit(data{1}{1}, ','));
  lin = length(data{1});
  disp(lin);
  disp(col);
  
  %pt. fiecare linie din vectorul determinat anterior, o impart dupa virgule
  for i = 1:lin
    data{1}{i} = strsplit(data{1}{i}, ',');
  endfor

  %verific cate coloane din setul de date sunt numerice
  numeric_cols = false(1, col);
  for i = 1:col
      if ~isnan(str2double(data{1}{1}{i}))
        numeric_cols(i) = true; %vectorul acesta contine 1(true) acolo unde
                        % coloana respectiva din setul de date este numerica
      end
  end
  
  %elimin incapsularea facuta automat de textscan
  data = data{1};
  new_data = cell(lin, col);
  for i = 1:lin
    for j = 1:col
      new_data{i,j} = data{i}{j};
    endfor
  endfor
  
  %pt. fiecare astfel de coloana este transformata din string in numar,
  %iar apoi in celula pt. un cell matrix
  new_data(:,numeric_cols) = num2cell(str2double(new_data(:, numeric_cols)));

  InitialMatrix = new_data(:, 2:col); %matricea de predictori
  Y = cell2mat(new_data(:,1)); %vectorul cu valori de iesire

  fclose(file);
  
endfunction