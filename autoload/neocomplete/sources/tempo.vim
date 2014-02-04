let s:source = {
\   'name'      : 'tempo',
\   'kind'      : 'keyword',
\   'filetypes' : { 'TempoProtocol' : 1 },
\   'hooks'     : {}
\ }

function! s:source.hooks.on_init(context)
  call neco_tempo#cache_candidates()
endfunction

function! s:source.gather_candidates(context)
  echo neco_tempo#gather_candidates(a:context)
  return neco_tempo#gather_candidates(a:context)
endfunction

function! neocomplete#sources#tempo#define()
  return s:source
endfunction
