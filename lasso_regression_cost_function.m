function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m n]=size(FeatureMatrix);
  # Find the error by applying the formula on the FeatureMatrix and on the
  # outputs column
    aux=0;
    for i=1:m
    sum=0;
    for j=1:n
    sum=sum+(Theta(j+1)*FeatureMatrix(i,j));
    endfor
    aux=aux+(-sum+Y(i))^2;
    endfor
    
    aux=aux/m;
    sum=0;
    for j=1:(n+1)
      sum=sum+norm(Theta(j));
    endfor
    sum=lambda*sum;
    Error=aux+sum;
endfunction
