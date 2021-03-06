" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" PreProc
syn match   TempoProtocolPreProc /#\%(include\|pragma\)/

" Declaration
syn keyword TempoProtocolDeclarationDeclare  declare  skipwhite nextgroup=TempoProtocolDeclarationHex,TempoProtocolDeclarationHide,TempoProtocolDeclarationConstant,TempoProtocolDeclarationInt,TempoProtocolDeclarationFloat
syn keyword TempoProtocolDeclarationHex      hex      skipwhite nextgroup=TempoProtocolDeclarationHide,TempoProtocolDeclarationConstant,TempoProtocolDeclarationInt,TempoProtocolDeclarationFloat
syn keyword TempoProtocolDeclarationHide     hide     skipwhite nextgroup=TempoProtocolDeclarationConstant,TempoProtocolDeclarationInt,TempoProtocolDeclarationFloat
syn keyword TempoProtocolDeclarationConstant constant skipwhite nextgroup=TempoProtocolDeclarationInt,TempoProtocolDeclarationFloat
syn keyword TempoProtocolDeclarationInt      int
syn keyword TempoProtocolDeclarationFloat    float

" Process
syn keyword TempoProtocolProcessProcess process                    skipwhite nextgroup=TempoProtocolProcessName fold
syn match   TempoProtocolProcessName    /[0-9A-Za-z_]\+/ contained skipwhite nextgroup=TempoProtocolProcessEnabled,TempoProtocolProcessHide
syn keyword TempoProtocolProcessEnabled enabled          contained skipwhite nextgroup=TempoProtocolProcessHide
syn keyword TempoProtocolProcessHide    hide             contained
syn keyword TempoProtocolProcessControl resume
syn keyword TempoProtocolProcessControl suspend
syn keyword TempoProtocolProcessControl spawn
syn keyword TempoProtocolProcessControl spawnwait

" Flow Control
syn keyword TempoProtocolFlowControl if else
syn keyword TempoProtocolFlowControl while

" Wait
syn keyword TempoProtocolWait waitforprocess
syn keyword TempoProtocolWait nexttick
syn keyword TempoProtocolWait wait
syn keyword TempoProtocolWait wson
syn keyword TempoProtocolWait wsof
syn keyword TempoProtocolWait wcon
syn keyword TempoProtocolWait wcof

" Numbers
syn match   TempoProtocolNumber /\<[-+]\?\%(0\|[1-9][0-9]*\|0[xX][0-9A-Fa-f]\+\|0[0-7]\+\)N\?\>/
syn match   TempoProtocolNumber /\<[-+]\?[0-9]\+\%(\.[0-9]*\)\?\%([eE][-+]\?[0-9]\+\)\?M\?\>/

" String
syn region  TempoProtocolString start=/"/ end=/"/ oneline contains=TempoProtocolStringSequence
syn match   TempoProtocolStringSequence /\\[abtnvfr\\]/ contained
syn match   TempoProtocolStringSequence /\\\%([1-9][0-9]\?\|1[0-9]\{2}\|2[0-4][0-9]\|25[0-5]\|0[xX][0-9A-Fa-f]\{1,2}\|0\(1\)\?[0-7]\{2}\)N\?/ contained

" Character Contant
syn match   TempoProtocolCharacter /'.'/ contains=TempoProtocolCharacterSequence
syn match   TempoProtocolCharacterSequence /\\\%([1-9][0-9]\?\|1[0-9]\{2}\|2[0-4][0-9]\|25[0-5]\|0[xX][0-9A-Fa-f]\{1,2}\|0\(1\)\?[0-7]\{2}\)N\?/ contained

" Operators
syn match   TempoProtocolOperator /\%([\+\-\*\/%|&~\<\>=]\|!=\)/

" Boolean
syn keyword TempoProtocolBoolean true false

" Semicolon
syn match   TempoProtocolSemicolon /;/

" Comment
syn region  TempoProtocolComment start=/\/\*/ end=/\*\// contains=TempoProtocolTodo
syn match   TempoProtocolComment /\/\/.*$/ contains=TempoProtocolToDo

" ToDo
syn keyword TempoProtocolTodo TODO NOTE FIXME XXX contained

" Functions
let s:function_dict = globpath(&runtimepath, 'dict/TempoProtocol/functions.dict', 1)
for line in readfile(s:function_dict)
  let list = split(line, '\t', 1)
  if len(list) >= 1
    let function_name = list[0]
  else
    continue
  endif
  let com = printf('syn keyword TempoProtocolFunction %s', function_name)
  execute com
endfor

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tempo_protocol_syntax_inits")
  if version < 508
    let did_tempo_protocol_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink TempoProtocolDeclarationDeclare  TempoProtocolDeclaration
  HiLink TempoProtocolDeclarationHex      TempoProtocolDeclaration
  HiLink TempoProtocolDeclarationHide     TempoProtocolDeclaration
  HiLink TempoProtocolDeclarationConstant TempoProtocolDeclaration
  HiLink TempoProtocolDeclarationInt      TempoProtocolDeclaration
  HiLink TempoProtocolDeclarationFloat    TempoProtocolDeclaration

  HiLink TempoProtocolProcessProcess TempoProtocolProcess
  HiLink TempoProtocolProcessEnabled TempoProtocolProcess
  HiLink TempoProtocolProcessHide    TempoProtocolProcess
  HiLink TempoProtocolProcessControl TempoProtocolProcess

  HiLink TempoProtocolPreProc           PreProc
  HiLink TempoProtocolDeclaration       Statement
  HiLink TempoProtocolProcess           Constant
  HiLink TempoProtocolProcessName       Type
  HiLink TempoProtocolFlowControl       Statement
  HiLink TempoProtocolWait              Statement
  HiLink TempoProtocolNumber            Number
  HiLink TempoProtocolString            String
  HiLink TempoProtocolCharacter         String
  HiLink TempoProtocolStringSequence    SpecialChar
  HiLink TempoProtocolCharacterSequence SpecialChar
  HiLink TempoProtocolOperator          Operator
  HiLink TempoProtocolBoolean           Boolean
  HiLink TempoProtocolSemicolon         SpecialChar
  HiLink TempoProtocolComment           Comment
  HiLink TempoProtocolTODO              TODO
  HiLink TempoProtocolFunction          Function

  delcommand HiLink
endif

let b:current_syntax = "TempoProtocol"

let &cpo = s:save_cpo
unlet s:save_cpo
