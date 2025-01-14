{smcl}
{* *! version 1  feb2013}{...}
{cmd:help pvvar}

{hline}

{title:Title}

{p2colset 8 20 21 2}{...}
{p2col:{hi:pvvar} {hline 2}}Returns the present value of a series of payments (cash flows){p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 18 2}
{cmd:pvvar} 
{it: varname1 varname2}
[, {it:options} ]

{synoptset 24 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Options}
{synopt:{cmd:due(#)}}When payments are due or made: 0 = end of period (default), or 1 = beginning of period
{p_end}
{synopt:{cmdab:gen:erate(}{it:string}{cmd:)}}Set the new variable's name.
{p_end}
{synoptline}
{p2colreset}{...}

{title:Description}

{pstd}
{cmd:pvvar} Returns the present value of a series of payments (based on a compounded interest rate). 
The cash flows must occur at regular intervals and match the corresponding periodic discount rate.
{cmd:pvvar} generates a new variable containing the entire schedule of discounted cash flows. 


{dlgtab:Options}

{phang}
{opt due(#)} When payments are due or made: 0 = end of period (default), or 1 = beginning of period. 

{phang}
{cmdab:gen:erate(}{it:string}{cmd:)} Set the middle part of new variable's name, default is {it:d}. 
The new {it:varname} is composed as follows: {it:varname1} + _d + value of due option.


{title:Definitions}

{cmd:pvvar} uses the following conventions:

   � Periodic cash flows must be placed in {it:varname1}.

   � Periodic discount rate must be placed in {it:varname2}. Enter as a decimal fraction (so should be greater than 0 and smaller than 1).

{title:Input Arguments}

The first entry in each {bf:varname} should be the initial period's value.


{title:Example}

Find the (end of period) present value of the following yearly cash flows.

{cmd:. list year cash_flow disc_rate if year<=5, sep(0) noobs}

	{txt}
	         {c TLC}{hline 28}{c TRC}
	         {c |}{res} year  cash_flow  disc_rate {txt}{c |}
    	         {c LT}{hline 28}{c RT}
	         {c |}  1     {c S|} 10,000     0.15{txt}   {c |}
	         {c |}  2     {c S|} 20,000     0.10{txt}   {c |}
	         {c |}  3     {c S|} 30,000     0.12{txt}   {c |}
	         {c |}  4     {c S|} 40,000     0.14{txt}   {c |}
	         {c |}  5     {c S|} 50,000     0.15{txt}   {c |}
	         {c BLC}{hline 28}{c BRC}

{cmd:. pvvar cash_flow disc_rate}
Present Value = {bf:95120.032}
{it:Note}: New variable's name is {bf:cash_flow_d0}


{title:Examples}

{phang}{cmd:. pvvar var1 var2, due(1)}{p_end}
{phang}{cmd:. pvvar var1 var2, due(1) gen(disc)}{p_end}


{title:Saved results}
{synoptset 15 tabbed}{...}
{p2col 5 15 19 2: Scalars}{p_end}
{synopt:{cmd:r(due)}}due value{p_end}
{synopt:{cmd:r(PV)}}Present value of cash flows{p_end}


{title:Author}

Maximo Sangiacomo
{hi:Email:  {browse "mailto:msangia@hotmail.com":msangia@hotmail.com}}

