function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n]=size(InitialMatrix);
  FeatureMatrix=zeros(m,n+1);
  # Assigning for each string in the matrix values of 0 and 1
  # If the string is of "furnished" type then the second for
  # will jump all next iterations with 1 unit, this way being
  # able to insert 2 numbers in one iteration.
  for i=1:m
  ok=0;
    for j=1:n
      p=InitialMatrix{i,j};
      if(isnumeric(p)==1)
        FeatureMatrix(i,j+ok)=p;
        continue;
      endif
      if(strcmp(p,"yes")==1)
          FeatureMatrix(i,j+ok)=1;
          continue;
      endif
      if(strcmp(p,"no")==1)
          FeatureMatrix(i,j+ok)=0;
          continue;
      endif
      disp(p);
      if(strcmp(p,"unfurnished")==1)
          FeatureMatrix(i,j+ok)=0;
          FeatureMatrix(i,j+1+ok)=1;
          ok=1;
          continue;
      endif
      if(strcmp(p,"semi-furnished")==1)
          FeatureMatrix(i,j+ok)=1;
          FeatureMatrix(i,j+1+ok)=0;
          ok=1;
          continue;
      endif
      if(strcmp(p,"furnished")==1)
          FeatureMatrix(i,j+ok)=0;
          FeatureMatrix(i,j+1+ok)=0;
          ok=1;
          continue;
      endif    
    endfor
  endfor
endfunction
