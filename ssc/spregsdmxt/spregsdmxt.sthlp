{smcl}
{hline}
{cmd:help: {helpb spregsdmxt}}{space 50} {cmd:dialog:} {bf:{dialog spregsdmxt}}
{hline}

{bf:{err:{dlgtab:Title}}}

{bf:spregsdmxt: Maximum Likelihood Estimation Spatial Durbin Panel Regression}

{marker 00}{bf:{err:{dlgtab:Table of Contents}}}
{p 4 8 2}

{p 5}{helpb spregsdmxt##01:Syntax}{p_end}
{p 5}{helpb spregsdmxt##02:Description}{p_end}
{p 5}{helpb spregsdmxt##03:Options}{p_end}
{p 5}{helpb spregsdmxt##04:Spatial Panel Aautocorrelation Tests}{p_end}
{p 5}{helpb spregsdmxt##05:Model Selection Diagnostic Criteria}{p_end}
{p 5}{helpb spregsdmxt##06:Heteroscedasticity Tests}{p_end}
{p 5}{helpb spregsdmxt##07:Non Normality Tests}{p_end}
{p 5}{helpb spregsdmxt##08:Saved Results}{p_end}
{p 5}{helpb spregsdmxt##09:References}{p_end}

{p 1}*** {helpb spregsdmxt##10:Examples}{p_end}

{p 5}{helpb spregsdmxt##11:Authors}{p_end}

{p2colreset}{...}
{marker 01}{bf:{err:{dlgtab:Syntax}}}

{p 5 5 6}
{opt spregsdmxt} {depvar} {indepvars} {weight} , {bf:{err:nc(#)}} {p_end} 
{p 3 5 6} 
{err: [} {opt wmf:ile(weight_file)} {opt lmsp:ac} {opt lmh:et} {opt lmn:orm} {opt diag} {opt test:s}{p_end} 
{p 5 5 6} 
{opt stand inv inv2} {opt dist(norm|exp|weib)} {opt mfx(lin, log)} {opt aux(varlist)}{p_end} 
{p 5 5 6} 
{opt mhet(varlist)} {opt nocons:tant} {opt pred:ict(new_var)} {opt res:id(new_var)}{p_end} 
{p 5 5 6} 
{opt iter(#)} {opt tech(name)} {opt ll(real 0)} {opt tobit coll zero tolog nolog robust} {opt l:evel(#)}{p_end} 
{p 5 5 6} 
{opth vce(vcetype)} {helpb maximize} {it:other maximization options} {err:]}{p_end}

{p2colreset}{...}
{marker 02}{bf:{err:{dlgtab:Description}}}

 {cmd:spregsdmxt} estimates MLE Spatial Durbin Panel Regression Models

 {cmd:spregsdmxt} can estimate the following models:
   1- Heteroscedastic Regression Models in disturbance term.
   2- Non Normal Regression Models in disturbance term.

 {cmd:spregsarxt} estimates Continuous and Truncated Dependent Variables models {cmd:tobit}.

{p 2 2 2} {cmd:spregsdmxt} deals with data either continuous or truncated dependent variable. If {depvar} has missing values or lower limits,
so in this case {cmd:spregsdmxt} will fit spatial panel model via {helpb tobit}
model, and thus {cmd:spregsdmxt} can resolve the problem of missing values that exist in many kinds of data.
Otherwise, in the case of continuous data, the normal estimation will be used.{p_end}

{p 2 4 2}{cmd:spregsdmxt} can generate:{p_end}
    {cmd:- Binary / Standardized Weight Matrix.}
    {cmd:- Inverse  / Inverse Squared Standardized Weight Matrix.}
    {cmd:- Binary / Standardized / Inverse Eigenvalues Variable.}

{p 2 4 2} {cmd:spregsdmxt} predicted values are obtained from conditional expectation expression.{p_end}

{pmore2}{bf:Yh = E(y|x) = inv(I-Rho*W) * X*Beta}

{p 3 4 2} R2, R2 Adjusted, and F-Test, are obtained from 4 ways:{p_end} 
{p 5 4 2} 1- (Buse 1973) R2.{p_end}
{p 5 4 2} 2- Raw Moments R2.{p_end}
{p 5 4 2} 3- squared correlation between predicted (Yh) and observed dependent variable (Y).{p_end}
{p 5 4 2} 4- Ratio of variance between predicted (Yh) and observed dependent variable (Y).{p_end}

{p 5 4 2} - Adjusted R2: R2_a=1-(1-R2)*(N-1)/(N-K-1).{p_end}
{p 5 4 2} - F-Test=R2/(1-R2)*(N-K-1)/(K).{p_end}

{bf:{err:*** Important Notes:}}
{cmd:spregsdmxt} generates some variables names with prefix:
{cmd:w1x_ , w2x_ , w3x_ , w4x_ , w1y_ , w2y_ , mstar_ , spat_}
{cmd:So, you must avoid to include variables names with thes prefixes}

{p2colreset}{...}
{marker 03}{bf:{err:{dlgtab:Options}}}

{col 3}* {cmd: {opt nc(#)}{col 20} Number of Cross Sections Units}
{col 3} {err:Time series observations must be Balanced in each Cross Section}

{col 3}{opt wmf:ile(weight_file)}{col 20} Open CROSS SECTION weight matrix file.
{col 20}{cmd:spregsdmxt} will convert automatically spatial cross section weight matrix
{col 20}to spatial PANEL weight matrix.

	Spatial Weight Matrix file must be:
	 1- [SxS] Cross Sections units Dimentions, and not Panel dimentions
	 2- Square Matrix
	 3- Symmetric Matrix (Optional) 

{col 3}Spatial Panel Weight Matrix has two types: Standardized and binary weight matrix.

{col 3}{opt stand}{col 20}Use Standardized Panel Weight Matrix, (each row sum equals 1)
{col 20}Default is Binary spatial panel weight matrix which each element is 0 or 1

{col 3}{opt inv}{col 20}Use Inverse Standardized Weight Matrix (1/W)

{col 3}{opt inv2}{col 20}Use Inverse Squared Standardized Weight Matrix (1/W^2)

{col 3}{opt zero}{col 20}convert missing values observations to Zero

{col 3}{opt coll}{col 20}keep collinear variables; default is removing collinear variables.

{col 3}{opt nocons:tant}{col 20}Exclude Constant Term from Equation

{col 3}{opt test:s}{col 20}display ALL lmh, lmn, lmsp, diag tests

{col 3}{opt tobit}{col 20}Estimate model via Tobit regression 

{col 3}{opt ll(#)}{col 20}value of minimum left-censoring dependent variable with:
{col 20} {bf:({err:{it:tobit}})}; default is 0

{col 3}{opt mfx(lin, log)}{col 20}functional form: Linear model {cmd:(lin)}, or Log-Log model {cmd:(log)},
{col 20}to compute Total, Direct, and InDirect Marginal Effects and Elasticities
   - In Linear model: marginal effects are the coefficients (Bm),
        and elasticities are (Es = Bm X/Y).
   - In Log-Log model: elasticities are the coefficients (Es),
        and the marginal effects are (Bm = Es Y/X).
   - {opt mfx(log)} and {opt tolog} options must be combined, to transform linear variables to log form.

{p 8 4 2}{opt mfx(lin, log)} calculates:{p_end}
		{cmd:- Total    Marginal Effects and Elasticities.}
		{cmd:- Direct   Marginal Effects and Elasticities.}
		{cmd:- InDirect Marginal Effects and Elasticities.}

{col 3}{opt tolog}{col 20}Convert dependent and independent variables
{col 20}to LOG Form in the memory for Log-Log regression.
{col 20}{opt tolog} Transforms {depvar} and {indepvars}
{col 20}to Log Form without lost the original data variables

{synopt :{bf:dist({err:{it:norm, exp, weib}})} Distribution of error term:}{p_end}
{p 12 2 2}1- {bf:dist({err:{it:norm}})} Normal distribution; default.{p_end}
{p 12 2 2}2- {bf:dist({err:{it:exp}})}  Exponential distribution.{p_end}
{p 12 2 2}3- {bf:dist({err:{it:weib}})} Weibull distribution.{p_end}

{p 10 10 1}{cmd:dist} option is used to remedy non normality problem, when the error term has non normality distribution.{p_end}
{p 10 10 1}{bf:dist({err:{it:norm}})} is the default distribution.{p_end}

{p 1 15 1}{opt aux(varlist)} add Auxiliary Variables into regression model without converting them to spatial lagged variables, or without {cmd:log} form, i.e., dummy variables.
This option dont include these auxiliary variables among spatial lagged variables, it is useful to avoid lost degrees of freedom (DF).
Using many dummy variables must be used with caution to avoid multicollinearity problem.{p_end}

{p 1 15 1}{opt mhet(varlist)} Set variable(s) that will be included in {cmd:Spatial Panel Multiplicative Heteroscedasticity} model, to remidy Heteroscedasticity.
option {weight}, can be used in the case of Heteroscedasticity in errors.{p_end}

{col 3}{opt pred:ict(new_variable)}{col 30}Predicted values variable

{col 3}{opt res:id(new_variable)}{col 30}Residuals values variable
{col 15} computed as Ue=Y-Yh ; that is known as combined residual: [Ue = U_i + E_it]
{col 15} in xtreg models overall error component is computed as: [E_it]
{col 15} see: {help xtreg postestimation##predict}

{col 3}{opt rob:ust}{col 20}Huber-White standard errors

{col 3}{opt tech(name)}{col 20}technique algorithm for maximization of the log likelihood function LLF
{col 8}{cmdab:tech(nr)}{col 20}Newton-Raphson (NR) algorithm; default
{col 8}{cmdab:tech(bhhh)}{col 20}Berndt-Hall-Hall-Hausman (BHHH) algorithm
{col 8}{cmdab:tech(dfp)}{col 20}Davidon-Fletcher-Powell (DFP) algorithm
{col 8}{cmdab:tech(bfgs)}{col 20}Broyden-Fletcher-Goldfarb-Shanno (BFGS) algorithm

{col 3}{opt iter(#)}{col 20}maximum iterations; default is 100
{col 20} if {opt iter(#)} is reached (100), this means convergence not achieved yet,
{col 20} so you can use another technique algorithm to converge LLF function
{col 20} or exceed number of maximum iterations more than 100.

{synopt :{opth vce(vcetype)} {opt ols}, {opt r:obust}, {opt cl:uster}, {opt boot:strap}, {opt jack:knife}, {opt hc2}, {opt hc3}}{p_end}

{col 3}{opt level(#)}{col 20}confidence intervals level; default is level(95)

{p 2 4 2}{help maximize:Other maximization_options} allows the user to specify other maximization options (e.g., difficult, trace, iterate(#), etc.).  
However, you should rarely have to specify them, though they may be helpful if parameters approach boundary values.

{p2colreset}{...}
{marker 04}{bf:{err:{dlgtab:Spatial Panel Aautocorrelation Tests}}}

{synopt :{opt lmsp:ac} Spatial Panel Aautocorrelation Tests:}{p_end}
	* Ho: Error has No Spatial AutoCorrelation
	  Ha: Error has    Spatial AutoCorrelation
	    - GLOBAL Moran MI Test
	    - GLOBAL Geary GC Test
	    - GLOBAL Getis-Ords GO Test
	    - Moran MI Error Test
	    - LM Error [SEM] (Burridge) Test
	    - LM Error [SEM] (Robust) Test
	* Ho: Spatial Lagged Dependent Variable has No Spatial AutoCorrelation
	  Ha: Spatial Lagged Dependent Variable has    Spatial AutoCorrelation
	    - LM Lag [SAR]  (Anselin) Test
	    - LM Lag [SAR]  (Robust) Test
	* Ho: No General Spatial AutoCorrelation
	  Ha:    General Spatial AutoCorrelation
	    - LM SAC   (LMErr+LMLag_R) Test
	    - LM SAC   (LMLag+LMErr_R) Test

{synopt :Definitions:}{p_end}

   - Spatial autocorrelation: chock in one country affects neighboring countries

   - Spatial autocorrelation: is correlation of a variable with itself in space.

   - Spatial Lag Model:     Y = BX + rWy + e         ; e = lWe+u
   - Spatial Error Model:   Y = BX + e               ; e = lWe+u
   - Spatial Durbin Model:  Y = BX + aWX* + rWy + e  ; e = lWe+u
   - General Spatial Model: Y = BX + rWy  + LW1y + e ; e = lW1e+u
   - General Spatial Model: Y = BX + rWy  + LW1y + e ; e = lW1e+u

   - General Spatial Model is used to deal with both types of spatial dependence,
     namely Spatial Lag Dependence and Spatial Error Dependence

   - Spatial Error Model is used to handle the spatial dependence due to
     the omitted variables or errors in measurement through the error term

   - Spatial Autoregressive Model (SAR) is also known as Spatial Lag Model

   - Positive spatial autocorrelation exists when high values correlate
     with high neighboring values or when low values correlate with low
     neighboring values

   - Negative spatial autocorrelation exists when high values correlate
     with low neighboring values and vice versa.

   - presence of positive spatial autocorrelation results in a loss of information,
     which is related to greater uncertainty, less precision, and larger standard errors.

   - Spatial autocorrelation coefficients (in contrast to their counterparts in time)
     are not constrained by -1/+1. Their range depends on the choice of weights matrix.

   - Spatial dependence exists when the value associated with one location
     is dependent on those of other locations.

   - Spatial heterogeneity exists when structural changes related to location
     exist in a dataset, it can result in non-constant error variance
     (heteroscedasticity) across areas, especially when scale-related
     measurement errors are present.

   - Spatial regression models are statistical models that account for
     the presence of spatial effects, i.e., spatial autocorrelation
     (or more generally spatial dependence) and/or spatial heterogeneity.

   - if LM test for spatial lag is more significant than LM test for spatial error,
     and robust LM test for spatial lag is significant but robust LM test for
     spatial error is not, then the appropriate model is spatial lag model.
     Conversely, if LM test for spatial error is more significant than LM test
     for spatial lag and robust LM test for spatial error is significant
     but robust LM test for spatial lag is not, then the appropriate specification
     is spatial error model, [Anselin-Florax (1995)].
	
   - robust versions of Spatial LM tests are considered only when
     standard versions (LM-Lag or LM-Error) are significant
	
   - General Spatial Model is used to deal with both types of spatial dependence,
     namely spatial lag dependence and spatial error dependence
	
   - Spatial Error Model is used to handle spatial dependence due to omitted
     variables or errors in measurement through the error term
	
   - Spatial Autoregressive Model (SAR) is also known as Spatial Lag Model

{p2colreset}{...}
{marker 05}{bf:{err:{dlgtab:Panel Model Selection Diagnostic Criteria}}}

{synopt :{opt diag} Spatial Panel Model Selection Diagnostic Criteria:}{p_end}
        - Log Likelihood Function                   LLF
        - Akaike Information Criterion              (1974) AIC
        - Akaike Information Criterion              (1973) Log AIC
        - Schwarz Criterion                         (1978) SC
        - Schwarz Criterion                         (1978) Log SC
        - Amemiya Prediction Criterion              (1969) FPE
        - Hannan-Quinn Criterion                    (1979) HQ
        - Rice Criterion                            (1984) Rice
        - Shibata Criterion                         (1981) Shibata
        - Craven-Wahba Generalized Cross Validation (1979) GCV

{p2colreset}{...}
{marker 06}{bf:{err:{dlgtab:Panel Heteroscedasticity Tests}}}

{synopt :{opt lmh:et} Spatial Panel Heteroscedasticity Tests:}{p_end}
	* Ho: Panel Homoscedasticity - Ha: Panel Heteroscedasticity
	- Engle LM ARCH Test AR(1) E2 =E2_1
	- Hall-Pagan LM Test:  E2 = Yh
	- Hall-Pagan LM Test:  E2 = Yh2
	- Hall-Pagan LM Test:  E2 = LYh2
	- Harvey LM Test:    LogE2 = X
	- Wald Test:         LogE2 = X
	- Glejser LM Test:    |E| = X
	- Machado-Santos-Silva LM Test: Ev= Yh Yh2
	- Machado-Santos-Silva LM Test: Ev= X
	- Breusch-Godfrey Test: E = E_1 X
	- White Test - Koenker(R2): E2 = X
	- White Test - B-P-G (SSR): E2 = X
	- White Test - Koenker(R2): E2 = X X2
	- White Test - B-P-G (SSR): E2 = X X2
	- White Test - Koenker(R2): E2 = X X2 XX
	- White Test - B-P-G (SSR): E2 = X X2 XX
	- Cook-Weisberg LM Test E = Yh
	- Cook-Weisberg LM Test E = X
	*** Single Variable Tests
		- Cook-Weisberg LM Test: E = xi
		- King LM Test: E = xi

	*** Groupwise Panel Heteroscedasticity Tests
	* Ho: Panel Homoscedasticity - Ha: Panel Groupwise Heteroscedasticity
		- Lagrange Multiplier LM Test
		- Likelihood Ratio LR Test
		- Wald Test

	*** Panel Tobit Model Heteroscedasticity LM Tests
 		- Separate LM Tests - Ho: Homoscedasticity
		- Joint LM Test     - Ho: Homoscedasticity

{p2colreset}{...}
{marker 07}{bf:{err:{dlgtab:Panel Non Normality Tests}}}

{synopt :{opt lmn:orm} Spatial Panel Non Normality Tests:}{p_end}
	* Ho: Panel Normality - Ha: Panel Non Normality
	*** Non Normality Tests:
		- Jarque-Bera LM Test
		- White IM Test
		- Doornik-Hansen LM Test
		- Geary LM Test
		- Anderson-Darling Z Test
		- D'Agostino-Pearson LM Test
	*** Skewness Tests:
		- Srivastava LM Skewness Test
		- Small LM Skewness Test
		- Skewness Z Test
		- Skewness Coefficient - Standard Deviation
	*** Kurtosis Tests:
		- Srivastava Z Kurtosis Test
		- Small LM Kurtosis Test
		- Kurtosis Z Test
    		- Kurtosis Coefficient - Standard Deviation
	*** Runs Tests:
    		- Runs Test:
		- Standard Deviation Runs Sig(k) - Mean Runs E(k)
    		- 95% Conf. Interval [E(k)+/- 1.96* Sig(k)]
	*** Tobit Panel Non Normality Tests
		*** LM Test - Ho: No Skewness
		*** LM test - Ho: No Kurtosis
		*** LM Test - Ho: Normality (No Kurtosis, No Skewness)
		    - Pagan-Vella LM Test
		    - Chesher-Irish LM Test

{p2colreset}{...}
{marker 08}{bf:{err:{dlgtab:Saved Results}}}

{p 2 4 2 }Depending on the model estimated, {cmd:spregsdmxt} saves the following results in {cmd:e()}:

Scalars

{err:*** Spatial Panel Aautocorrelation Tests:}
{col 4}{cmd:e(mig)}{col 20}GLOBAL Moran MI Test
{col 4}{cmd:e(migp)}{col 20}GLOBAL Moran MI Test P-Value
{col 4}{cmd:e(gcg)}{col 20}GLOBAL Geary GC Test
{col 4}{cmd:e(gcgp)}{col 20}GLOBAL Geary GC Test P-Value
{col 4}{cmd:e(gog)}{col 20}GLOBAL Getis-Ords Test GO
{col 4}{cmd:e(gogp)}{col 20}GLOBAL Getis-Ords GO Test P-Value
{col 4}{cmd:e(mi1)}{col 20}Moran MI Error Test
{col 4}{cmd:e(mi1p)}{col 20}Moran MI Error Test P-Value
{col 4}{cmd:e(lmerr)}{col 20}LM Error (Burridge) Test
{col 4}{cmd:e(lmerrp)}{col 20}LM Error (Burridge) Test P-Value
{col 4}{cmd:e(lmerrr)}{col 20}LM Error (Robust) Test
{col 4}{cmd:e(lmerrrp)}{col 20}LM Error (Robust) Test P-Value
{col 4}{cmd:e(lmlag)}{col 20}LM Lag (Anselin) Test
{col 4}{cmd:e(lmlagp)}{col 20}LM Lag (Anselin) Test P-Value
{col 4}{cmd:e(lmlagr)}{col 20}LM Lag (Robust) Test
{col 4}{cmd:e(lmlagrp)}{col 20}LM Lag (Robust) Test P-Value
{col 4}{cmd:e(lmsac1)}{col 20}LM SAC (LMLag+LMErr_R) Test
{col 4}{cmd:e(lmsac1p)}{col 20}LM SAC (LMLag+LMErr_R) Test P-Value
{col 4}{cmd:e(lmsac2)}{col 20}LM SAC (LMErr+LMLag_R) Test
{col 4}{cmd:e(lmsac2p)}{col 20}LM SAC (LMErr+LMLag_R) Test P-Value

{err:*** Spatial Panel Model Selection Diagnostic Criteria:}

{col 4}{cmd:e(N)}{col 20}number of observations
{col 4}{cmd:e(r2bu)}{col 20}R-squared (Buse 1973)
{col 4}{cmd:e(r2bu_a)}{col 20}R-squared Adj (Buse 1973)
{col 4}{cmd:e(r2raw)}{col 20}Raw Moments R2
{col 4}{cmd:e(r2raw_a)}{col 20}Raw Moments R2 Adj
{col 4}{cmd:e(f)}{col 20}F-test
{col 4}{cmd:e(fp)}{col 20}F-test P-Value
{col 4}{cmd:e(wald)}{col 20}Wald-test
{col 4}{cmd:e(waldp)}{col 20}Wald-test P-Value
{col 4}{cmd:e(r2h)}{col 20}R2 Between Predicted (Yh) and Observed DepVar (Y)
{col 4}{cmd:e(r2h_a)}{col 20}Adjusted r2h
{col 4}{cmd:e(fh)}{col 20}F-test due to r2h
{col 4}{cmd:e(fhp)}{col 20}F-test due to r2h P-Value
{col 4}{cmd:e(r2v)}{col 20}R2 Variance Ratio Between Predicted (Yh) and Observed DepVar (Y)
{col 4}{cmd:e(r2v_a)}{col 20}Adjusted r2v
{col 4}{cmd:e(fv)}{col 20}F-test due to r2v
{col 4}{cmd:e(fvp)}{col 20}F-test due to r2v P-Value
{col 4}{cmd:e(sig)}{col 20}Root MSE (Sigma)

{col 4}{cmd:e(llf)}{col 20}Log Likelihood Function{col 62}LLF
{col 4}{cmd:e(aic)}{col 20}Akaike Information Criterion{col 62}(1974) AIC
{col 4}{cmd:e(laic)}{col 20}Akaike Information Criterion{col 62}(1973) Log AIC
{col 4}{cmd:e(sc)}{col 20}Schwarz Criterion{col 62}(1978) SC
{col 4}{cmd:e(lsc)}{col 20}Schwarz Criterion{col 62}(1978) Log SC
{col 4}{cmd:e(fpe)}{col 20}Amemiya Prediction Criterion{col 62}(1969) FPE
{col 4}{cmd:e(hq)}{col 20}Hannan-Quinn Criterion{col 62}(1979) HQ
{col 4}{cmd:e(rice)}{col 20}Rice Criterion{col 62}(1984) Rice
{col 4}{cmd:e(shibata)}{col 20}Shibata Criterion{col 62}(1981) Shibata
{col 4}{cmd:e(gcv)}{col 20}Craven-Wahba Generalized Cross Validation (1979) GCV

{err:*** Spatial Panel Heteroscedasticity Tests:}
{col 4}{cmd:e(lmharch)}{col 20}Engle LM ARCH Test AR(1)
{col 4}{cmd:e(lmharchp)}{col 20}Engle LM ARCH Test AR(1) P-Value
{col 4}{cmd:e(lmhhp1)}{col 20}Hall-Pagan LM Test E2 = Yh
{col 4}{cmd:e(lmhhp1p)}{col 20}Hall-Pagan LM Test E2 = Yh P-Value
{col 4}{cmd:e(lmhhp2)}{col 20}Hall-Pagan LM Test E2 = Yh2
{col 4}{cmd:e(lmhhp2p)}{col 20}Hall-Pagan LM Test E2 = Yh2 P-Value
{col 4}{cmd:e(lmhhp3)}{col 20}Hall-Pagan LM Test E2 = Yh3
{col 4}{cmd:e(lmhhp3p)}{col 20}Hall-Pagan LM Test E2 = Yh3 P-Value
{col 4}{cmd:e(lmhw01)}{col 20}White Test - Koenker(R2) E2 = X
{col 4}{cmd:e(lmhw01p)}{col 20}White Test - Koenker(R2) E2 = X P-Value
{col 4}{cmd:e(lmhw02)}{col 20}White Test - B-P-G (SSR) E2 = X
{col 4}{cmd:e(lmhw02p)}{col 20}White Test - B-P-G (SSR) E2 = X P-Value
{col 4}{cmd:e(lmhw11)}{col 20}White Test - Koenker(R2) E2 = X X2
{col 4}{cmd:e(lmhw11p)}{col 20}White Test - Koenker(R2) E2 = X X2 P-Value
{col 4}{cmd:e(lmhw12)}{col 20}White Test - B-P-G (SSR) E2 = X X2
{col 4}{cmd:e(lmhw12p)}{col 20}White Test - B-P-G (SSR) E2 = X X2 P-Value
{col 4}{cmd:e(lmhw21)}{col 20}White Test - Koenker(R2) E2 = X X2 XX
{col 4}{cmd:e(lmhw21p)}{col 20}White Test - Koenker(R2) E2 = X X2 XX P-Value
{col 4}{cmd:e(lmhw22)}{col 20}White Test - B-P-G (SSR) E2 = X X2 XX
{col 4}{cmd:e(lmhw22p)}{col 20}White Test - B-P-G (SSR) E2 = X X2 XX P-Value
{col 4}{cmd:e(lmhharv)}{col 20}Harvey LM Test
{col 4}{cmd:e(lmhharvp)}{col 20}Harvey LM Test P-Value
{col 4}{cmd:e(lmhwald)}{col 20}Wald Test
{col 4}{cmd:e(lmhwaldp)}{col 20}Wald Test P-Value
{col 4}{cmd:e(lmhgl)}{col 20}Glejser LM Test
{col 4}{cmd:e(lmhglp)}{col 20}Glejser LM Test P-Value
{col 4}{cmd:e(lmhmss1)}{col 20}Machado-Santos-Silva  LM Test: Ev=Yh Yh2
{col 4}{cmd:e(lmhmss1p)}{col 20}Machado-Santos-Silva LM Test: Ev=Yh Yh2 P-Value
{col 4}{cmd:e(lmhmss2)}{col 20}Machado-Santos-Silva  LM Test: Ev=X
{col 4}{cmd:e(lmhmss2p)}{col 20}Machado-Santos-Silva LM Test: Ev=X P-Value
{col 4}{cmd:e(lmhbg)}{col 20}Breusch-Godfrey Test
{col 4}{cmd:e(lmhbgp)}{col 20}Breusch-Godfrey Test P-Value
{col 4}{cmd:e(lmhcw1)}{col 20}Cook-Weisberg LM Test E = Yh
{col 4}{cmd:e(lmhcw1p)}{col 20}Cook-Weisberg LM Test E = Y P-Valueh
{col 4}{cmd:e(lmhcw2)}{col 20}Cook-Weisberg LM Test E = X
{col 4}{cmd:e(lmhcw2p)}{col 20}Cook-Weisberg LM Test E = X P-Value

{err:*** Spatial Panel Groupwise Heteroscedasticity Tests:}
{col 4}{cmd:e(lmhglm)}{col 20}Lagrange Multiplier LM Test
{col 4}{cmd:e(lmhglmp)}{col 20}Lagrange Multiplier LM Test P-Value
{col 4}{cmd:e(lmhglr)}{col 20}Likelihood Ratio LR Test
{col 4}{cmd:e(lmhglrp)}{col 20}Likelihood Ratio LR Test P-Value
{col 4}{cmd:e(lmhgw)}{col 20}Wald Test
{col 4}{cmd:e(lmhgwp)}{col 20}Wald Test P-Value

{err:*** Spatial Panel Non Normality Tests:}
{col 4}{cmd:e(lmnjb)}{col 20}Jarque-Bera LM Test
{col 4}{cmd:e(lmnjbp)}{col 20}Jarque-Bera LM Test P-Value
{col 4}{cmd:e(lmnw)}{col 20}White IM Test
{col 4}{cmd:e(lmnwp)}{col 20}White IM Test P-Value
{col 4}{cmd:e(lmndh)}{col 20}Doornik-Hansen LM Test
{col 4}{cmd:e(lmndhp)}{col 20}Doornik-Hansen LM Test P-Value
{col 4}{cmd:e(lmng)}{col 20}Geary LM Test
{col 4}{cmd:e(lmngp)}{col 20}Geary LM Test P-Value
{col 4}{cmd:e(lmnad)}{col 20}Anderson-Darling Z Test
{col 4}{cmd:e(lmnadp)}{col 20}Anderson-Darling Z Test P-Value
{col 4}{cmd:e(lmndp)}{col 20}D'Agostino-Pearson LM Test
{col 4}{cmd:e(lmndpp)}{col 20}D'Agostino-Pearson LM Test P-Value
{col 4}{cmd:e(lmnsvs)}{col 20}Srivastava LM Skewness Test
{col 4}{cmd:e(lmnsvsp)}{col 20}Srivastava LM Skewness Test P-Value
{col 4}{cmd:e(lmnsms1)}{col 20}Small LM Skewness Test
{col 4}{cmd:e(lmnsms1p)}{col 20}Small LM Skewness Test P-Value
{col 4}{cmd:e(lmnsms2)}{col 20}Skewness Z Test
{col 4}{cmd:e(lmnsms2p)}{col 20}Skewness Z Test P-Value
{col 4}{cmd:e(lmnsvk)}{col 20}Srivastava Z Kurtosis Test
{col 4}{cmd:e(lmnsvkp)}{col 20}Srivastava Z Kurtosis Test P-Value
{col 4}{cmd:e(lmnsmk1)}{col 20}Small LM Kurtosis Test
{col 4}{cmd:e(lmnsmk1p)}{col 20}Small LM Kurtosis Test P-Value
{col 4}{cmd:e(lmnsmk2)}{col 20}Kurtosis Z Test
{col 4}{cmd:e(lmnsmk2p)}{col 20}Kurtosis Z Test P-Value
{col 4}{cmd:e(sk)}{col 20}Skewness Coefficient
{col 4}{cmd:e(sksd)}{col 20}Skewness Standard Deviation
{col 4}{cmd:e(ku)}{col 20}Kurtosis Coefficient
{col 4}{cmd:e(kusd)}{col 20}Kurtosis Standard Deviation
{col 4}{cmd:e(sn)}{col 20}Standard Deviation Runs Sig(k)
{col 4}{cmd:e(en)}{col 20}Mean Runs E(k)
{col 4}{cmd:e(lower)}{col 20}Lower 95% Conf. Interval [E(k)- 1.96* Sig(k)]
{col 4}{cmd:e(upper)}{col 20}Upper 95% Conf. Interval [E(k)+ 1.96* Sig(k)]

{col 4}{cmd:e(lmnpv)}{col 20}Pagan-Vella LM Test (Tobit Model)
{col 4}{cmd:e(lmnpvp)}{col 20}Pagan-Vella LM Test (Tobit Model) P-Value
{col 4}{cmd:e(lmnci)}{col 20}Chesher-Irish LM Test (Tobit Model)
{col 4}{cmd:e(lmncip)}{col 20}Chesher-Irish LM Test (Tobit Model) P-Value

Matrixes       
{col 4}{cmd:e(b)}{col 20}coefficient vector
{col 4}{cmd:e(V)}{col 20}variance-covariance matrix of the estimators

{col 4}{cmd:e(mfxlinb)}{col 20}Beta, Total, Direct, and InDirect Marginal Effect{col 70}(in Lin Form)
{col 4}{cmd:e(mfxline)}{col 20}Beta, Total, Direct, and InDirect Elasticity{col 70}(in Lin Form)

{col 4}{cmd:e(mfxlogb)}{col 20}Beta, Total, Direct, and InDirect Marginal Effect{col 70}(in Log Form)
{col 4}{cmd:e(mfxloge)}{col 20}Beta, Total, Direct, and InDirect Elasticity{col 70}(in Log Form)

{marker 09}{bf:{err:{dlgtab:References}}}

{p 4 8 2} Anderson, T.W. & C. Hsiao (1982)
{cmd: "Formulation and Estimation of Dynamic Models Using Panel Data",}
{it:Journal of Econometrics, 18}; 47�82.

{p 4 8 2}Anderson T.W. & Darling D.A. (1954)
{cmd: "A Test of Goodness of Fit",}
{it:Journal of the American Statisical Association, 49}; 765�69. 

{p 4 8 2}Anderson, T. W. & H. Rubin (1950)
{cmd: "The Asymptotic Properties of Estimates of the Parameters of a Single Equation in a Complete System of Stochastic Equations",}
{it:Annals of Mathematical Statistics, Vol. 21}; 570-82.

{p 4 8 2}Anselin, L. (2001)
{cmd: "Spatial Econometrics",}
{it:In Baltagi, B. (Ed).: A Companion to Theoretical Econometrics Basil Blackwell: Oxford, UK}.

{p 4 8 2}Anselin, L. (2007)
{cmd: "Spatial Econometrics",}
{it:In T. C. Mills and K. Patterson (Eds).: Palgrave Handbook of Econometrics. Vol 1, Econometric Theory. New York: Palgrave MacMillan}.

{p 4 8 2}Anselin, L. & Kelejian, H. H. (1997)
{cmd: "Testing for Spatial Error Autocorrelation in the Presence of Endogenous Regressors",}
{it:International Regional Science Review, (20)}; 153-182.

{p 4 8 2}Anselin, L. & Florax RJ. (1995)
{cmd: "New Directions in Spatial Econometrics: Introduction. In New Directions in Spatial Econometrics",}
{it:Anselin L, Florax RJ (eds). Berlin, Germany: Springer-Verlag}.

{p 4 8 2}Anselin L., Le Gallo J. & Jayet H (2006)
{cmd: "Spatial Panel Econometrics"}
{it:In: Matyas L, Sevestre P. (eds) The Econometrics of Panel Data, Fundamentals and Recent Developments in Theory and Practice, 3rd edn. Kluwer, Dordrecht}; 901-969.

{p 4 8 2}Breusch, Trevor & Adrian Pagan (1980)
{cmd: "The Lagrange Multiplier Test and its Applications to Model Specification in Econometrics",}
{it:Review of Economic Studies 47}; 239-253.

{p 4 8 2}C.M. Jarque  & A.K. Bera (1987)
{cmd: "A Test for Normality of Observations and Regression Residuals"}
{it:International Statistical Review} , Vol. 55; 163-172.

{p 4 8 2}Cook, R.D., & S. Weisberg (1983)
{cmd: "Diagnostics for Heteroscedasticity in Regression",}
{it:Biometrica 70}; 1-10.

{p 4 8 2}D'Agostino, R. B., & Rosman, B. (1974)
{cmd: "The Power of Geary�s Test of Normality",}
{it:Biometrika, 61(1)}; 181-184.

{p 4 8 2}Damodar Gujarati (1995)
{cmd: "Basic Econometrics"}
{it:3rd Edition, McGraw Hill, New York, USA}.

{p 4 8 2}Elhorst, J. Paul (2003)
{cmd: "Specification and Estimation of Spatial Panel Data Models"}
{it:International Regional Science review 26, 3}; 244�268.

{p 4 8 2}Elhorst, J. Paul (2009)
{cmd: "Spatial Panel Data Models"}
{it:in Mandfred M. Fischer and Arthur Getis, eds., Handbook of Applied Spatial Analysis, Berlin: Springer}.

{p 4 8 2}Engle, Robert (1982)
{cmd: "Autoregressive Conditional Heteroscedasticity with Estimates of Variance of United Kingdom Inflation"}
{it:Econometrica, 50(4), July}; 987-1007.

{p 4 8 2}Geary R.C. (1947)
{cmd: "Testing for Normality"} {it:Biometrika, Vol. 34}; 209-242.

{p 4 8 2}Geary R.C. (1970)
{cmd: "Relative Efficiency of Count of Sign Changes for Assessing Residuals Autoregression in Least Squares Regression"}
{it:Biometrika, Vol. 57}; 123-127.

{p 4 8 2}Greene, William (2007)
{cmd: "Econometric Analysis",}
{it:6th ed., Macmillan Publishing Company Inc., New York, USA.}.

{p 4 8 2}Griffiths, W., R. Carter Hill & George Judge (1993)
{cmd: "Learning and Practicing Econometrics",}
{it:John Wiley & Sons, Inc., New York, USA}.

{p 4 8 2}Harvey, Andrew (1990)
{cmd: "The Econometric Analysis of Time Series",}
{it:2nd edition, MIT Press, Cambridge, Massachusetts}.

{p 4 8 2}James LeSage and R. Kelly Pace (2009)
{cmd: "Introduction to Spatial Econometrics",}
{it:Publisher: Chapman & Hall/CRC}.

{p 4 8 2}Judge, Georege, R. Carter Hill, William . E. Griffiths, Helmut Lutkepohl, & Tsoung-Chao Lee (1988)
{cmd: "Introduction To The Theory And Practice Of Econometrics",}
{it:2nd ed., John Wiley & Sons, Inc., New York, USA}.

{p 4 8 2}Judge, Georege, W. E. Griffiths, R. Carter Hill, Helmut Lutkepohl, & Tsoung-Chao Lee(1985)
{cmd: "The Theory and Practice of Econometrics",}
{it:2nd ed., John Wiley & Sons, Inc., New York, USA}.

{p 4 8 2}Kmenta, Jan (1986)
{cmd: "Elements of Econometrics",}
{it:2nd ed., Macmillan Publishing Company, Inc., New York, USA}; 618-625.

{p 4 8 2}Koenker, R. (1981)
{cmd: "A Note on Studentizing a Test for Heteroskedasticity",}
{it:Journal of Econometrics, Vol.17}; 107-112.

{p 4 8 2}Pagan, Adrian .R. & Hall, D. (1983)
{cmd: "Diagnostic Tests as Residual Analysis",}
{it:Econometric Reviews, Vol.2, No.2,}. 159-218.

{p 4 8 2}Pearson, E. S., D'Agostino, R. B., & Bowman, K. O. (1977)
{cmd: "Tests for Departure from Normality: Comparison of Powers",}
{it:Biometrika, 64(2)}; 231-246.

{p 4 8 2}Szroeter, J. (1978)
{cmd: "A Class of Parametric Tests for Heteroscedasticity in Linear Econometric Models",}
{it:Econometrica, 46}; 1311-28.

{p 4 8 2}White, Halbert (1980)
{cmd: "A Heteroskedasticity-Consistent Covariance Matrix Estimator and a Direct Test for Heteroskedasticity",}
{it:Econometrica, 48}; 817-838.

{p 4 8 2}Wooldridge, Jeffrey M. (2002)
{cmd: "Econometric Analysis of Cross Section and Panel Data",}
{it:The MIT Press, Cambridge, Massachusetts, London, England}.

{p2colreset}{...}
{marker 10}{bf:{err:{dlgtab:Examples}}}

{bf:Note 1:} you can use: {helpb spweight}, {helpb spweightcs}, {helpb spweightxt} to create Spatial Weight Matrix.
{bf:Note 2:} Remember, your spatial weight matrix must be:
    *** {bf:{err:1-Cross Section Dimention  2- Square Matrix 3- Symmetric Matrix}}
{bf:Note 3:} You can use the dialog box for {dialog spregsdmxt}.
{bf:Note 4:} xtset is included automatically in {cmd:spregsdmxt} models.

{hline}

 {stata clear all}

 {stata sysuse spregsdmxt.dta, clear}

 {stata db spregsdmxt}

{bf:{err:* (1) MLE Spatial Durbin Panel Normal Regression Model}}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) mfx(lin) test}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) mfx(lin) test}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) mfx(log) test tolog}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) predict(Yh) resid(Ue)}
 
 {stata spregsdmxt y x1 x2       , nc(7) wmfile(SPWxt) mfx(lin) test aux(x3 x4)}
 {stata spregsdmxt y x1 x2 x3 x4 , nc(7) wmfile(SPWxt) mfx(lin) test}
{hline}

{bf:{err:* (2) MLE Spatial Durbin Panel Exponential Regression Model}}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) dist(exp) mfx(lin) test}
{hline}

{bf:{err:* (3) MLE Spatial Durbin Panel Weibull Regression Model}}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) dist(weib) mfx(lin) test}
{hline}

{bf:{err:* (4) MLE Weighted Spatial Durbin Panel Regression Model}}
 {stata spregsdmxt y x1 x2  [weight = x1] , nc(7) wmfile(SPWxt) mfx(lin) test}
 {stata spregsdmxt y x1 x2 [aweight = x1] , nc(7) wmfile(SPWxt) mfx(lin) test}
{hline}

{bf:{err:* (5) MLE Spatial Durbin Panel Tobit} - Truncated Dependent Variable (ys)}
 {stata spregsdmxt ys x1 x2, nc(7) wmfile(SPWxt) mfx(lin) test tobit ll(0)}
 {stata spregsdmxt ys x1 x2, nc(7) wmfile(SPWxt) mfx(lin) test tobit ll(3)}
{hline}

{bf:{err:* (6) MLE Spatial Durbin Panel Multiplicative Heteroscedasticity}}
 {stata spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) mfx(lin) test mhet(x2)}
{hline}

. clear all
. sysuse spregsdmxt.dta, clear
. spregsdmxt y x1 x2 , nc(7) wmfile(SPWxt) mfx(lin) test

==============================================================================
*** Binary (0/1) Weight Matrix: 49x49 - NC=7 NT=7 (Non Normalized)
==============================================================================

==============================================================================
* MLE Spatial Durbin Panel Normal Model (SDM)
==============================================================================
  y = x1 + x2 + w1x_x1 + w1x_x2
------------------------------------------------------------------------------
  Sample Size       =          49   |   Cross Sections Number   =           7
  Wald Test         =    159.6650   |   P-Value > Chi2(4)       =      0.0000
  F-Test            =     39.9162   |   P-Value > F(4 , 38)     =      0.0000
 (Buse 1973) R2     =      0.7840   |   Raw Moments R2          =      0.9607
 (Buse 1973) R2 Adj =      0.7271   |   Raw Moments R2 Adj      =      0.9504
  Root MSE (Sigma)  =      8.7407   |   Log Likelihood Function =   -185.9844
------------------------------------------------------------------------------
- R2h= 0.5703   R2h Adj= 0.4572  F-Test =   14.60 P-Value > F(4 , 38)  0.0000
- R2v= 0.5739   R2v Adj= 0.4618  F-Test =   14.81 P-Value > F(4 , 38)  0.0000
------------------------------------------------------------------------------
           y |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
y            |
          x1 |  -.2792159   .1007858    -2.77   0.006    -.4767525   -.0816793
          x2 |  -1.546654   .3175313    -4.87   0.000    -2.169004   -.9243039
      w1x_x1 |   .0143326   .0538966     0.27   0.790    -.0913027    .1199679
      w1x_x2 |   .1413968   .1558771     0.91   0.364    -.1641167    .4469102
       _cons |   65.54139   5.939067    11.04   0.000     53.90103    77.18175
-------------+----------------------------------------------------------------
         Rho |  -.0490897   .0423178    -1.16   0.246    -.1320311    .0338517
       Sigma |   10.73307   1.085911     9.88   0.000     8.604723    12.86142
------------------------------------------------------------------------------
 LR Test SDM vs. OLS (Rho=0):      1.3457   P-Value > Chi2(1)   0.2460
 LR Test (wX's =0):                2.6954   P-Value > Chi2(2)   0.2598
 Acceptable Range for Rho:        -0.5201 < Rho < 0.3115
------------------------------------------------------------------------------

==============================================================================
* Panel Model Selection Diagnostic Criteria
==============================================================================
- Log Likelihood Function                   LLF            =   -185.9844
---------------------------------------------------------------------------
- Akaike Information Criterion              (1974) AIC     =     72.6630
- Akaike Information Criterion              (1973) Log AIC =      4.2858
---------------------------------------------------------------------------
- Schwarz Criterion                         (1978) SC      =     88.1355
- Schwarz Criterion                         (1978) Log SC  =      4.4789
---------------------------------------------------------------------------
- Amemiya Prediction Criterion              (1969) FPE     =     84.1961
- Hannan-Quinn Criterion                    (1979) HQ      =     78.1846
- Rice Criterion                            (1984) Rice    =     74.4412
- Shibata Criterion                         (1981) Shibata =     71.3408
- Craven-Wahba Generalized Cross Validation (1979) GCV     =     73.4799
------------------------------------------------------------------------------

==============================================================================
*** Spatial Panel Aautocorrelation Tests
==============================================================================
  Ho: Error has No Spatial AutoCorrelation
  Ha: Error has    Spatial AutoCorrelation

- GLOBAL Moran MI            =  -0.0122     P-Value > Z( 0.076)   0.9397
- GLOBAL Geary GC            =   0.9717     P-Value > Z(-0.202)   0.8395
- GLOBAL Getis-Ords GO       =   0.0349     P-Value > Z(-0.076)   0.9397
------------------------------------------------------------------------------
- Moran MI Error Test        =   0.2449     P-Value > Z(2.332)    0.8065
------------------------------------------------------------------------------
- LM Error (Burridge)        =   0.0063     P-Value > Chi2(1)     0.9369
- LM Error (Robust)          =   0.0063     P-Value > Chi2(1)     0.9368
------------------------------------------------------------------------------
  Ho: Spatial Lagged Dependent Variable has No Spatial AutoCorrelation
  Ha: Spatial Lagged Dependent Variable has    Spatial AutoCorrelation

- LM Lag (Anselin)           =   0.0005     P-Value > Chi2(1)     0.9817
- LM Lag (Robust)            =   0.0005     P-Value > Chi2(1)     0.9815
------------------------------------------------------------------------------
  Ho: No General Spatial AutoCorrelation
  Ha:    General Spatial AutoCorrelation

- LM SAC (LMErr+LMLag_R)     =   0.0068     P-Value > Chi2(2)     0.9966
- LM SAC (LMLag+LMErr_R)     =   0.0068     P-Value > Chi2(2)     0.9966
------------------------------------------------------------------------------

==============================================================================
*** Panel Heteroscedasticity Tests
==============================================================================
  Ho: Panel Homoscedasticity - Ha: Panel Heteroscedasticity

- Engle LM ARCH Test AR(1): E2 = E2_1   =   0.1475   P-Value > Chi2(1)  0.7010
------------------------------------------------------------------------------
- Hall-Pagan LM Test:   E2 = Yh         =   0.1123   P-Value > Chi2(1)  0.7375
- Hall-Pagan LM Test:   E2 = Yh2        =   0.1301   P-Value > Chi2(1)  0.7183
- Hall-Pagan LM Test:   E2 = LYh2       =   0.1938   P-Value > Chi2(1)  0.6598
------------------------------------------------------------------------------
- Harvey LM Test:    LogE2 = X          =   3.7716   P-Value > Chi2(2)  0.1517
- Wald Test:         LogE2 = X          =   9.3061   P-Value > Chi2(1)  0.0023
- Glejser LM Test:     |E| = X          =   7.3190   P-Value > Chi2(2)  0.0257
- Breusch-Godfrey Test:  E = E_1 X      =   9.2253   P-Value > Chi2(1)  0.0024
------------------------------------------------------------------------------
- Machado-Santos-Silva Test: Ev=Yh Yh2  =   0.0496   P-Value > Chi2(2)  0.9755
- Machado-Santos-Silva Test: Ev=X       =   5.8428   P-Value > Chi2(4)  0.2112
------------------------------------------------------------------------------
- White Test - Koenker(R2): E2 = X      =   8.3131   P-Value > Chi2(4)  0.0808
- White Test - B-P-G (SSR): E2 = X      =  11.3677   P-Value > Chi2(4)  0.0227
------------------------------------------------------------------------------
- White Test - Koenker(R2): E2 = X X2   =  12.4528   P-Value > Chi2(8)  0.1321
- White Test - B-P-G (SSR): E2 = X X2   =  17.0284   P-Value > Chi2(8)  0.0298
------------------------------------------------------------------------------
- White Test - Koenker(R2): E2 = X X2 XX=  28.6652   P-Value > Chi2(14) 0.0116
- White Test - B-P-G (SSR): E2 = X X2 XX=  39.1980   P-Value > Chi2(14) 0.0003
------------------------------------------------------------------------------
- Cook-Weisberg LM Test: E2/S2n = Yh    =   0.1536   P-Value > Chi2(1)  0.6951
- Cook-Weisberg LM Test: E2/S2n = X     =  11.3677   P-Value > Chi2(4)  0.0227
------------------------------------------------------------------------------
*** Single Variable Tests (E2/Sig2):
- Cook-Weisberg LM Test: x1                =   4.1941 P-Value > Chi2(1) 0.0406
- Cook-Weisberg LM Test: x2                =   0.7861 P-Value > Chi2(1) 0.3753
- Cook-Weisberg LM Test: w1x_x1            =   0.6022 P-Value > Chi2(1) 0.4377
- Cook-Weisberg LM Test: w1x_x2            =   0.3642 P-Value > Chi2(1) 0.5462
------------------------------------------------------------------------------
*** Single Variable Tests:
- King LM Test: x1                         =   0.6073 P-Value > Chi2(1) 0.4358
- King LM Test: x2                         =   1.2885 P-Value > Chi2(1) 0.2563
- King LM Test: w1x_x1                     =   0.5187 P-Value > Chi2(1) 0.4714
- King LM Test: w1x_x2                     =   0.9631 P-Value > Chi2(1) 0.3264
------------------------------------------------------------------------------

==============================================================================
* Panel Groupwise Heteroscedasticity Tests
==============================================================================
  Ho: Panel Homoscedasticity - Ha: Panel Groupwise Heteroscedasticity

- Lagrange Multiplier LM Test     =   9.5752     P-Value > Chi2(6)   0.1437
- Likelihood Ratio LR Test        =   9.0217     P-Value > Chi2(6)   0.1724
- Wald Test                       =  17.2214     P-Value > Chi2(7)   0.0160
------------------------------------------------------------------------------

==============================================================================
* Panel Non Normality Tests
==============================================================================
Ho: Normality - Ha: Non Normality
------------------------------------------------------------------------------
*** Non Normality Tests:
- Jarque-Bera LM Test                  =   2.4931     P-Value > Chi2(2) 0.2875
- White IM Test                        =   8.9182     P-Value > Chi2(2) 0.0116
- Doornik-Hansen LM Test               =   3.5573     P-Value > Chi2(2) 0.1689
- Geary LM Test                        =  -0.1183     P-Value > Chi2(2) 0.9426
- Anderson-Darling Z Test              =   0.4078     P > Z( 0.376)     0.6466
- D'Agostino-Pearson LM Test           =   3.5561     P-Value > Chi2(2) 0.1690
------------------------------------------------------------------------------
*** Skewness Tests:
- Srivastava LM Skewness Test          =   1.3905     P-Value > Chi2(1) 0.2383
- Small LM Skewness Test               =   1.6441     P-Value > Chi2(1) 0.1998
- Skewness Z Test                      =  -1.2822     P-Value > Chi2(1) 0.1998
------------------------------------------------------------------------------
*** Kurtosis Tests:
- Srivastava  Z Kurtosis Test          =   1.0500     P-Value > Z(0,1)  0.2937
- Small LM Kurtosis Test               =   1.9120     P-Value > Chi2(1) 0.1667
- Kurtosis Z Test                      =   1.3827     P-Value > Chi2(1) 0.1667
------------------------------------------------------------------------------
    Skewness Coefficient = -0.4126     - Standard Deviation =  0.3398
    Kurtosis Coefficient =  3.7349     - Standard Deviation =  0.6681
------------------------------------------------------------------------------
    Runs Test: (25) Runs -  (26) Positives - (23) Negatives
    Standard Deviation Runs Sig(k) =  3.4501 , Mean Runs E(k) = 25.4082
    95% Conf. Interval [E(k)+/- 1.96* Sig(k)] = (18.6460 , 32.1703 )
------------------------------------------------------------------------------

* Beta, Total, Direct, and InDirect (Model= ): Linear: Marginal Effect *

+-------------------------------------------------------------------------------+
|     Variable |    Beta(B) |      Total |     Direct |   InDirect |       Mean |
|--------------+------------+------------+------------+------------+------------|
|y             |            |            |            |            |            |
|           x1 |    -0.2792 |    -0.2774 |    -0.3177 |     0.0403 |    38.4362 |
|           x2 |    -1.5467 |    -1.5365 |    -1.7600 |     0.2234 |    14.3749 |
|       w1x_x1 |     0.0143 |     0.0142 |     0.0163 |    -0.0021 |   114.0111 |
|       w1x_x2 |     0.1414 |     0.1405 |     0.1609 |    -0.0204 |    41.2153 |
+-------------------------------------------------------------------------------+

* Beta, Total, Direct, and InDirect (Model= ): Linear: Elasticity *

+-------------------------------------------------------------------------------+
|     Variable |   Beta(Es) |      Total |     Direct |   InDirect |       Mean |
|--------------+------------+------------+------------+------------+------------|
|           x1 |    -0.3055 |    -0.3035 |    -0.3476 |     0.0441 |    38.4362 |
|           x2 |    -0.6329 |    -0.6288 |    -0.7202 |     0.0914 |    14.3749 |
|       w1x_x1 |     0.0465 |     0.0462 |     0.0529 |    -0.0067 |   114.0111 |
|       w1x_x2 |     0.1659 |     0.1648 |     0.1888 |    -0.0240 |    41.2153 |
+-------------------------------------------------------------------------------+
 Mean of Dependent Variable =     35.1288

{p2colreset}{...}
{marker 11}{bf:{err:{dlgtab:Authors}}}

- {hi:Emad Abd Elmessih Shehata}
  {hi:Professor (PhD Economics)}
  {hi:Agricultural Research Center - Agricultural Economics Research Institute - Egypt}
  {hi:Email: {browse "mailto:emadstat@hotmail.com":emadstat@hotmail.com}}
  {hi:WebPage:{col 27}{browse "http://emadstat.110mb.com/stata.htm"}}
  {hi:WebPage at IDEAS:{col 27}{browse "http://ideas.repec.org/f/psh494.html"}}
  {hi:WebPage at EconPapers:{col 27}{browse "http://econpapers.repec.org/RAS/psh494.htm"}}

- {hi:Sahra Khaleel A. Mickaiel}
  {hi:Professor (PhD Economics)}
  {hi:Cairo University - Faculty of Agriculture - Department of Economics - Egypt}
  {hi:Email: {browse "mailto:sahra_atta@hotmail.com":sahra_atta@hotmail.com}}
  {hi:WebPage:{col 27}{browse "http://sahraecon.110mb.com/stata.htm"}}
  {hi:WebPage at IDEAS:{col 27}{browse "http://ideas.repec.org/f/pmi520.html"}}
  {hi:WebPage at EconPapers:{col 27}{browse "http://econpapers.repec.org/RAS/pmi520.htm"}}

{bf:{err:{dlgtab:SPREGSDMXT Citation}}}

{p 1}{cmd:Shehata, Emad Abd Elmessih & Sahra Khaleel A. Mickaiel (2014)}{p_end}
{p 1 10 1}{cmd:SPREGSDMXT: "Maximum Likelihood Estimation Spatial Durbin Panel Regression"}{p_end}


{title:Online Help:}

{bf:{err:*** Spatial Econometrics Regression Models:}}

--------------------------------------------------------------------------------
{bf:{err:*** (1) Spatial Panel Data Regression Models:}}
{helpb spregxt}{col 17}Spatial Panel Regression Econometric Models: {cmd:Stata Module Toolkit}
{helpb gs2slsxt}{col 17}Generalized Spatial Panel 2SLS Regression
{helpb gs2slsarxt}{col 17}Generalized Spatial Panel Autoregressive 2SLS Regression
{helpb spglsxt}{col 17}Spatial Panel Autoregressive Generalized Least Squares Regression
{helpb spgmmxt}{col 17}Spatial Panel Autoregressive Generalized Method of Moments Regression
{helpb spmstarxt}{col 17}(m-STAR) Spatial Lag Panel Models
{helpb spmstardxt}{col 17}(m-STAR) Spatial Durbin Panel Models
{helpb spmstardhxt}{col 17}(m-STAR) Spatial Durbin Multiplicative Heteroscedasticity Panel Models
{helpb spmstarhxt}{col 17}(m-STAR) Spatial Lag Multiplicative Heteroscedasticity Panel Models
{helpb spregdhp}{col 17}Spatial Panel Han-Philips Linear Dynamic Regression: Lag & Durbin Models
{helpb spregdpd}{col 17}Spatial Panel Arellano-Bond Linear Dynamic Regression: Lag & Durbin Models
{helpb spregfext}{col 17}Spatial Panel Fixed Effects Regression: Lag & Durbin Models
{helpb spregrext}{col 17}Spatial Panel Random Effects Regression: Lag & Durbin Models
{helpb spregsacxt}{col 17}MLE Spatial AutoCorrelation Panel Regression (SAC)
{helpb spregsarxt}{col 17}MLE Spatial Lag Panel Regression (SAR)
{helpb spregsdmxt}{col 17}MLE Spatial Durbin Panel Regression (SDM)
{helpb spregsemxt}{col 17}MLE Spatial Error Panel Regression (SEM)
--------------------------------------------------------------------------------
{bf:{err:*** (2) Spatial Cross Section Regression Models:}}
{helpb spregcs}{col 17}Spatial Cross Section Regression Econometric Models: {cmd:Stata Module Toolkit}
{helpb gs2sls}{col 17}Generalized Spatial 2SLS Cross Sections Regression
{helpb gs2slsar}{col 17}Generalized Spatial Autoregressive 2SLS Cross Sections Regression
{helpb gs3sls}{col 17}Generalized Spatial Autoregressive 3SLS Regression 
{helpb gs3slsar}{col 17}Generalized Spatial Autoregressive 3SLS Cross Sections Regression
{helpb gsp3sls}{col 17}Generalized Spatial 3SLS Cross Sections Regression
{helpb spautoreg}{col 17}Spatial Cross Section Regression Models
{helpb spgmm}{col 17}Spatial Autoregressive GMM Cross Sections Regression
{helpb spmstar}{col 17}(m-STAR) Spatial Lag Cross Sections Models
{helpb spmstard}{col 17}(m-STAR) Spatial Durbin Cross Sections Models
{helpb spmstardh}{col 17}(m-STAR) Spatial Durbin Multiplicative Heteroscedasticity Cross Sections Models
{helpb spmstarh}{col 17}(m-STAR) Spatial Lag Multiplicative Heteroscedasticity Cross Sections Models
{helpb spregsac}{col 17}MLE Spatial AutoCorrelation Cross Sections Regression (SAC)
{helpb spregsar}{col 17}MLE Spatial Lag Cross Sections Regression (SAR)
{helpb spregsdm}{col 17}MLE Spatial Durbin Cross Sections Regression (SDM)
{helpb spregsem}{col 17}MLE Spatial Error Cross Sections Regression (SEM)
--------------------------------------------------------------------------------
{bf:{err:*** (3) Tobit Spatial Regression Models:}}

{bf:*** (3-1) Tobit Spatial Panel Data Regression Models:}
{helpb sptobitgmmxt}{col 17}Tobit Spatial GMM Panel Regression
{helpb sptobitmstarxt}{col 17}Tobit (m-STAR) Spatial Lag Panel Models
{helpb sptobitmstardxt}{col 17}Tobit (m-STAR) Spatial Durbin Panel Models
{helpb sptobitmstardhxt}{col 17}Tobit (m-STAR) Spatial Durbin Multiplicative Heteroscedasticity Panel Models
{helpb sptobitmstarhxt}{col 17}Tobit (m-STAR) Spatial Lag Multiplicative Heteroscedasticity Panel Models
{helpb sptobitsacxt}{col 17}Tobit MLE Spatial AutoCorrelation (SAC) Panel Regression
{helpb sptobitsarxt}{col 17}Tobit MLE Spatial Lag Panel Regression
{helpb sptobitsdmxt}{col 17}Tobit MLE Spatial Panel Durbin Regression
{helpb sptobitsemxt}{col 17}Tobit MLE Spatial Error Panel Regression
{helpb spxttobit}{col 17}Tobit Spatial Panel Autoregressive GLS Regression
--------------------------------------------------------------
{bf:*** (3-2) Tobit Spatial Cross Section Regression Models:}
{helpb sptobitgmm}{col 17}Tobit Spatial GMM Cross Sections Regression
{helpb sptobitmstar}{col 17}Tobit (m-STAR) Spatial Lag Cross Sections Models
{helpb sptobitmstard}{col 17}Tobit (m-STAR) Spatial Durbin Cross Sections Models
{helpb sptobitmstardh}{col 17}Tobit (m-STAR) Spatial Durbin Multiplicative Heteroscedasticity Cross Sections
{helpb sptobitmstarh}{col 17}Tobit (m-STAR) Spatial Lag Multiplicative Heteroscedasticity Cross Sections
{helpb sptobitsac}{col 17}Tobit MLE AutoCorrelation (SAC) Cross Sections Regression
{helpb sptobitsar}{col 17}Tobit MLE Spatial Lag Cross Sections Regression
{helpb sptobitsdm}{col 17}Tobit MLE Spatial Durbin Cross Sections Regression
{helpb sptobitsem}{col 17}Tobit MLE Spatial Error Cross Sections Regression
--------------------------------------------------------------------------------
{bf:{err:*** (4) Spatial Weight Matrix:}}
{helpb spcs2xt}{col 17}Convert Cross Section to Panel Spatial Weight Matrix
{helpb spweight}{col 17}Cross Section and Panel Spatial Weight Matrix
{helpb spweightcs}{col 17}Cross Section Spatial Weight Matrix
{helpb spweightxt}{col 17}Panel Spatial Weight Matrix
--------------------------------------------------------------------------------

{psee}
{p_end}

