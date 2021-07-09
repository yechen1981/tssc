/*
Ado file:	sutex2.ado
Verion: 	1.0
Date:		2013, nov 29
Author: 	Francesco Scervini 
			francescoscerviniphd.wordpress.com
			
For any clarifications, comments or bug reports: 
francesco.scervini@unito.it
*/

// Usual preamble
set more off
cap prog drop sutex2
prog define sutex2, byable(recall)
version 9.0

// Syntax
syntax 	[varlist] [if] [in] [aweight fweight], ///
		[DIGits(integer 3)] [MINmax] [PERCentiles(numlist max=9 sort)] ///
		[VARLABels] [NA(string)] [CAPTION(string)] [TABLABel(string)] [PLacement(string)] ///
		[LONGtable] [TABULAR] [NOCHECK] [SAVing(string)] [APPEND] [REPLAce] 


***********************************

// No using with merge or append
if "`saving'" == "" & ("`append'" != "" | "`replace'" != "") {
	error

// Too few or too many digits

// Percentiles not included in summarize command
foreach a in `percentiles' {
	if 	`a' != 1 & `a' != 5 & `a' != 10 & `a' != 25 & `a' != 50 & ///
		`a' != 75 & `a' != 90 & `a' != 95 & `a' != 99 {
		di as error "Error: 'PERCentiles' must be 1, 5, 10, 25, 50, 75, 90, 95, 99."
		error
	}
}

// Tabular and longtable together

// Tabular and caption/tablabel together
	di as result ""


**************************

// This is to handle with "by", "if" and "in" -- It enters in summarize command
// Define the marker variable (touse) and set it to zero if "by" is specified
tempvar touse
mark `touse' `if' `in'
// This is the tempname of the output file


**********************************

// Not available
if "`na'" == "" {
	local na 		= "."
}

// Caption
if "`caption'" == "" {
	local caption	= "Summary statistics"
}

// Label of the table

// Position of tex table in the file
if "`placement'" == "" {
	local placement	= "htbp"
}

// Number of decimals
local dec = string(10^(-`digits'))

// File extension (if not specified in SAVing)
if "`saving'" != "" {
	if strpos("`saving'",".") == 0 {
		local file = "`saving'.tex"
	}
	if strpos("`saving'",".") != 0 {
		local file = "`saving'"
	}
}


**************************

// If BY is on, replace instead of append
if _byindex() > 1 {
	local replace	= ""
	local append	= "append"
}
if "`saving'" == "" {
	local type		= "di "
if "`saving'" != "" {
	local type		= "file write `tempfile'"
	local nline		= "_n"
}
// ...that is opened here
if "`saving'" != "" {
	file open `tempfile' using `file', write `append' `replace' text
}



// Declare locals for tab header
local n_perc: word count `percentiles'
tokenize "`percentiles'"
*forvalues b = 1/5 {
forvalues b = 1/9 {
	if `n_perc' >= `b' {
		local p`b' = "P``b''"
	}
}

// Text at the top/bottom of longtables
local headlong = "Continues from previous page"
local footlong = "Continued on next page"

// Header
local h_1 = "l c c c"
// Column titles
local nm_1 = "\multicolumn{1}{c}{Variable} & Obs & Mean & Std. Dev."
// Number of columns
local c_1 = 4

// Add columns if minmax option is on
local c_2 = 0
if "`minmax'" != "" {
	local nm_2 = "& Min & Max"
	local c_2 = 2
}

// Add columns if percentiles option is on
local c_3 = 0
if "`percentiles'" != "" {
	local d = 1
	local h_3 = ""
	local nm_3 = ""
	local c_3 = 0
	while `d' <= `n_perc' {
		local h_3 = "`h_3' c"
		local nm_3 = "`nm_3'& `p`d'' "
		local c_3 = `c_3' + 1
		local d = `d' + 1
	}
}
local h = "`h_1' `h_2' `h_3'"
local c = `c_1' + `c_2' + `c_3'


// The first line of the file
if "`saving'"=="" {
}

// The header of a tabular
if "`longtable'" == "" {
		`type'	"\begin{table}[`placement']\centering \caption{`caption'\label{`tablabel'}}"`nline'
	}
	`type'	"`nm_1'" _newline " `nm_2'" " `nm_3' \\ \hline"`nline'

// The header of a longtable
if "`longtable'"!="" {
				_newline"`nm_1'" _newline " `nm_2'" _newline " `nm_3' \\ \hline"`nline'
				_newline" \\ \hline\hline`nm_1'" _newline " `nm_2'" ///
				" `nm_3' \\ \hline"`nline'



**********************************

// This counts the number of variables
local l: word count `varlist'

// This generates and starts the routine of the variable
local i = 1
while `i' <= `l' {
	tokenize "`varlist'"
	local nom = "``i''"
	// This is the "core" command: summ, describe
		// This identifies the label...
			// ...and if it exists it will be shown
	
// This replaces special characters with LaTeX characters (DO NOT CHANGE THE ORDER!)
		local nom = subinstr("`nom'" , "\" , "$\backslash$" , .)
		local nom = subinstr("`nom'" , "_" , "\_" , .)
		local nom = subinstr("`nom'" , "{" , "\{" , .)
		local nom = subinstr("`nom'" , "}" , "\}" , .)
		local nom = subinstr("`nom'" , "%" , "\%" , .)
		local nom = subinstr("`nom'" , "#" , "\#" , .)
		local nom = subinstr("`nom'" , "&" , "\&" , .)
		local nom = subinstr("`nom'" , "~" , "\~{}" , .)
		local nom = subinstr("`nom'" , "^" , "\^{}" , .)
		local nom = subinstr("`nom'" , "$" , "\symbol{36}" , .)
		local nom = subinstr("`nom'" , "<" , "$<$" , .)
		local nom = subinstr("`nom'" , ">" , "$>$" , .)
		* not elegant, but it works!
		local nom = subinstr("`nom'" , "\symbol{36}\backslash\symbol{36}" , "$\backslash$" , .)
	}

	// This generates locals for relevant values (obs, mean, sd, min, max)
	local N		= r(N)
	local sd 	= string(round(r(sd), `dec'))
	local min	= string(round(r(min), `dec'))
	// This assigns `na' if not available
	foreach g in N mean sd min max {
		if ``g'' == . {
			local `g' = "`na'"
		}
	}
	// This is the bit of columns for minmax
	if "`minmax'" != "" {
		local n_1	= "& `min' & `max'"
	}
	
	tokenize "`percentiles'"
	local e = 1
	while `n_perc' >= `e' {
		// This generates locals for percentiles
		local p`e' 	= string(round(r(p``e''), `dec'))
		if `p`e'' == . {
			// This assigns `na' if not available
			local p`e' = "`na'"
		}

		local e = `e' + 1
	}
	// This is the bit of columns for percentiles
	local f = 1
	local n_2 = ""
	while `f' <= `n_perc' {
		local n_2 = "`n_2' & `p`f''"
		local f = `f' + 1
	}

	local n_3 = "\`nom' & `N' & `mean' & `sd' `n_1' `n_2'"

	// This print table lines (one for each variable)
	`type' "`n_3' \\"`nline'
	
	// This goes to the next variable

// Add a horizontal line

// End of table
if "`longtable'" == "" {
	if "`tabular'" == "" {
		`type' "\end{tabular}"_newline "\end{table}"
	}
	if "`tabular'" != "" {
		`type' "\end{tabular}"
	}
}

// End of longtable
if "`longtable'" != "" {
	`type' "\end{longtable}"_newline "\end{center}"			
}



if "`file'" == "" {

if "`file'" != "" {
if "`file'" != "" {

end