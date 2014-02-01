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

if !exists('g:neocomplete#sources#dictionary#dictionaries')
  let g:neocomplete#sources#dictionary#dictionaries = {}
endif
let g:neocomplete#sources#dictionary#dictionaries.TempoProtocol = globpath(&runtimepath, 'dict/TempoProtocol/functions.dict', 1)

if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let g:neocomplcache_dictionary_filetype_lists.TempoProtocol = globpath(&runtimepath, 'dict/TempoProtocol/functions.dict', 1)

let &cpo = s:save_cpo
unlet s:save_cpo
