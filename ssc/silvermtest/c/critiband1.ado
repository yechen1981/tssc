*! version 4.0 por Isaias H. Salgado-Ugarte, Makoto Shimizu
*! and Toru Taniuchi,University of Tokyo, Faculty of
*! Agriculture, Dept. of Fisheries (Fax 81-3-3812-0529)
*! version 11.0 modificada por Nestor A. Mosqueda Romo 09-02-2011
program define critiband1
version 11.0

local varlist "req ex min(1) max(1)"
local if "opt"
local in "opt"
#delimit ;

local options
 "BWHigh(real 0) BWLow(real 0) STsize(real 0) Mval(int 0)
  noGraph T1title(string) MSymbol(string)
  Connect(string) *";

#delimit cr
parse "`*'"
parse "`varlist'", parse(" ")
quietly {

preserve

tempvar  countr xvar
gen `xvar'=.

if `bwhigh'==0 {
     di in red "you must provide the high bandwidth limit"
     exit
} /* modificado */

if `bwlow'==0 {
     di in red "you must provide the low bandwidth limit"
     exit
} /* modificado */

if `stsize'==0 {
     di in red "you must provide the interval step size"
     exit
} /* modificado */

if `mval'==0 {
     di in red "you must provide the number of shifted histograms"
     exit
} /* modificado */


gen `countr'=1

local nrf = round((`bwhigh'- `bwlow')/`stsize')

*noi di `nrf'

tempvar difvar mode sumo
gen `difvar'=0
gen `mode'=0
gen `sumo'=0

tempvar cm wm wm2 count
gen `cm'=0
gen `wm'=0
gen `wm2'=0
gen `count'=0

tempvar fh fh1 fh2 lfh
gen `fh'=0
gen `fh1'=0
gen `fh2'=0
gen `lfh'=0

tempvar midval index index2
gen `midval'=0
gen `index'=0
*gen `index2'=0

tempfile _data
save `_data'

tempvar numera
gen `numera'=0

local bwhigh = `bwhigh'+`stsize'

set more off
while `countr'<=`nrf'+ 1 {

replace `xvar'=`1'
*  drop if `xvar'==.
  gen `index2'=0

  summ `xvar'
  local hv =`bwhigh' - `stsize'
*  noi di  `hv'
  local mv=`mval'
*  local cnm=`cnmodes'
  scalar nuobs= r(N) /* modificado */
  scalar maxval= r(max) /* modificado */
  scalar minval= r(min) /* modificado */


  replace `index'=0
  replace `index2'=0

  scalar hval=`hv'*4

  scalar mval=`mv'
*  scalar cnmv=`cnm'
  scalar delta=hval/mval
  local numbin=int((maxval-minval)/delta)+2*(mval+1+round((mval/10)+0.5),1)
  if `numbin'>_N {
      set obs `numbin'
      }
  scalar start=(minval-hval)-delta*.1
  if start<0 {
     scalar origin=(round(((start/delta)-0.5),1)-0.5)*delta
     }
  else {
     scalar origin=(int(start/delta)-0.5)*delta
     }

  replace `index'=int((`xvar'-origin)/delta)
  replace `index2'=`index'
  tempvar freq
  *noi di `index2'
  egen `freq'=count(`xvar'), by(`index2')
  sort `xvar'
  replace `freq'=. if `index2'[_n-1]==`index2'[_n]
  replace `index'=. if `index2'[_n-1]==`index2'[_n]
  tempfile resu1 resu2
  save `resu1'
  keep `index' `freq'
  drop if `freq'==.
  tempvar freqc indexc
  rename `index' `indexc'
  rename `freq' `freqc'
  save `resu2'
  use `resu1', clear
  merge using `resu2'
  drop `index' `freq' _merge `index2'
  rename `indexc' `index'
  rename `freqc' `freq'

  replace `cm'=0.3989*4/(nuobs*hval)
  replace `wm'=`cm'*exp(-8*((_n-1)/mval)^2)

  replace `wm'=0 if _n>mval
  replace `wm2'=`wm'[_n-(mval-1)]
  replace `wm2'=`wm'[(mval+1)-_n] if _n<mval

  summ `freq'
  scalar binum= r(N) /* modificado */
  replace `fh'=0
  replace `fh1'=0
  replace `fh2'=0
  replace `count'=1
  while `count' <= binum {
    replace `fh1'=`wm2'*`freq'[`count'] if _n<mval*2
    replace `fh2'=`fh1'[_n-(`index'[`count']-mval)]
    replace `fh2'=0 if `fh2'==.
    replace `fh'=`fh'+`fh2'
    replace `fh2'=0
    replace `fh1'=0
    replace `count'=`count'+1
    }
  replace `midval'=((0.5+(_n-1))*delta)+origin
  if `numbin'<_N {
    replace `fh'=. if _n>`numbin'
    replace `midval'=. if _n>`numbin'
    }
  replace `lfh'=`fh'[_n-(`index'[1]-mval)]
  replace `lfh'=0 if `lfh'==.
*replace `midval'=(`midval'[_N-1]-`midval'[_N-2])+`midval'[_N-1] if _n==_N
  if `numbin'<_N {
      replace `lfh'=. if _n>`numbin'

      }



if "`graph'" != "nograph"  { /* modificado */

   local hvlab=string(round(`hv',.000001),"%12.6f")

 *   if "`t1title'" ==""{
         local t1title "WARPing density"
         local t1title "`t1title', bw = `hvlab', M = `mv', Gaussian kernel"
 *        }

   if "`msymbol'"=="" { /* modificado */
 local msymbol "p" /* modificado */
} /* modificado */
   if "`connect'"=="" {

      local connect "l"
   }

      label variable `lfh' "Density"
      label variable `midval' "Midpoints"
      scatter `lfh' `midval', `options' /* /* modificado */
				*/ t1("`t1title'") /*
				*/ ms(`msymbol') c(`connect') /* modificado */ 

}

local bwhigh = `hv'

*  Mode counter
   replace `difvar'=`lfh'[_n+1] - `lfh'[_n]
   replace `mode' = 0
   replace `mode'=1 if `difvar'[_n]>=0 & `difvar'[_n+1] < 0
   replace `sumo' = sum(`mode')
   local nomo= `sumo'[_N]
   #delimit ;
   noi display as result "Estimation number = " _col(15)`countr' _col(30)"Bandwidth = " `hv'
   _col(50)"Number of modes = " `nomo';
   #delimit cr
   replace `countr'=`countr'+1

  * replace `numera'= `numera'+1 if `nomo'>cnmv

   keep `countr' `numera'
   merge using `_data'
   drop _merge
   replace `countr'=`countr'[1]
   replace `numera'=`numera'[1]
}
*while

}
*quietly


set more on
end
