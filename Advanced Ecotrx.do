*A simple MLRM regression*
reg Inflation Exports RealInterestRate DeathRateper1000 FuelImports Unemployement
*To find the pair wise correlation*
pwcorr Unemployement FuelImports DeathRateper1000 RealInterestRate Exports
*To find the variance inflationg factor*
vif
imtest, white
*To check for heteroscadasticity*
estat hettest
estat hettest Exports RealInterestRate DeathRateper1000 FuelImports Unemployement, mtest
*Robust command to take care of the heteroscadasticity
reg Inflation Unemployement FuelImports DeathRateper1000 RealInterestRate Exports, robust
*The corelation betweem unemployment and its potential IV political instability and crime rate
corr Unemployement Political CrimeRate
*Running the 2SLS regression taking political instability and Crime Rate as IV.
2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
*Checking the endoginity present
estat endog
*Checking up the first stage regression in 2 stage linear regression
estat firststage
*Second stage regression
reg Unemployement Exports RealInterestRate DeathRateper1000 FuelImports Political CrimeRate
*Predicting the residuals 
predict uhat, residual
ivregress 2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
*Checking for overestimation
estat overid
*Storing the coefficiant of ols regression
reg Inflation Exports RealInterestRate DeathRateper1000 FuelImports Unemployement
est store B_ols
*Storing the iv coefficiant
ivregress 2sls Inflation Exports RealInterestRate DeathRateper1000 FuelImports (Unemployement = Political CrimeRate)
est store B_iv
*Comparing ols and iv coefficiants
hausman B_iv B_ols
