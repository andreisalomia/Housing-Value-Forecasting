function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
    A=(FeatureMatrix')*(FeatureMatrix);
    ok=0;
    [m n]=size(FeatureMatrix);
    Theta=zeros(n,1);
    
    # Checking if it's a positive definite matrix
    E=eig(A);
    if(all(E)>0)
    	check=1;
    else
    	check=0;
    endif
	
    if(check==0)
    	ok=1;
      Theta=[0; Theta];
      return;
    endif

    if check==1
    b=(FeatureMatrix')*Y;
    
    # Performing the conjugate gradient method
    r=b-A*Theta;
    disp(r'*r);
    v=r;
    tol_sq=tol*tol;
    k=1;
    while((k<=iter)&&((r')*r>tol_sq)&&ok==0)
    k++;
    r_copy=r;
    tk=((r')*r)/((v')*A*v);
    Theta=Theta+tk*v;
    r=r-tk*A*v;
    sk=(r'*r)/(r_copy'*r_copy);
    v=r+sk*v;
    endwhile
  Theta=[0; Theta];
  endif
endfunction
