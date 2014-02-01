if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let s:save_cpo = &cpo
set cpo&vim

setlocal indentexpr=
setlocal cindent

let b:undo_indent = "setl cin<"

let &cpo = s:save_cpo
unlet s:save_cpo
