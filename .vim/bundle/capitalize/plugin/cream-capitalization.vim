"
" cream-capitalization.vim
"
" Cream -- An easy-to-use configuration of the famous Vim text  editor
" [ http://cream.sourceforge.net ] Copyright (C) 2001-2007  Steve Hall
"
" License:
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of  the  License,  or
" (at your option) any later version.
" [ http://www.gnu.org/licenses/gpl.html ]
"
" This program is distributed in the hope that it will be useful,  but
" WITHOUT  ANY  WARRANTY;  without  even  the  implied   warranty   of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR  PURPOSE.  See  the  GNU
" General Public License for more details.
"
" You should have received a copy of the GNU  General  Public  License
" along with  this  program;  if  not,  write  to  the  Free  Software
" Foundation,  Inc.,  59  Temple  Place  -  Suite  330,   Boston,   MA
" 02111-1307, USA.
"
" Updated: 2003-12-06, 09:36am
" Source:  http://vim.sourceforge.net/scripts/script.php?script_id=242
" Author:  Steve Hall  [ digitect@mindspring.com ]
"
" Instructions:
" o Simply copy this file and paste it into your vimrc. Or you can
"   drop the entire file into your plugins directory.
" o As long as you don't already have keyboard mappings to the F5 key,
"   these keyboard shortcuts will now be available:
"   F5        Capitalize selection, title case
"   Shift+F5  Uppercase selection
"   Alt+F5    Lowercase selection
"   Ctrl+F5   Reverse case of selection
"
" Notes:
" o Restoration of selection is usually accurate, but not in some rare
"   instances where it is shifted one char.
"
" ChangeLog:
"
" 2008-01-22 -- 2.4
" o Lowercase articles for Title Case
" o Added optional additional lowercasing for Title Case
"
" 2003-12-06 -- 2.3
" o Fixed errant function name calls. ;)
"
" 2003-12-06 -- 2.2
" o Added mappings back in script for use outside of Cream.
" o Cleaned out obsolete algorithm and embedded new single line from
"   formerly called function.
" o Changed function name for title case to be consistent with
"   remainder.
"
" 2003-05-07 -- 2.1
" o Changed algorithm in Title Case to simple substitution. (Benji
"   Fisher)
"
" 2002-11-13 -- 2.0
" o Functionalized all mappings.
" o Destroyed standalone state with references to Cream libraries.
" o Made functions mode sensitive. From insertmode, each function
"   affects the current word.
"
" 2002-04-15 -- 1.3
" o Fixed positioning "anomalies" for title case. (Hopefully for good!)
"
" 2002-03-26 -- 1.2
" o Work around broken Vim paste back behavior at column 1
"
" 2002-03-25 -- 1.1
" o Modified title case function to lower case all text before
"   capitalizing initial characters.
"
" 2002-03-10
" o Initial Release
"

" mappings (if not used with Cream)
if !exists("$CREAM")

	" Title Case
	imap <silent> <F5>   <C-b>:call Cream_case_title("i")<CR>
	vmap <silent> <F5>   :<C-u>call Cream_case_title("v")<CR>
	" UPPERCASE
	imap <silent> <S-F5> <C-b>:call Cream_case_upper("i")<CR>
	vmap <silent> <S-F5> :<C-u>call Cream_case_upper("v")<CR>
	" lowercase
	imap <silent> <M-F5> <C-b>:call Cream_case_lower("i")<CR>
	vmap <silent> <M-F5> :<C-u>call Cream_case_lower("v")<CR>
	" rEVERSE CASE
	imap <silent> <C-F5> <C-b>:call Cream_case_reverse("i")<CR>
	vmap <silent> <C-F5> :<C-u>call Cream_case_reverse("v")<CR>

endif

