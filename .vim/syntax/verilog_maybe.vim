syntax clear

syntax keyword verilogKeyword   disable assign deassign force release
syntax keyword verilogKeyword   function endfunction
syntax keyword verilogKeyword   always initial endmodule
syntax keyword verilogKeyword   task endtask
syntax keyword verilogKeyword   posedge negedge wait
syntax keyword verilogKeyword   buf pullup pull0 pull1 pulldown
syntax keyword verilogKeyword   tri0 tri1 tri trireg
syntax keyword verilogKeyword   wand wor triand trior
syntax keyword verilogKeyword   defparam
syntax keyword verilogKeyword   begin end
syntax keyword verilogKeyword   if else case casex casez default endcase
syntax keyword verilogKeyword   forever repeat while for

syntax keyword verilogStorageClass   input output inout reg wire
syntax keyword verilogStorageClass   integer real parameter

syntax region  verilogString       oneline start=+"+  skip=+\\\\\|\\"+  end=+"+

syntax region  verilogComment      start="/\*"  end="\*/"
syntax match   verilogComment      "//.*"

syntax keyword verilogKeyword   contained module
syntax match   verilogModName   contained "[a-zA-Z-_][a-zA-Z_0-9]*"
syntax match   verilogModLine   transparent "^[ \t]*module[ \t]\+[a-zA-Z-_][a-zA-Z_0-9]*\>" contains=verilogKeyword,verilogModName

syntax match   verilogIncluded     contained +"[^"]*"+
syntax match   verilogIncluded     contained "<[^>]*>"
syntax match   verilogInclude      "^`include\>[ \t]*["<]" contains=verilogIncluded

syntax match   verilogCPP          contained "^`define\>"
syntax match   verilogDefined      contained "[a-zA-Z0-9_]\+"
syntax match   verilogDefine       "^`define\>[ \t]\+[a-zA-Z0-9_]\+" contains=verilogCPP,verilogDefined

if !exists("did_verilog_syntax_inits")
  let did_verilog_syntax_inits = 1

  highlight link verilogString          String
  highlight link verilogComment         Comment
  highlight link verilogKeyword         Keyword
  highlight link verilogModName         Function
  highlight link verilogInclude         Include
  highlight link verilogStorageClass    StorageClass
  highlight link verilogDefine          Define
  highlight link verilogCPP             Define
  highlight link verilogDefined         Defined
endif

let b:current_syntax = "verilog"
