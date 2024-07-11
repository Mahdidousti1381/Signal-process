function CoefficientCorrelation= corr_2d(X,Y)
 Numerator=sum(X.*Y);
 Dominator=sqrt(sum(X.*X).*sum(Y.*Y));
 CoefficientCorrelation=Numerator/Dominator;
end