if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim

setl expandtab
setl tabstop=4
setl softtabstop=4
setl shiftwidth=4

let &cpo = s:save_cpo
unlet s:save_cpo
