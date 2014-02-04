let s:source = {
      \ 'name': 'tempo',
      \ 'kind': 'keyword',
      \ 'filetypes': { 'TempoProtocol': 1 },
      \ }

function! s:source.initialize()
  call neco_tempo#cache_candidates()
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  return neco_tempo#gather_candidates()
endfunction

function! neocomplcache#sources#tempo#define()
  return s:source
endfunction
