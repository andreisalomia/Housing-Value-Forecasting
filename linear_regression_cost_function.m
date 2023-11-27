function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    [m n]=size(FeatureMatrix);
    Error=0;
    # Compute the error by applying the given formula
    for i=1:m
      sum=0;
      for j=1:n
        sum=sum+(Theta(j+1)*FeatureMatrix(i,j));
      endfor
      Error=Error+(sum-Y(i))^2;
    endfor
    
    Error=Error/(2*m);
endfunction
