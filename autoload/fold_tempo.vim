function! fold_tempo#FoldExpression(lnum)
  let line = getline(a:lnum)
  if line =~ "^process"
    return 1
  elseif line =~ "^}"
    return '<1'
  else
    return '='
  endif
endfunction
