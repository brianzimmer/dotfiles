" Vim syntax file
" Language:	Spectre circuit simulator input netlist
" Maintainer:	Ahmed Nabil "anabil@ieee.org"
" Last Change:  29/04/2002	
" Comments:   	Spectre is an advanced circuit simulator from Cadence Design Systems
"		that simulates analog and digital circuits at the differential equation level.
"
" This is based on spice.vim by Noam Halevy

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" spectre syntax is case INsensitive
syn case ignore

syn keyword	spectreTodo	contained TODO

syn keyword 	spectreStatement   ac alter check dc envlp info montecarlo noise options pac pdisto pnoise psp pss pxf 
syn keyword 	spectreStatement   qpac qpnoise qpss qpxf set shell sp sweep tdr tran xf

syn keyword 	spectreStatement   include section simulatorOptions modelParameter element outputParameter saveOptions simultor

syn keyword 	spectreStatement   abs acos acosh altergroup asin asinh atan atan2 atanh ceil correlate cos cosh else end 
syn keyword 	spectreStatement   ends exp export floor fmod for function global hypot ic if inline int library local log
syn keyword 	spectreStatement   log10 march max min model nodeset parameters paramset plot pow print pwr real return
syn keyword 	spectreStatement   save sens simulator sin sinh sqrt statistics subckt tan tanh to truncate vary

syn keyword 	spectreKeyword     model a2d b3soipd bjt bjt301 bjt500 bjt503 bsim1 bsim2 bsim3 bsim3v3 btasoi 
syn keyword 	spectreKeyword     capacitor cccs ccvs cktrom core d2a delay dio500 diode ekv fourier gaas hbt 
syn keyword 	spectreKeyword     hvmos inductor intcap iprobe isource jfet juncap misnan mos0 mos1 mos15 mos2 
syn keyword 	spectreKeyword     mos3 mos30 mos3002 mos705 mos902 mos903 msline mutual_inductor nodcap node
syn keyword 	spectreKeyword     nport paramtest pcccs pccvs phy_res port pvccs pvcvs quantity rdiff relay
syn keyword 	spectreKeyword     resistor scccs sccvs svccs svcvs switch tline tom2 transformer vbic vccs
syn keyword 	spectreKeyword     vcvs vsource winding zcccs zccvs zvccs zvcvs

" Numbers, all with engineering suffixes and optional units
"==========================================================
"floating point number, with dot, optional exponent
syn match spectreNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match spectreNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match spectreNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

" Misc
"=====
syn match   spectreWrapLineOperator       "\\$"
syn match   spectreWrapLineOperator       "^+"
syn match   spectreIgnore		  "\ \ \ "

syn match   spectreStatement      "^ \=\.\I\+"
syn region  spectreString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+

syn region spectreComment start="//" end="$" contains=spectreTodo

" Matching pairs of parentheses
"==========================================
syn region  spectreParen transparent matchgroup=spectreOperator start="(" end=")" contains=ALLBUT,spectreParenError
syn region  spectreSinglequote matchgroup=spectreOperator start=+'+ end=+'+ oneline
"syn match spectreKeyword /)\ \<[a-z]\+[0-9]*[a-z]*\>\ /

" Errors
"=======
syn match spectreParenError ")"

" Syncs
" =====
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_spectre_syntax_inits")
  if version < 508
    let did_spectre_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink spectreTodo	         Todo
  HiLink spectreWrapLineOperator spectreOperator
  HiLink spectreSinglequote      spectreExpr
  HiLink spectreExpr             Function
  HiLink spectreParenError       Error
  HiLink spectreStatement        Statement
  HiLink spectreNumber           Number
  HiLink spectreComment          Comment
  HiLink spectreOperator         Operator
  HiLink spectreString           String
  HiLink spectreKeyword          Type 
  HiLink spectreIgnore		 Ignore

  delcommand HiLink
endif

let b:current_syntax = "spectre"

" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'spectre\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/spectre.vim

" vim: ts=8
