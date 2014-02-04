# TempoProtocol.vim
Vim syntax and indent plugin for TEMPO protocol(.pro) file.

### Installation
```VimL
" Highly recommended
if has('lua') && ( (v:version == 703 && has('patch885')) || v:version == 704 )
  NeoBundle 'Shougo/neocomplete.vim'
else
  NeoBundle 'Shougo/neocomplcache.vim'
endif

NeoBundleLazy 'iTakeshi/TempoProtocol.vim', { 'autoload': {
    \ 'filetypes': ['TempoProtocol'] }}
```

### Version
1.1

#### update log
* v.1.1 Add NeoComplete/NeoComplcache source

### License
[MIT License](http://opensource.org/licenses/MIT)
