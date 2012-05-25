syn clear

syn match hspiceComment	"^\*.*$"

syn match hspiceDotword	"^\.\w\+\s*"

syn match hspiceParam	"[A-Za-z][A-Za-z0-9_]*[ \t]*="me=e-1

syn match hspiceInst "^[^\.\*][^ ]*"

syn region  hspiceDString      oneline start=+"+  skip=+\\"+  end=+"+
syn region  hspiceSString      oneline start=+'+  skip=+\\'+  end=+'+

if !exists("did_hspicefile_syntax_inits")
  let did_hspicefile_syntax_inits = 1
  hi link hspiceDotword	Function
  hi link hspiceParam	Identifier
  hi link hspiceComment	Comment
  hi link hspiceDString	String
  hi link hspiceSString	String
  hi link hspiceInst Structure
endif

let b:current_syntax = "spice"
