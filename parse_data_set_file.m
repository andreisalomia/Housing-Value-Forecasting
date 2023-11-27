function [Y, InitialMatrix] = parse_data_set_file(file_path)
  f = fopen(file_path, 'r');
  format = '%d';
  m = fscanf(f, format, 1);
  n = fscanf(f, format, 1);
  InitialMatrix = cell(m, n);
  Y = ones(m, 1);
  
  for i = 1:m
    for j = 1:(n+1)
      p = fscanf(f, '%s', 1);
      # Checking if the last read element is contains only letters
      # If the element does not contain letters then I transform the
      # string into a number
      s = isstrprop(p, "alpha");
      if s == 0
        InitialMatrix{i, j} = str2num(p);
      else
        InitialMatrix{i, j} = p;
      endif  
    endfor
  endfor
  
  # Y will be the first column of the InitialMatrix
  for i = 1:m
    Y(i) = InitialMatrix{i, 1};
  endfor
  
  # Deleting the extracted Y
  InitialMatrix(:, 1) = [];
  
  fclose(f);
endfunction