function! Cream_case_title(mode)
" Title Case -- uppercase characters following whitespace

	if a:mode == "v"
		normal gv
		" Hack: fix Vim's gv proclivity to add a line when at line end
		if virtcol(".") == 1
			normal '>
			" line select
			normal gV
			" up one line
			normal k
			" back to char select
			normal gV
			"""" back up one char
			"""normal h
		endif
	else
		let mypos = s:Cream_pos()
		" select current word
		normal v
		normal aw
	endif
	" yank
	normal "xy

	" lower case entire string
	let @x = tolower(@x)
	" capitalize first in series of word chars
	let @x = substitute(@x, '\w\+', '\u&', 'g')
	" lowercase a few words we always want lower
	let @x = substitute(@x, '\<A\>', 'a', 'g')
	let @x = substitute(@x, '\<An\>', 'an', 'g')
	let @x = substitute(@x, '\<And\>', 'and', 'g')
	let @x = substitute(@x, '\<In\>', 'in', 'g')
	let @x = substitute(@x, '\<The\>', 'the', 'g')

	" fix first word again
	let @x = substitute(@x, '^.', '\u&', 'g')
	" fix last word again
	let str = matchstr(@x, '[[:alnum:]]\+[^[:alnum:]]*$')
	let @x = substitute(@x, str . '$', '\u&', 'g')

	"" optional lowercase...
	"let n = confirm(
	"    \ "Lowercase additional conjunctions, adpositions, articles, and forms of \"to be\"?\n" .
	"    \ "\n", "&Ok\n&Cancel", 2, "Info")
	"if n == 1
	"    " lowercase conjunctions
	"    let @x = substitute(@x, '\<After\>', 'after', 'g')
	"    let @x = substitute(@x, '\<Although\>', 'although', 'g')
	"    let @x = substitute(@x, '\<And\>', 'and', 'g')
	"    let @x = substitute(@x, '\<Because\>', 'because', 'g')
	"    let @x = substitute(@x, '\<Both\>', 'both', 'g')
	"    let @x = substitute(@x, '\<But\>', 'but', 'g')
	"    let @x = substitute(@x, '\<Either\>', 'either', 'g')
	"    let @x = substitute(@x, '\<For\>', 'for', 'g')
	"    let @x = substitute(@x, '\<If\>', 'if', 'g')
	"    let @x = substitute(@x, '\<Neither\>', 'neither', 'g')
	"    let @x = substitute(@x, '\<Nor\>', 'nor', 'g')
	"    let @x = substitute(@x, '\<Or\>', 'or', 'g')
	"    let @x = substitute(@x, '\<So\>', 'so', 'g')
	"    let @x = substitute(@x, '\<Unless\>', 'unless', 'g')
	"    let @x = substitute(@x, '\<When\>', 'when', 'g')
	"    let @x = substitute(@x, '\<While\>', 'while', 'g')
	"    let @x = substitute(@x, '\<Yet\>', 'yet', 'g')
	"    " lowercase adpositions
	"    let @x = substitute(@x, '\<As\>', 'as', 'g')
	"    let @x = substitute(@x, '\<At\>', 'at', 'g')
	"    let @x = substitute(@x, '\<By\>', 'by', 'g')
	"    let @x = substitute(@x, '\<For\>', 'for', 'g')
	"    let @x = substitute(@x, '\<From\>', 'from', 'g')
	"    let @x = substitute(@x, '\<In\>', 'in', 'g')
	"    let @x = substitute(@x, '\<Of\>', 'of', 'g')
	"    let @x = substitute(@x, '\<On\>', 'on', 'g')
	"    let @x = substitute(@x, '\<Over\>', 'over', 'g')
	"    let @x = substitute(@x, '\<To\>', 'to', 'g')
	"    let @x = substitute(@x, '\<With\>', 'with', 'g')
	"    " lowercase articles
	"    let @x = substitute(@x, '\<A\>', 'a', 'g')
	"    let @x = substitute(@x, '\<An\>', 'an', 'g')
	"    let @x = substitute(@x, '\<The\>', 'the', 'g')
	"    " lowercase forms of to be
	"    let @x = substitute(@x, '\<Be\>', 'be', 'g')
	"    let @x = substitute(@x, '\<To\> \<Be\>', 'to be', 'g')
	"    let @x = substitute(@x, '\<To\> \<Do\>', 'to do', 'g')
	"    " lowercase prepositions
	"    " lowercase conjunctions
	"endif

	" reselect
	normal gv
	" paste over selection (replacing it)
	normal "xP

	" return state
	if a:mode == "v"
		normal gv
	else
		execute mypos
	endif

endfunction

function! Cream_case_lower(mode)
" accepts "v" or "i" as mode
	if a:mode == "v"
		normal gv
	else
		let mypos = s:Cream_pos()
		" select current word
		normal v
		normal aw
	endif
	" lower case
	normal u
	" return state
	if a:mode == "v"
		normal gv
	else
		execute mypos
	endif
endfunction

function! Cream_case_upper(mode)
" accepts "v" or "i" as mode
	if a:mode == "v"
		normal gv
	else
		let mypos = s:Cream_pos()
		" select current word
		normal v
		normal aw
	endif
	" UPPER CASE
	normal U
	" return state
	if a:mode == "v"
		normal gv
	else
		execute mypos
	endif
endfunction

function! Cream_case_reverse(mode)
" accepts "v" or "i" as mode
	if a:mode == "v"
		normal gv
	else
		let mypos = s:Cream_pos()
		" select current word
		normal v
		normal aw
	endif
	" rEVERSE cASE
	normal ~
	" return state
	if a:mode == "v"
		normal gv
	else
		execute mypos
	endif
endfunction

function! s:Cream_pos(...)
" return current position in the form of an executable command
" Origins: Benji Fisher's foo.vim, available at
"          http://vim.sourceforge.net

	"let mymark = "normal " . line(".") . "G" . virtcol(".") . "|"
	"execute mymark
	"return mymark

	" current pos
	let curpos = line(".") . "G" . virtcol(".") . "|"

	" mark statement
	let mymark = "normal "

	" go to screen top
	normal H
	let mymark = mymark . line(".") . "G"
	" go to screen bottom
	normal L
	let mymark = mymark . line(".") . "G"

	" go back to curpos
	execute "normal " . curpos

	" cat top/bottom screen marks to curpos
	let mymark = mymark . curpos

	execute mymark
	return mymark

endfunction


