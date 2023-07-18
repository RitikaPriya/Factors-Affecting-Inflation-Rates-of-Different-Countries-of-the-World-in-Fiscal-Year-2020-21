reg Inflation Exports RealInterestRate DeathRateper1000 FuelImports Unemployement
pwcorr Unemployement FuelImports DeathRateper1000 RealInterestRate Exports
vif
imtest, white
estat hettest
 estat hettest Exports RealInterestRate DeathRateper1000 FuelImports Unemployement, mtest
reg Inflation Unemployement FuelImports DeathRateper1000 RealInterestRate Exports, robust
reg Inflation Unemployement FuelImports DeathRateper1000 RealInterestRate Exports, robust
reg Inflation Unemployement FuelImports RealInterestRate DeathRateper1000 Exports, robust
 corr Unemployement Political CrimeRate
ivregress 2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
estat endog
estat firststage
reg Unemployement Exports RealInterestRate DeathRateper1000 FuelImports Political CrimeRate
predict uhat, residual
ivregress 2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
estat overid
reg Inflation Exports RealInterestRate DeathRateper1000 FuelImports Unemployement
est store B_ols
ivregress 2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
est store B_iv
hausman B_iv B_ols
