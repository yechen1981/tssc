* 0-TRUNCATED POISSON REGRESSION : Joseph Hilbe 14Dec1997* OPTIONS: tolerance,log,offset,score,robust,cluster, eformprogram define trpois0 version 5.0 local options "Level(integer $S_level) IRr" if "`*'"=="" | substr("`1'",1,1)=="," {   if "$S_E_cmd"=="trpois0" {     error 301   }   parse "`*'"   if `level'<10 | `level'> 99 {     di in red "level() must be between 10 and 99"     exit 198   } } else {   local varlist "req ex"   local options "`options' LTolerance(real -1) noLOg ITerate OFfset(string) SCore(string) Robust CLuster(string) *"   local in "opt"   local if "opt"   local weight "fweight aweight"   parse "`*'"   parse "`varlist'",parse(" ")   if "`log'"!="" { local log "quietly" }   global S_mloff "`offset'" tempvar touse mysamp tempname b f V mark `touse' `if' `in' markout `touse' `varlist' `offset'  if "`weight'" != "" {        tempvar wvar        gen double `wvar' `exp'  }  else  local wvar   1  if ("`weight'"=="aweight")  {        qui sum `wvar'        qui replace `wvar' = `wvar'/_result(3)  }  if "`offset'" != "" {        local ovar "`offset'"  }  else  local ovar   0* ESTIMATION OF LL0 quietly {   eq `1': `1'   ml begin   ml function trpoislf		   ml method lf   ml model `b' = `1'   ml sample `mysamp' [`weight' `exp'] if `touse'    `log' ml maximize `f' `V', `options'    local lf0 = `f'   drop `mysamp' } * ESTIMATION OF FULL MODEL   eq `1': `varlist'   ml begin   ml function trpoislf   ml method lf   ml model `b' = `1'   ml sample `mysamp' [`weight' `exp'] if `touse'    `log' ml maximize `f' `V', `options'    ml post trpois, title("0-Truncated Poisson Estimates") lf0(`lf0') pr2* ROBUST CALCULATIONS   local y "`1'"   mac shift   global rhs `*'    tempname b V   tempvar xb e   mat `b' = get(_b)   mat `V' = get(VCE)   predict double `xb', index   qui gen double `e' = (`y'-exp(`xb'+`ovar') - (exp(`xb'+`ovar') * exp(-exp(`xb'+`ovar')))/(1-exp(-exp(`xb'+`ovar')))) if `touse'   if "`score'"!="" {     gen `score' = `e'   }   if "`robust'"!="" & "`cluster'"=="" {      _robust `e' if `touse'      qui test $rhs, min      local ch2 = _result(6)   }   if "`cluster'"!="" {      _robust `e' if `touse', cluster(`cluster')      qui test $rhs, min      local ch2 = _result(6)   }   if "`irr'"!="" {      local eform "eform(IRR)"   }}ml mlout trpois, level(`level') `eform'end