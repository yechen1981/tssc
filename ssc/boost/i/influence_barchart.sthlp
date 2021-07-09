{smcl}
{* *! version 0.0.1  28jan2016}{...}
{viewerjumpto "Syntax" "influence_barchart##syntax"}{...}
{viewerjumpto "Description" "influence_barchart##description"}{...}
{viewerjumpto "Options" "influence_barchart##options"}{...}
{viewerjumpto "Examples" "influence_barchart##examples"}{...}
{viewerjumpto "Authors" "influence_barchart##authors"}{...}

{...}{* NB: these hide the newlines }
{...}
{...}
{title:Title}

{p2colset 5 18 20 2}{...}
{p2col :{cmd:influence_barchart} {hline 2}}Create a barchart of variable influence for boosting {p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:influence_barchart} [{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opt min:_influence(real)}} The minimum influence percentage required for the variable 
to be displayed in the barchart. Default: {cmd:min_influence(1)}.{p_end}
{synopt :{opt top(int)}}  Display the largest "top" number of influences. 
Default: {cmd:top(15)}.{p_end}
{synopt :{opt cat:egory(int)}}  For multinomial outcomes specify which outcome category is meant. 
Default: {cmd:category(1)}.{p_end}

{synopt :{opt plot:only}} Generate plot from variables without processing e(influence).{p_end}
{synopt :{opt tidytext("str")}} Remove specified string from the end of the variable label.{p_end}
{synopt :{opt counttext}} Keep "# of" from variable label.{p_end}
{synopt :{opt <other options>}} Any additional options are passed to the graph. 

{synoptline}

{marker description}{...}
{title:Description}

{pstd}
{cmd:influence_barchart} is a postestimation command for {cmd:boost} by the same author.  
{cmd:influence_barchart} creates  a  barchart of influence of variables in boosting using 
 e(influence) from the preceeding boost command. 
 
{pstd}
Two variables are created "influence1" and "influence_id". If there is a multinomial outcome with k categories 
additional influence variables are created up to "influence`k'"


{marker remarks}{...}
{title:Remarks}

{pstd}
If there are more variables than observations, {cmd:set obs} is increased to the number of variables.

{marker options}{...}
{title:Options}

{phang}
{marker min_influence}{...}
{opt  min:_influence} gives a threshold value in percent (real values from 0 to 100). If the influence of a variable is below the threshold
the variable is now shown in the barchart. 
The default value is 1, meaning all variables with at least 1% influence are displayed. 
Only one of {cmd:top} or {cmd: min_influence} should be specified.{p_end}

{phang}
{marker top}{...}
{opt top} Display the largest "top" number of influences. By default, the largest 15 influences are displayed.  
Only one of {cmd:top} or {cmd: min_influence} should be specified.

{phang}
{marker category}{...}
{opt  cat:egory} For multinomial outcomes in boosting the influence of x-variables are different 
for different outcomes. This option specifies which for which category the barchart should
be generated. Valid inputs are integers from 1 to the number of categories.

{phang}
{opt plot:only}{...}  Usually, influence variables are created and then the plot is generated from those variables.
If the variables are already created this option allows to generate the plot directly from the variables.
This is useful for generating a barchart with a different value for min_influence, or 
with a different category for a multinomial outcome.

{phang}
{opt  tidytext(str)} The text generated by ngram contains the name of the text variable at the end as follows: " in myvar").
 This option allows removes the string specified in tidytext from the end of the variable label. 
 The most common use is  tidytext(" in myvar") where myvar is the text variable.


{phang}
{opt  counttext} The text generated by ngram starts with "# of <word>". This is useful for counts, but less so for indicator variables. 
If not specified, this text is removed.

{phang}
Additional options can be passed to graph hbar. This can be useful, for example, 
if a different axis label (ytitle) is desired.

{marker examples}{...}
{title:Examples}

{pstd}Example:  Display an influence barchart with all variables that had at least 2% 
influence. {cmd:boost} is a user-written program and has to be loaded first.

{phang}{cmd:. boost  y x1-x5 , influence predict(pred) dist(logistic) }

{phang}{cmd:. influence_barchart, min_influence(2)  }

{pstd} Rerun with a different minimum influence cutoff:

{phang}{cmd:. influence_barchart, min_influence(3) plotonly  }


{marker authors}{...}
{title:Authors}

{pmore} Matthias Schonlau <schonlau@uwaterloo.ca>{p_end}




