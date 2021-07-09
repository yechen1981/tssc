*! version 1.0.2  03sep2018  sk dcs

program ardl_estat, rclass

    version 11.2
    if "`e(cmd)'" != "ardl" error 301
    
    gettoken subcmd rest : 0, parse(" ,")
    local lsubcmd = length(`"`subcmd'"')
    
    if `"`subcmd'"'==substr("ectest",1,max(3,`lsubcmd')) {
        _ardl_ectest `rest'
    }
    else if `"`subcmd'"'==substr("btest",1,max(2,`lsubcmd')) {
        _ardl_btest `rest'
    }
    else {
        estat_default `0'
    }
    return add
end

program _ardl_ectest, rclass
	
    if "`e(model)'"!="ec" {
        disp as error "estat ectest is only applicable when option 'ec' or 'ec1' was used."
        exit 198
    }
	
	syntax , [ SIGlevels(passthru) ASYmptotic ]
	
	local asymptotic = ("`asymptotic'"!="")
	
	local case `e(case)'
	local k : word count `e(lrxvars)'
	local sr = `e(df_m)' - (`k'+1) - (`case'>=4)
		// e(df_m) never includes the constant, whether it is used or not
		// `k'+1 levels regs
	if !`asymptotic' local n = e(N)
	tempname cvmat
	qui ardlbounds , case(`case') stat(F) n(`n') k(`k') sr(`sr') `siglevels' pvalue(`e(F_pss)')
	matrix `cvmat' = r(cvmat)
	qui ardlbounds , case(`case') stat(t) n(`n') k(`k') sr(`sr') `siglevels' pvalue(`e(t_pss)')
	matrix `cvmat' = `cvmat' \ r(cvmat)
	local siglevels = r(siglevels)
	
	if c(noisily) {
		local col = c(linesize)-13
		local col = max(min(`col', 66), 28)  // 28: accounts for length of preceding string

		disp as txt _n "Pesaran, Shin, and Smith (2001) bounds test"
		disp as txt _n "H0: no level relationship" _col(`col')        "F =" as res %10.3f e(F_pss)
		disp as txt    "Case " as res "`case'"     _col(`col') as txt "t =" as res %10.3f e(t_pss)
		if `asymptotic' {
			disp as txt _n "Asymptotic (" as res "`k'" as txt " variables)"
		}
		else {
			disp as txt _n "Finite sample (" as res "`k'" as txt " variables, " as res "`n'" as txt " observations, " as res "`sr'" as txt " short-run coefficients)"
		}
		disp as txt _n "Kripfganz and Schneider (2018) critical values and approximate p-values"

		local cspec : disp _dup(`=colsof("`cvmat'")/2') "| %7.3f & %7.3f "
		matlist `cvmat', cspec(& %2s `cspec' &) rspec(&|&&)
        
		disp as txt _n "do not reject H0 if"
		disp           "    both F and t are closer to zero than critical values for I(0) variables"
		disp           "      (if p-values > desired level for I(0) variables)"
		disp           "reject H0 if"
		disp           "    both F and t are more extreme than critical values for I(1) variables"
		disp           "      (if p-values < desired level for I(1) variables)"

	}

	return local siglevels = "`siglevels'"	
	
	if !`asymptotic' return scalar sr   = `sr'
	if !`asymptotic' return scalar N = `n'
	return scalar F_pss = e(F_pss)
	return scalar t_pss = e(t_pss)
	return scalar case = e(case)
	return scalar k    = `k'

	return matrix cvmat = `cvmat'
	
end

program _ardl_btest, rclass
// subroutine version as of ardl_v070

    if "`e(model)'"!="ec" {
        disp as error "estat btest is only applicable when option 'ec' or 'ec1' was used."
        exit 198
    }
	
    syntax , [ n Nfix(passthru) ]
    
    local nsource pssmith
	local nsource_fmt "Pesaran/Shin/Smith (2001)"
	local ktab 10
    if "`n'`nfix'"!="" {
		local nsource narayan
		local nsource_fmt "Narayan (2005)"
		local ktab 7
	}
    
    local k : word count `e(lrxvars)'
	if `k'>`ktab' {
		disp as error `"Model has k=`k' weakly exogenous variables, but"'
		disp as error `"`nsource_fmt' critical values are only tabulated up to k=`ktab'."'
		exit 9
	}
	
    tempname case F_pss F_critval t_pss t_critval
    local case = e(case)

    qui ardlbounds , table nosurfreg case(`case') stat(f) `n' `nfix'
    matrix `F_critval' = r(cvmat)
    matrix `F_critval' = `F_critval'[`=`k'+1', 1...]

    if "`nsource'"=="pssmith" {
        local matcolspec "%6.2f & %6.2f |"  // for -matlist- statement
		qui ardlbounds , table nosurfreg case(`case') stat(t) `n' `nfix'
		matrix `t_critval' = r(cvmat)
		matrix `t_critval' = `t_critval'[`=`k'+1', 1...]
    }
    
	disp as text _n "note: {cmd:estat btest} has been superseded by {help ardl_postestimation##ectest:estat ectest}"
	disp as text    "      as the prime procedure to test for a levels relationship."
	disp as text    "      ({stata estat ectest:click to run})"
	
    disp as text _n "{bf:Pesaran/Shin/Smith (2001) ARDL Bounds Test}"
    disp as text    "H0: no levels relationship             F =  " as result %5.3f e(F_pss)  // leave one more space as t-stat is negative

    if "`nsource'"=="pssmith" ///
    disp as text    "                                       t = "  as result %5.3f e(t_pss)

    matlist `F_critval' , title(Critical Values (0.1-0.01), {bf:F-statistic}, Case `e(case)')  /// 
                      cspec(& %5s | %6.2f & %6.2f | %6.2f & %6.2f | `matcolspec' %6.2f & %6.2f &)   ///
                      rspec(&|&)
    disp as text "accept if F < critical value for I(0) regressors"
    disp as text "reject if F > critical value for I(1) regressors"

    if "`nsource'"=="narayan" local Ncrit = r(Ncrit)

    if "`nsource'"=="pssmith" {
        matlist `t_critval' , title(Critical Values (0.1-0.01), {bf:t-statistic}, Case `e(case)')  /// 
                      cspec(& %5s | %6.2f & %6.2f | %6.2f & %6.2f | `matcolspec' %6.2f & %6.2f &)   ///
                      rspec(&|&)
        disp as text "accept if t > critical value for I(0) regressors"
        disp as text "reject if t < critical value for I(1) regressors"
    }
    disp as text _n "k: # of non-deterministic regressors in long-run relationship"
    if "`nsource'"=="pssmith" {
        disp as text "Critical values from `nsource_fmt'"
    }
    else if "`nsource'"=="narayan" {
        disp as text "Critical values from `nsource_fmt', N=`Ncrit'"
    }

    return scalar case      = e(case)
    return scalar F_pss     = e(F_pss)
    return matrix F_critval = `F_critval'
    
    if "`nsource'"=="pssmith" {
        return scalar t_pss     = `e(t_pss)'
        return matrix t_critval = `t_critval'
    }
    
end



