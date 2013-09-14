set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set incsearch
set hlsearch		"高亮显示搜索的关键字"
set smartindent
set cindent
set nu
set foldcolumn=2
set textwidth=80
set colorcolumn=80
set laststatus=2
set nocompatible
set showcmd
"let mapleader=","



" **************  fix backspace key **************** "
set backspace=2               " fix backspace key
set ruler                     " show line and column position of current cusor

" **************

let g:vimball_home='~/.vim'


"au BufNewFile,BufRead *.vimprj set ft=vim
au BufNewFile,BufRead *
\ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
\   if &ft != 'cpp'                                                                           |
\     set ft=cpp                                                                              |
\   endif                                                                                     |
\ endif                                                                                       |


" key mapping {{{

imap <C-BS> <C-W>
imap <C-CR> <CR><Up>
imap <S-Del> <Esc>ddi	" delete a line in insert mode with Shift + Enter
inoremap <C-O> <C-O>:

" }}}
" ----------------- user define command ---------------- "

" change current directory to the path of current editing file
command Cd2cf lcd %:p:h


" >> ----------------- user define command ---------------- "


" neobundle {{{
  set nocompatible               " Be iMproved

  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle'))
  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  set rtp+=~/.vim/bundle/bufexplorer/
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
  "set rtp+=~/.vim/byhand/autolign/
  set rtp+=~/.vim/byhand/align/
  "set rtp+=~/llvm/llvm-3.3.src/tools/lldb/utils/vim-lldb/
  "set rtp+=~/.vim/byhand/vim-lldb/
  "set rtp+=~/clang_complete/

  NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
  NeoBundle 'git://github.com/xinsuiyuer/rainbow.git'
  NeoBundle 'git://github.com/SirVer/ultisnips.git'
  "NeoBundle 'git://github.com/Rip-Rip/clang_complete.git'
  NeoBundle 'git://github.com/majutsushi/tagbar.git'
  "NeoBundle 'https://github.com/oblitum/Cpp11-Syntax-Support'
  NeoBundle 'git://github.com/scrooloose/nerdtree.git'
  NeoBundle 'git://github.com/wesleyche/SrcExpl.git'
  NeoBundle 'git://github.com/Valloric/YouCompleteMe.git'

  "NeoBundle 'git://github.com/vim-scripts/Decho.git'
  NeoBundle 'git://github.com/Shougo/neocomplcache.git'
  NeoBundle 'git://github.com/scrooloose/syntastic.git'
  NeoBundle 'git://repo.or.cz/vcscommand'
  NeoBundle 'git://github.com/airblade/vim-gitgutter.git'
  NeoBundle 'git://github.com/Shougo/vimshell.git'
  NeoBundle 'git://github.com/Shougo/vimproc.git', {
        \     'build' : {
        \     'unix' : 'make -f make_unix.mak'
        \   }
        \ }
  "NeoBundle 'http://hg.dfrank.ru/vim/bundle/dfrank_util'
  "NeoBundle 'http://hg.dfrank.ru/vim/bundle/vimprj'
  NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
  "NeoBundle 'git://github.com/thinca/vim-quickrun.git'
  NeoBundle 'git://github.com/tpope/vim-fugitive.git'
  NeoBundle 'git://github.com/Lokaltog/powerline.git'
  NeoBundle 'https://github.com/kien/ctrlp.vim.git'
  NeoBundle 'git://github.com/jansenm/vim-cmake.git'
  NeoBundle 'git://github.com/Shougo/unite.vim.git'
  NeoBundle 'git://github.com/pangloss/vim-javascript.git'
  NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
  NeoBundle 'https://github.com/guileen/vim-node.git'
  NeoBundle 'git://github.com/vim-scripts/Super-Shell-Indent.git'
  "NeoBundle 'git://github.com/vim-scripts/doxygen-support.vim.git'
  NeoBundle 'git://github.com/vim-scripts/a.vim.git'
  NeoBundle 'git://github.com/jansenm/vim-cmake.git'
  NeoBundle 'git://github.com/Raimondi/delimitMate.git'

  NeoBundle 'https://github.com/chris-ritsen/vim-html-indent.git'
  NeoBundle 'https://github.com/mattn/zencoding-vim.git'
  NeoBundle 'https://github.com/wookiehangover/jshint.vim.git'
  NeoBundle 'https://github.com/sukima/xmledit.git'
  NeoBundle 'https://github.com/vim-scripts/doxygen-support.vim.git'
  NeoBundle 'https://github.com/plasticboy/vim-markdown.git'

  " Installation check.
  NeoBundleCheck

