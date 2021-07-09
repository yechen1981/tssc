*! version 1.0.0  07mar1997  preliminary version  Statalist distributionprogram define hetprob	version 5.0	local options "Level(int $S_level)"	parse "`*'", parse(" ,")	if "`1'"=="" | "`1'"=="," {		if "$S_E_cmd" != "hetprob" { error 301 }		parse "`*'"		ml mlout hetprob, level(`level')		local c2 : display %12.2f $S_E_c2v		local c2 = trim("`c2'")		local p : display %6.4f chiprob($S_E_c2d,$S_E_c2v)		local p = trim("`p'")		di in gr /*		*/ "note, LR test for ln_var equation:  chi2($S_E_c2d) = " /*		*/ in ye "`c2'" in gr ", Prob > Chi2 = " in ye "`p'"		exit	}	local varlist "req ex"	local if "opt"	local in "opt"	local options "`options' noCHI Variance(string) *"	parse "`*'"	if "`varianc'"=="" {		di in red "option variance(varlist) required"		exit 198	}	unabbrev `varianc'	local varianc "$S_1"	parse "`varlist'", parse(" ")	local depv "`1'"	tempname b0 b0f b f V	tempvar touse samp	mark `touse' `if' `in'	markout `touse' `varlist'	markout `touse' `varianc'	quietly {		probit `varlist' if `touse'		local fulll = _result(2)		capture matrix `b0f' = get(_b)		if _rc { 			noi probit `varlist' if `touse'			exit 498		}		mat coleq `b0f' = `depv':		predict `samp' if `touse'		capture assert `samp'!=. if `touse'		if _rc { 			noi probit, nocoef			exit 498		}		drop `samp'		eq ln_var : `varianc'		if "`chi'"=="" {			noi di in gr "Estimating constant-only model:"			probit `depv' if `touse'			capture matrix `b0' = get(_b)			if _rc { 				noi probit `depv' if `touse'				exit 498			}			mat coleq `b0' = `depv':			eq `depv': `depv'			ml begin 			ml function hetpr_lf			ml method lf 			ml model `b' = `depv' ln_var, /*				*/ depv(10) cons(10) from(`b0')			ml sample `samp' if `touse'			noi ml maximize `f' `V', `options'			local f0 = `f'			local f0 "lf0(`f0')"			noi di _n in gr "Estimating full model:"		}		eq `depv': `varlist'		ml begin 		ml function hetpr_lf		ml method lf		ml model `b' = `depv' ln_var, depv(10) cons(10) from(`b0f')		ml sample `samp' if `touse'		noi ml maximize `f' `V', `options'		local newf = `f'		ml post hetprob, `f0'						/* workaround ml bug */		global S_E_mdf : word count `varlist'		global S_E_mdf = $S_E_mdf - 1		global S_E_c2v = 2*(`newf' - `fulll')		global S_E_c2d : word count `varianc'	}	hetprob, level(`level')endexit