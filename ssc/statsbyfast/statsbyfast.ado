*! statsbyfast v1.1.0 17July2003 M Blasnik
*! based on statsby version 1.2.3  24oct2002
*! runs much faster on large panel datasets
program statsbyfast, rclass
	version 8
	local version = _caller()
	local vv : di "version `version':"

	_cmdxel cmd names exp val K 0 : stat post "" "`version'" `0'
	local cmdif `s(cmdif)'
	local cmdin `s(cmdin)'
	local cmdnoif `s(cmdnoif)'
	/* ignore s(keep), it cannot be used with -statsby- */
	/* ignore s(warn), its not needed by -statsby- */
	forvalues i = 1/`K' {
		local exps `exps' exp`i'(`exp`i'')
	}
	/* Stuff in `0', if anything, should be options. */
	syntax [,			///
		BY(varlist)		///
		Total			///
		Subsets			///
		DOUBle			///
		CLEAR			/// new options
		Dots			///
		NOIsily			///
		SAving(str)		///
		REPLACE			///
		EVery(passthru)		/// _cmdxel options
		nocheck			///
		noesample		///
		noheader		/// undocumented
		nowarn			///
	]

	if "`check'" != "" {
		di as error "`check' invalid"
		exit 198
	}
	if "`esample'" != "" {
		di as error "`esample' invalid"
		exit 198
	}
	if "`warn'" != "" {
		di as error "`warn' invalid"
		exit 198
	}

	/* finish header */
	if `"`by'"' == "" {
		di as txt "by:" _col(15) "<none>"
	}
	else    di as txt "by:" _col(15) `"`by'"'
	tempvar touse
	mark `touse' `cmdif' `cmdin'
	if `"`by'"' != "" {
		markout `touse' `by'
	}
	qui replace `touse' = . if `touse' == 0
	qui des, short
	if r(changed) & ("`clear'" == "") & (`"`saving'"' == "" ) {
		error 4
	}
	if `"`saving'"' == "" {
		tempfile saving
		local filetmp "yes"
		if `"`every'"' != "" {
			di as err /*
*/ "every() can only be specified when using saving() option"
                	exit 198
		}
        	if "`replace'" != "" {
                	di as err /*
*/ "replace can only be specified when using saving() option"
                	exit 198
        	}
	}
	else {
		if `"`replace'"' == "" {
			confirm new file `"`saving'"'
		}
		if `"`clear'"' != "" {
			di as err /*
*/ "clear and saving() are mutually exclusive options"
			exit 198
		}
	}

	tempname postname
	postfile `postname' `by' `names' using `"`saving'"', `double' /*
	*/ `replace' `every'

	if "`subsets'" != "subsets" {
		`vv' PostGroups `touse' = `K'		/*
			*/ ,				/*
			*/ cmd(`cmd')			/*
			*/ cmdnoif(`cmdnoif')		/*
			*/ by(`by')			/*
			*/ by0(`by')			/*
			*/ postname(`postname')		/*
			*/ `dots'			/*
			*/ `noisily'			/*
			*/ `total'			/*
			*/ `exps'			/*
			*/
		return scalar N_groups = r(N_groups)
	}
	else {
		`vv' SubSets `touse' = `K'		/*
			*/ ,				/*
			*/ cmd(`cmd')			/*
			*/ cmdnoif(`cmdnoif')		/*
			*/ by(`by')			/*
			*/ postname(`postname')		/*
			*/ `dots'			/*
			*/ `noisily'			/*
			*/ `exps'			/*
			*/
		return scalar N_subsets = r(N_subsets)
	}
	if `"`dots'"' != "" {
		 di _n
	}

	/* save variable labels of by vars */
	if "`by'" != "" {
		tokenize `by'
		local j = 1
		while "``j''" != "" {
			local varlb`j' : variable label ``j''
			local lb`j' : value label ``j''
		        if "`lb`j''" != "" {
				tempfile f`j'
				qui label save `lb`j'' using `"`f`j''"'
			}
			local j = `j' + 1
		}
	}

	postclose `postname'
	if `"`filetmp'"' == "" {
		preserve
	}

	/* get/save the labels of the by vars */
	qui use `"`saving'"', clear
	if "`by'" != "" {
		sort `by'
		tokenize `by'
		local j = 1
		while "``j''" != "" {
			label var ``j'' `"`varlb`j''"'
			if `"`f`j''"' != "" {
				qui run `"`f`j''"'
				label val ``j'' `lb`j''
			}
			local j = `j' + 1
		}
	}

	/* save labels for the generated vars */
	forval i = 1/`K' {
		local name : word `i' of `names'
		label var `name' `"`exp`i''"'
	}
	label data `"statsby: `cmd'"'
	if `"`filetmp'"' == "" {
		qui save `"`saving'"', replace
	}
	global S_FN
	global S_FNDATE
	return local by `by'
end

program PostGroups, rclass
	version 8
	local vv : di "version " _caller() ":"

	/* parse */
	syntax varlist(max=1) =exp,	/* tousevar = # of exps
	*/	cmd(string)		/*
	*/	cmdnoif(string)		/*
	*/	postname(string)	/*
	*/	[			/*
	*/	cmdcomma(string)	/*
	*/	by(varlist)		/*
	*/	by0(varlist)		/*
	*/	count(integer 0)	/*
	*/	Dots			/*
	*/	NOIsily			/*
	*/	subset			/*
	*/	total			/*
	*/	*			/*
	*/	]
	local touse `varlist'

	/* get expressions */
	local K `exp'
	confirm integer number `K'
	forval i = 1/`K' {
		local exps `exps' exp`i'(string)
	}
	local 0 , `options'
	syntax [, `exps' ]
	if `"`subset'"' == "" {
		local subset group
	}

	/* by varlist with individual parens: for -post- */
	tempname byobs
	scalar `byobs' = 1
	foreach name of local by {
		local misby `misby' (.)
		local pby `pby' (`name'[`byobs'])
	}
	local dots = cond("`dots'" == "" | "`noisily'" != "", "*", "noisily")
	local noi = cond("`noisily'"=="", "*", "noi")
	forval i = 1/`K' {
		tempname x`i'
		local misexps `misexps' (.)
		local pexps `pexps' (`x`i'')
	}
	if `"`by'"' == "" | `"`by0'"' == "" {
		local count = `count' + 1
		`dots' di as txt "." _c
		/* run command and post results */
		`noi' di as txt _n /*
*/ "running (" as inp `"`cmd'"' as txt ") on `subset' `count'" _n
		`noi' di as inp ". `cmd'"
		cap `noisily' `vv' `cmd'
		if _rc {
			`noi' di in smcl as err /*
*/ `"{p 0 0 2}captured error running (`cmd'), posting missing values{p_end}"'
			post `postname' `pby' `misexps'
		}
		else {
			forval i = 1/`K' {
				capture scalar `x`i'' = `exp`i''
				if _rc {
					if _rc == 1 {
						error 1
					}
					`noi' di in smcl as error /*
*/ `"{p 0 0 2}captured error in `exp`i'', posting missing value{p_end}"'
					scalar `x`i'' = .
				}
			}
			post `postname' `pby' `pexps'
		}
	}
	else {
	 	if "`total'" != "" {
			`dots' di as txt "." _c
			cap `vv' `cmd'
			if _rc {
				`noi' di in smcl as err /*
*/ `"{p 0 0 2}captured error running (`cmd'), posting missing values{p_end}"'
				post `postname' `pby' `misexps'
			}
			else {
				forval i = 1/`K' {
					capture scalar `x`i'' = `exp`i''
					if _rc {
						if _rc == 1 {
							error 1
						}
						`noi' di in smcl as error /*
*/ `"{p 0 0 2}captured error in `exp`i'', posting missing value{p_end}"'
						scalar `x`i'' = .
					}
				}
				post `postname' `misby' `pexps'
			}
		}

						/* groups */
		local sortvars : sortedby
		sort `touse' `by0' `sortvars'
		tempvar group grpcnt
		by `touse' `by0' : gen `group' = (_n==1)
		bys `touse' `by0' : gen `grpcnt' = _N if `touse'
		qui replace `group' = sum(`group')
		qui replace `group' = . if missing(`touse')
		summ `group', mean
		local ngrp = r(max)
		*if `"`sortvars'"' != "" {
 		*	sort `sortvars'
		*}
		qui count if `touse'
		local usecnt=r(N)
		tempvar id
		qui gen `id' = _n
		local j=_N-`usecnt'+1
		while `j'<=_N {
			local end=`j'+`grpcnt'[`j']-1
			local count = `count' + 1
			*sum `id' if `group'==`j', mean
			scalar `byobs' = `j'
			`noi' di as txt _n /*
*/ "running (" as inp `"`cmd'"' as txt ") on `subset' `count'" _n
			`noi' di as inp ". `cmd'"
			`dots' di as txt "." _c
			cap `noisily' `vv' `cmdnoif' `cmdcomma'		/*
			*/	in `j'/`end'	/*
			*/
			if _rc {
				`noi' di in smcl as err /*
*/ `"{p 0 0 2}captured error running (`cmd'), posting missing values{p_end}"'
				post `postname' `pby' `misexps'
			}
			else {
				forval i = 1/`K' {
					capture scalar `x`i'' = `exp`i''
					if _rc {
						if _rc == 1 {
							error 1
						}
						`noi' di in smcl as error /*
*/ `"{p 0 0 2}captured error in `exp`i'', posting missing value{p_end}"'
						scalar `x`i'' = .
					}
				}
				post `postname' `pby' `pexps'
			}
		local j=`end'+1
		}
	}
	return scalar N_groups = `count'
end

program SubSets, rclass
	version 8
	local vv : di "version " _caller() ":"

	/* parse */
	syntax varlist(max=1) =exp,	/* tousevar = # of exps
	*/	[			/*
	*/	by(varlist)		/*
	*/	*			/*
	*/	]

	local bynum : word count `by'
	tempname M
	GetMat `bynum' `M'
	local rnum = 2^`bynum'
	local count = 0
	forval i = 1/`rnum' {
		tokenize `by'
		preserve
		local by0
		forval j = 1/`bynum' {
			if `M'[`i',`j'] {
				local by0  `by0' ``j''
			}
			else qui replace ``j'' = .
		}
		`vv' PostGroups `varlist' `exp',	/*
			*/ by(`by')			/*
			*/ by0(`by0')			/*
			*/ count(`count')		/*
			*/ subset			/*
			*/ `options'			/*
			*/
		local count = r(N_groups)
		restore
	}
	return scalar N_subsets = `count'
end

/*
   The following generates a matrix of 0's and 1's, each row determining a
   unique subset among all possible subsets.

*/
program GetMat
	args bynum	M
	local rnum = 2^`bynum'
	mat `M' = J(`rnum', `bynum',0)
	local i 0
	while `i' <= `rnum'-1 {
		local j = `bynum'
		local a `i'
		while `j' > = 1 {
			if `a' == 0 {
				local j = 0
			}
			else {
				local b  mod(`a', 2)
				local a  int(`a'/2)
				mat `M'[`i'+1,`j'] = `b'
				local j = `j' - 1
			}
		}
		local i = `i' + 1
	}
end
exit
