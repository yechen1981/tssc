*! cns v1.0 MSOpenshaw 19Feb2010
program cns, rclass byable(recall)

syntax varlist(min=1 max=1 numeric) [if] [in] , MIN(integer) MAX(integer)

*ENSURES N > 0
     marksample touse
     quietly count if `touse'
     if `r(N)' == 0 {
          error 2000
     }
*ENSURES MIN < MAX
     if `max' <= `min' {
          di in re "min(X) must be less than max(X)"
          error 499
     }
     qui summarize `varlist' if `touse',
     scalar `d_x' = `max' - `min'
     scalar `p_i' = 1/`n_1'
     qui g `parens' = .
     qui replace `parens' = 1 - ((abs(`1' - `mu_x'))/`d_x')
     qui g `log_b2' = .
     qui replace `log_b2' = (log10(`parens'))/log10(2)
     egen `ser_x' = total(`p_i'*`log_b2')
     scalar `cns_X' = 1 + `ser_x'
     di ""
     display as result "Consensus Measure for `varlist'"
     display as txt "Cns(X) = " `cns_X'
          if `cns_X' < 0 {
          di in re "!CAUTION: Value out of range"
          }
          if `cns_X' > 1 {
          di in re "!CAUTION: Value out of range"
          }
     return scalar N = r(N)
     return scalar cns = `cns_X'
     return scalar dx = `d_x'