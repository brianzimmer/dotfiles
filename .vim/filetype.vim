"au BufRead,BufNewFile *.dctl		set filetype=dctl
"au BufRead,BufNewFile *.tcl		set filetype=dctlpt
"au BufRead,BufNewFile *.pt		set filetype=pt
"au BufRead,BufNewFile *.cmd		set filetype=einstimer
"au BufRead,BufNewFile *.fmtcl		set filetype=fm
"au BufRead,BufNewFile *.fm 		set filetype=fm
"
"au BufRead,BufNewFile *.sv		set filetype=SV
"au BufRead,BufNewFile *.sv		set filetype=systemverilog

augroup filetypedetect
  au! BufRead,BufNewFile *.dctl	setfiletype dctl
  au! BufRead,BufNewFile *.tcl	setfiletype dctl
  au! BufRead,BufNewFile *.pt	setfiletype pt
"  au! BufRead,BufNewFile *.cmd	setfiletype einstimer " pmc uses .cmd for other things
  au! BufRead,BufNewFile *.fmtcl	setfiletype fm
  au! BufRead,BufNewFile *.fm	setfiletype fm
  au! BufRead,BufNewFile *.sv	setfiletype SV
"  au! BufRead,BufNewFile *.sdc	setfiletype altera_sdc
  au! BufRead,BufNewFile *.sdc	setfiletype altera
  au! BufRead,BufNewFile *.psv	setfiletype verilog
  au! BufRead,BufNewFile *.gv	setfiletype verilog
  au! BufRead,BufNewFile *.vg	setfiletype verilog
  au! BufRead,BufNewFile *.vh	setfiletype verilog
  au! BufRead,BufNewFile *.lib	setfiletype none
  au! BufRead,BufNewFile *.cir	setfiletype spice
  
augroup END
