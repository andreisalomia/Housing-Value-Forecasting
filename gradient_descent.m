function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta=zeros(n+1,1);
  while(1)
  iter--;
  for j=1:n
  # Computing theta using multiple iterations and applying the given formula
    big_sum=0;
    for i=1:m
      big_sum=big_sum+((Theta(j+1)*FeatureMatrix(i,j)-Y(i))*FeatureMatrix(i,j));
    endfor
    big_sum=(1/m)*big_sum;
    Theta(j+1)=Theta(j+1)-alpha*big_sum;
  endfor
  
  if(iter==0)
    break;
  endif
  
  endwhile
  
endfunction
