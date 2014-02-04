let s:source = {
\   'name'      : 'neco_tempo',
\   'kind'      : 'keyword',
\   'filetypes' : { 'TempoProtocol' : 1 },
\ }

function! s:source.gather_candidates(context)
  echo neco_tempo#gather_candidates(a:context)
  return neco_tempo#gather_candidates(a:context)
endfunction

function! neocomplete#sources#neco_tempo#define()
  return s:source
endfunction
