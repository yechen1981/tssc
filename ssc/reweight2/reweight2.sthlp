{smcl}
{* *! version 1.1.0  26jul2011}{...}
{cmd:help reweight2}
{hline}

{title:Title}

{phang}
{bf:reweight2} {hline 2} Reweight data to user-defined control totals


{title:Syntax}

{p 8 17 2}
{cmdab:reweight2:}
{cmd:using} {it:filename} {cmd:,} {cmd:newweight}({it:newvar}) [{cmd:oldweight}({it:varname})] 

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opth oldweight(varname)}}name of original weighting variable if it exists, otherwise constant is created{p_end}
{synopt:{opth newweight(newvar)}}name of new variable generated by 
{cmd:reweight2} containing new weights{p_end}

{p2colreset}{...}

{title:Description}

{pstd}
{cmd:reweight2} calculates new weights for data to match control totals specified in {it:filename}, where {it:filename} is a text (ASCII) file that can be read in by {cmd:insheet} (i.e. the format of the file must be specified
otherwise .raw will be assumed). The first column in {it:filename} must contain names of variables in the original dataset and the second column must 
contain the control totals that you want the weighted data to sum to with {cmd:newweight}. Note that {cmd:reweight2} does not deal with categorical variables,
these must be converted to dummy variables for each category using {cmd: tab, gen}, for example. 

{pstd}
{cmd:reweight2} uses the algoroithm defined in Gomulka (1992) to minimize the difference between {cmd:oldweight} and {cmd:newweight} subject to the 
constraints specified in {it:filename} being satisfied. 


{title:Options}

{dlgtab:Main}

{phang}
{opt oldweight:}({it:varname}) specifies the existing weight variable in the data. If {cmd:oldweight} is not specified, {cmd:reweight2} creates a constant and minimises the 
distance between this and {cmd:newweight}.

{phang}
{opt newweight:}({it:newvar}) specifies the name of the new weighting variable you want {cmd:reweight2} to create. 

{title:Example}

{pstd}
Consider the following example from Creedy(2003). 
{cmd:id} is the identification number of each unit included in the survey, {cmd:x1}, {cmd:x2}, {cmd:x3} and {cmd:x4} are variables included in the survey, {cmd:weight} is the vector of original survey weights:
	
{cmd}
. use http://fmwww.bc.edu/repec/bocode/r/reweight.dta, clear

. list
{txt}
     +---------------------------------+
     | id   x1   x2   x3   x4   weight |
     |---------------------------------|
  1. |  1    1    1    0    0        3 |
  2. |  2    0    1    0    0        3 |
  3. |  3    1    0    2    0        5 |
  4. |  4    0    0    6    1        4 |
  5. |  5    1    0    4    1        2 |
     |---------------------------------|
  6. |  6    1    1    0    0        5 |
  7. |  7    1    0    5    0        5 |
  8. |  8    0    0    6    1        4 |
  9. |  9    0    1    0    0        3 |
 10. | 10    0    0    3    1        3 |
     |---------------------------------|
 11. | 11    1    0    2    0        5 |
 12. | 12    1    1    0    1        4 |
 13. | 13    1    0    3    1        4 |
 14. | 14    1    0    4    0        3 |
 15. | 15    0    0    5    0        5 |
     |---------------------------------|
 16. | 16    0    1    0    1        3 |
 17. | 17    1    0    2    1        4 |
 18. | 18    0    0    6    0        5 |
 19. | 19    1    0    4    1        4 |
 20. | 20    0    1    0    0        3 |
     +---------------------------------+

{txt}
{pstd}
The vector of survey weights produces the following aggregate totals: 

{cmd}
. tabstat x1 x2 x3 x4 [w = weight], s(su)
(analytic weights assumed)

{txt}

   stats |        x1        x2        x3        x4
---------+----------------------------------------
     sum |        44        24       213        32
--------------------------------------------------

{pstd}
Now, let us assume that external information on these variables are available, and that the true totals are:


   stats |        x1        x2        x3        x4
---------+----------------------------------------
     sum |        50        20       230        35
--------------------------------------------------

{pstd}
In this case, {cmd:reweight2} can be used to adjust the survey weights so that the new survey totals match the true totals:

{pstd}
To do this, first create a spreadsheet file with these control totals and save as, say, {cmd} example.csv:

	x1	50
	x2	20
	x3	230
	x4	35

{txt}{pstd}
Then run the following command:

{cmd}
. reweight2 using example.csv, oldweight(weight) newweight(newweight)


. tabstat x1 x2 x3 x4 [w = newweight], s(su)
(analytic weights assumed)

{txt}

   stats |        x1        x2        x3        x4
---------+----------------------------------------
     sum |        50        20       230        35
--------------------------------------------------

{cmd}
. list weight newweight 
{txt}
     +--------------------+
     | weight   newweight |
     |--------------------|
  1. |      3   3.043628  |
  2. |      3    1.70822  |
  3. |      5   4.451928  |
  4. |      4   4.323331  |
  5. |      2   2.835381  |
     |--------------------|
  6. |      5   5.072713  |
  7. |      5   7.048317  |
  8. |      4   4.323331  |
  9. |      3    1.70822  |
 10. |      3   2.048059  |
     |--------------------|
 11. |      5   4.451928  |
 12. |      4   4.756732  |
 13. |      4   4.865517  |
 14. |      3   3.628476  |
 15. |      5    3.95583  |
     |--------------------|
 16. |      3   2.002268  |
 17. |      4   4.174617  |
 18. |      5   4.610522  |
 19. |      4   5.670763  |
 20. |      3    1.70822  |
     +--------------------+


{title:Also see}

{psee}
{space 2}Help:  {manhelp tabulate R} {manhelp insheet D}

{title:Thanks for citing reweight2 as follows}

{pstd}
Browne, J. (2012), {it: Reweight2: Stata command to reweight data to user-defined control totals}. 

{title:Disclaimer}

{pstd}
THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

    IN NO EVENT WILL THE COPYRIGHT HOLDERS OR THEIR EMPLOYERS, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THIS SOFTWARE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL,
    INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USER'S ABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
    PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.


{title:References}

{pstd}
Gomulka, J. (1992), ‘Grossing-up revisited’, in R. Hancock and H. Sutherland (eds), {it:Microsimulation Models for Public Policy Analysis: New Frontiers}, 
STICERD Occasional Paper, London: London School of Economics.

{phang} 
Creedy, J. (2003), {it: Survey Reweighting for Tax Microsimulation Modelling}, Treasury Working Paper Series 03/17, New Zealand Treasury.

{title:Author}

{pstd}
James Browne, Institute for Fiscal Studies, London, UK. If you observe any problems {browse "mailto:james_browne@ifs.org.uk"}