" }}}
"
filetype plugin indent on     " required!
"set rtp+=~/.vim/vim-lldb/


" Powerline {{{

let Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'fancy'

" }}}


" doxgen {{{
let g:DoxygenToolkit_paramTag_post = " "
let g:load_doxygen_syntax = 1
"let g:syntax_extra_c = 'doxygen'
"let g:syntax_extra_cpp = 'doxygen'

"let g:Doxy_LocalTemplateFile = "~/.vim/bundle/doxygen-support.vim/doxygen-support/templates/doxygen.templates"

" }}}

set concealcursor=inv
set conceallevel=2

" YouCompleteMe {{{

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
let g:ycm_key_invoke_completion = '<C-J>'
let g:ycm_filetype_specific_completion_to_diable = { 'cpp' : 1 }
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'c' : 1 }
let g:ycm_filetype_blacklist = { 
            \'vim' : 1, 
            \'vimshell' : 1, 
            \'snippets' : 1,
            \'cmake' : 1,
            \'html' : 1
            \}

" }}}

" syntastic {{{
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting = 1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'


" }}}


set completeopt=menuone,longest
set pumheight=15


" Solarized Colorscheme Config {{{
let g:solarized_termtrans=1    "default value is 0
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" }}}


" gitgutter {{{
"let g:gitgutter_highlight_lines = 1
" }}}


" tagbar {{{
let g:tagbar_left = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_show_visibility = 1
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
" }}}

" NERDTree {{{
let g:NERDTreeWinPos = 'right'
" }}}

" source explorer {{{
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 300
" // Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
" let g:SrcExpl_gobackKey = "<SPACE>"

let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"let g:SrcExpl_updateTagsKey = "<F12>"

" }}}

" Configure like an IDE {{{

" " Open and close the srcexpl.vim separately
autocmd FileType c,cpp,cmake nmap <Leader>src :SrcExplToggle<CR>

" " Open and close the taglist.vim separately
autocmd FileType c,cpp,cmake nmap <Leader>tag :TagbarToggle<CR>

" " Open and close the NERD_tree.vim separately
"autocmd FileType c,cpp,cmake nmap <Leader>nt  :NERDTreeToggle<CR>
nmap <Leader>nt  :NERDTreeToggle<CR>

" }}}

" rainbow {{{
let g:rainbow_operators = 2
au FileType c,cpp,objc,objcpp call rainbow#activate()
au FileType c,cpp,objc,objcpp RainbowLoad
" }}}

" ultisnipptes {{{
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}



" VCSCommand {{{
let g:VCSCommandMenuRoot = 'VCS'
augroup VCSCommand
  au User VCSBufferCreated silent! nmap <unique> <silent> <buffer> q :bwipeout<cr>
augroup END


" }}}

" neocomplcache {{{


let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_cursor_hold_i = 0
let g:neocomplcache_enable_fuzzy_completion = 1
"let g:neocomplcache_fuzzy_completion_start_length = 2

autocmd filetype vim,vimshell,sh,snippets,cmake,html :NeoComplCacheEnable
autocmd filetype javascript set dictionary+=~/.vim/bundle/vim-node/dict/node.dict | :NeoComplCacheEnable
autocmd filetype make :NeoComplCacheEnable | set noexpandtab | set tabstop& | set shiftwidth& | set softtabstop&

" }}}

" vimshell {{{
let g:vimshell_user_promt = 'getcwd()'


" }}}


" delimitMate {{{

let delimitMate_expand_cr      = 1
let delimitMate_jump_expansion = 1
"autocmd filetype html let b:loaded_delimitMate=0

" }}}

" vim:foldmethod=marker
