function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m n]=size(FeatureMatrix);
  # Finding the error by applying the given formula on the featureMatrix
  # and on the outputs column
    aux=0;
    for i=1:m
    sum=0;
    for j=1:n
    sum=sum+(Theta(j+1)*FeatureMatrix(i,j));
    endfor
    aux=aux+(sum-Y(i))^2;
    endfor
    
    aux=aux/(2*m);
    sum=0;
    for j=1:(n+1)
      sum=sum+(Theta(j))^2;
    endfor
    sum=lambda*sum;
    Error=aux+sum;
endfunction
