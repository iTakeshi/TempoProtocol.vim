function! neco_tempo#cache_candidates()
  let l:function_dict = globpath(&runtimepath, 'dict/TempoProtocol/functions.dict', 1)
  let s:candidates = []
  for line_str in readfile(l:function_dict)
    let list = split(line_str, "\t", 1)
    if len(list) == 3
      let [func_name, arg_info, func_desc] = list
      let s:candidate = { 'word': func_name, 'kind': '[TEMPO]', 'menu': func_desc }
    elseif len(list) >= 1
      let func_name = list[0]
      let s:candidate = { 'word': func_name }
    else
      continue
    endif
    call add(s:candidates, s:candidate)
  endfor
endfunction

function! neco_tempo#gather_candidates(context)
  return s:candidates
endfunction
