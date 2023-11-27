function [Y, InitialMatrix] = parse_csv_file(file_path)
  pkg load io;
  # using io package for csv2cell function
  v={"yes";"no";"semi-furnished";"furnished";"unfurnished"};
  f = fopen(file_path,'r');
  InitialMatrix = csv2cell(file_path);
  [m n]=size(InitialMatrix);
  Y=zeros(m,1);
  for i=1:m
    for j=1:n
      p=InitialMatrix{i,j};
      # If i dont find one the strings then it must be a number
      if(strcmp(p,v(:))==1)
        InitialMatrix{i,j}=str2num(p);
      endif
    endfor
  endfor
  
  # Creating Y by extracting the first column
  for i=1:m
    p=(InitialMatrix{i,1});
    if isnumeric(p)==1
      Y(i)=p;
    endif
  endfor
  
  Y(1)=[];
  InitialMatrix(1,:)=[];
  InitialMatrix(:,1)=[];
  
  
  fclose(f);
endfunction
