*! version 1.1.1 NJC 26 Feb 1998* version 1.1.0 NJC 25 Feb 1998* version 1.0.0 NJC 25 Jan 1998program def markov    version 5.0    local varlist "req ex max(1)"    local if "opt"    local in "opt"    local options "Fname(str) Pname(str) *"    parse "`*'"    capture confirm str var `varlist'    if _rc == 0 {        di in r "not possible with string variable"        exit 108    }    tempvar touse prev    tempname X rname cname    qui gen `prev' = `varlist'[_n-1]    label var `prev' "previous `varlist'"    mark `touse' `if' `in'    markout `touse' `varlist' `prev'    if "`fname'" != "" { local F "`fname'" }    else local F "F"    if "`pname'" != "" { local P "`pname'" }    else local P "P"    local len = 25 + length("`varlist'")    di _n in g "Markov chain analysis of `varlist'"    di in g _dup(`len') "-"    di _n in g "Transition frequencies"    di    in g "----------------------"    qui count if `touse'    di _n in g "Number of transitions     " in y _result(1)    tabchi `prev' `varlist' if `touse',  `options'    qui tab `prev' `varlist' if `touse', /*     */ matcell(`F') matrow(`rname') matcol(`cname')    /* Exceptionally, the matrix might not be square, if a state occurs    just once at the beginning or the end of the series */    local cols = colsof(`F')    local rows = rowsof(`F')    mat `X' = J(`cols',1,1)    mat `X' = `F' * `X'    mat `X' = diag(`X')    mat `X' = inv(`X')    mat `P' = `X' * `F'    local i = 1    while `i' <= `rows' {        local thisr = `rname'[`i',1]        local r "`r' `thisr'"        local i = `i' + 1    }    local i = 1    while `i' <= `cols' {        local thisc = `cname'[1,`i']        local c "`c' `thisc'"        local i = `i' + 1    }    mat rownames `P' = `r'    mat colnames `P' = `c'    di _n in g "Transition probabilities"    di    in g "------------------------"    mat li `P', format(%9.4f)end