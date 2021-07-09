program _gb2reg, eclass
version 12.0
	if replay() {
		display "Replay not implemented"
	}
	else {
		syntax varlist(min=2) [, INITial(numlist) DIFficult SIGMAvars(varlist) ARCH(passthru) GARCH(passthru) TECHnique(passthru) ITERate(passthru) nolog TRace GRADient showstep HESSian SHOWTOLerance TOLerance(passthru) LTOLerance(passthru) NRTOLerance(passthru)] 
		local nvars: word count `varlist'
		local depvar: word 1 of `varlist'
		local regs: list varlist - depvar
		local nregs: word count `regs'
		marksample touse 
        quietly{ 
                  count if `depvar' < 0 & `touse'
                  local n =  r(N) 
                  if `n' > 0 {
                        noi di " "
                        noi di as txt " {res:`depvar'} has `n' values < 0;" _c
                        noi di as text " not used in calculations"
                  }

                  count if `depvar' == 0 & `touse'
                  local n =  r(N) 
                  if `n' > 0 {
                        noi di " "
                        noi di as txt " {res:`depvar'} has `n' values = 0;" _c
                        noi di as text " not used in calculations"
                  }

          replace `touse' = 0 if `depvar' <= 0
        }
		if "`initial'" != ""{
		loc initiallen: word count `initial'
			if (`initiallen' != `nvars'*1+3) {
				di as err "initial does not have the correct amount of numbers"
				exit 503
			}
			ml init `initial', copy
		}

		ml model lf _gb2evaluator (beta: `depvar' = `regs') (sigma: `sigmavars') /p /q if `touse', `technique'
		ml maximize, showeqns search(on) `difficult' `iterate' `log' `trace' `gradient' `showstep' `hessian' `showtolerance' `tolerance' `ltolerance' `nrtolerance'
		qui ereturn list
	}
end

