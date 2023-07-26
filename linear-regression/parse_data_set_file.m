function [Y, InitialMatrix] = parse_data_set_file(file_path)
  
  fid = fopen(file_path, 'r');
  dimensions = fscanf(fid, '%d', [1, 2]);
  
  %extrag linie cu linie datele din fisier
  data = textscan(fid, '%s', 'Delimiter', '\n');
  
  fclose(fid);

  %gasesc nr. de coloane in setul de date
  num_cols = dimensions(2) + 1;
  
  %pt. fiecare linie din vectorul determinat anterior, o impart dupa spatii
  parsed_data = cellfun(@(x) strsplit(x, ' '), data{1}, 'UniformOutput', false);
  parsed_data = vertcat(parsed_data{:});
  
  %verific cate coloane din setul de date sunt numerice
  num_cols = size(parsed_data, 2);
  
  numeric_cols = false(1, num_cols);
  for i = 1:num_cols
      if ~isnan(str2double(parsed_data{1,i}))
        numeric_cols(i) = true; %vectorul acesta contine 1(true) acolo unde
                        % coloana respectiva din setul de date este numerica
      end
  end
  
  %pt. fiecare astfel de coloana este transformata din string in numar,
  %iar apoi in celula pt. un cell matrix
  parsed_data(:,numeric_cols) = num2cell(str2double(parsed_data(:,numeric_cols)));
  
  Y = parsed_data(:,1); %vectorul cu valori de iesire
  Y = cell2mat(Y);
  parsed_data(:, 1) = [];
  InitialMatrix = parsed_data; %matricea de predictori
  
  
endfunction