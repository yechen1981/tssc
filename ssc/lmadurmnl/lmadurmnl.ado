*! lmadurmnl V1.0 10/10/2012
*! 
*! Emad Abd Elmessih Shehata
*! Professor (PhD Economics)
*! Agricultural Research Center - Agricultural Economics Research Institute - Egypt
*! Email: emadstat@hotmail.com
*! WebPage:               http://emadstat.110mb.com/stata.htm
*! WebPage at IDEAS:      http://ideas.repec.org/f/psh494.html
*! WebPage at EconPapers: http://econpapers.repec.org/RAS/psh494.htm

*! Sahra Khaleel A. Mickaiel
*! Professor (PhD Economics)
*! Cairo University - Faculty of Agriculture - Department of Economics - Egypt
*! Email: sahra_atta@hotmail.com
*! WebPage:               http://sahraecon.110mb.com/stata.htm
*! WebPage at IDEAS:      http://ideas.repec.org/f/pmi520.html
*! WebPage at EconPapers: http://econpapers.repec.org/RAS/pmi520.htm

program define lmadurmnl , eclass
version 11.0
syntax varlist(min=1 max=1) [if] [in] [aw fw pw iw] , ///
 [fun(str) LAGs(int 1) vce(str) INitial(str) level(passthru) ///
 ITERate(int 0) NOLog VARiables(varlist numeric ts) ROBust VCE(passthru) * ]
gettoken yvar : varlist
qui marksample touse
qui markout `touse' `varlist' , strok
tempvar E EE Eo DE SRho Time TimeN U Ue_ML U2 LE LEo
tempname E E1 EE1 Eo N SSEo Rho SSE lmadmk lmadmd
 local wgt
 if "`weight'`exp'" != "" {
 local wgt "[`weight'`exp']"
 }
qui gen `Time'=_n if `touse'
qui gen `TimeN'=_n
qui tsset `Time'
 nl ( `yvar' = `fun' )  if `touse' `wgt' , leave initial(`initial') `vce' `level' ///
 iterate(`iterate') `nolog' `variables' `robust'
local ZMat `e(params)'
qui predict `Ue_ML' if `touse' , res
qui mkmat `Ue_ML' if `touse' , matrix(`Ue_ML')
local N = e(N)
matrix `SSE'=`Ue_ML''*`Ue_ML'
scalar `SSEo'=`SSE'[1,1]
qui gen `E' =`Ue_ML' if `touse'
cap drop `LE'*
qui forvalue i=1/`lags' {
tempvar E`i' EE`i' LE`i' LEo`i' DE`i' LEE`i'
 gen `E`i''=`E'^`i' if `touse'
 gen `LEo`i''=L`i'.`E' if `touse'
qui replace `LEo`i''= 0 in 1/`i'
 gen `LE`i'' =L`i'.`E' if `touse'
 gen `LEE`i''=L`i'.`E'*`E' if `touse'
 summ `LEE`i'' if `touse'
scalar `SSE'`i'=r(sum)
scalar `Rho'`i'=`SSE'`i'/`SSEo'
 summ `E`i'' if `touse'
scalar `SSE'`i'=r(sum)
 gen `DE`i''=(`E'-`E'[_n-1])^2 if `touse'
 summ `DE`i'' if `touse'
scalar `SSE'`i'=r(sum)
tempvar `LEo'`i' `LE'`i'
qui gen `LEo'`i'=L`i'.`E' if `touse'
qui replace `LEo'`i'= 0 in 1/`i'
qui gen `LE'`i' =L`i'.`E' if `touse'
qui regress `E' `LE'* `ZMat' if `touse' , `noconstant'
qui testparm `LE'*
scalar `lmadmk'`i'=r(F)*`i'
qui regress `E' `LEo'* `ZMat' if `touse' , `noconstant'
qui testparm `LEo'*
scalar `lmadmd'`i'=r(F)*`i'
 }
di
di _dup(78) "{bf:{err:=}}"
di as txt "{bf:{err:*** NLS Autocorrelation Dynamic Durbin m Test}}"
di _dup(78) "{bf:{err:=}}"
di as txt "{bf: Ho: No Autocorrelation - Ha: Autocorrelation}"
di _dup(78) "-"
if "`lags'"!="" {
forvalue i=1/`lags' {
di as txt "- Rho Value for Order(" `i' ")" _col(40) "AR(" `i' ")=" as res %8.4f `Rho'`i'
ereturn scalar rho`i'=`Rho'`i'
di as txt "- Durbin m Test (drop `i' obs)" _col(40) "AR(" `i' ")=" as res %8.4f `lmadmd'`i' _col(56) as txt "P-Value >Chi2(`i')" _col(73) as res %5.4f chi2tail(`i', abs(`lmadmd'`i'))
ereturn scalar lmadmd`i'=`lmadmd'`i'
ereturn scalar lmadmdp`i'=chi2tail(`i', abs(`lmadmd'`i'))
di as txt "- Durbin m Test (keep `i' obs)" _col(40) "AR(" `i' ")=" as res %8.4f `lmadmk'`i' _col(56) as txt "P-Value >Chi2(`i')" _col(73) as res %5.4f chi2tail(`i', abs(`lmadmk'`i'))
ereturn scalar lmadmk`i'=`lmadmk'`i'
ereturn scalar lmadmkp`i'=chi2tail(`i', abs(`lmadmk'`i'))
di _dup(78) "-"
 }
 }
qui cap drop `ZMat'
qui tsset `TimeN'
end

