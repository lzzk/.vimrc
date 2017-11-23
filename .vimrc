"
" 修改leader键
let mapleader = ','
let g:mapleader = ','
"语法高亮
syntax enable
syntax on

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 历史记录数
set history=1000
"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示"
set autoread          " 文件修改之后自动载入。
"set go= " 不要图形按钮
"color asmanian2 " 设置背景主题
"set guifont=Consolas:h12 " 设置字体
"set t_Co=256                 "设置256色显示
autocmd InsertLeave * se nocul " 用浅色高亮当前行
autocmd InsertEnter * se cul " 用浅色高亮当前行
set ruler " 显示标尺
set showcmd " 输入的命令显示出来，看的清楚些
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
"状态行显示的内容
set statusline=[%n]%<%f%y%h%m%r%=\ [%l,\ %c]\ of\ %L,%V\ Page\ %N\ %P
set foldmethod=manual " 手动折叠
set nocompatible "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif
"处理未保存的或只读文件时，弹出确认
set confirm
"共享外部剪贴板
set clipboard+=unnamed
"- 则点击光标不会换,用于复制
set mouse-=a             " 鼠标暂不启用, 键盘党....
" set mouse=a                 " Automatically enable mouse usage
" set mousehide               " Hide the mouse cursor while typing
" color scheme颜色主题
""if has("gui_running")
""  colorscheme mydesert
""endif " has "
" 自动缩进
set autoindent
set cindent
set smartindent
"退格键"
set backspace=indent,eol,start

" Tab键的宽度
set tabstop=2
" 统一缩进为4
set softtabstop=2
set shiftwidth=2
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
"自动换行
set wrap

"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
let $LANG='zh_CN.UTF-8'
" 总是显示状态行
set cmdheight=2
" 保存全局变量
set viminfo+=!
"不生成swap文件
setlocal noswapfile
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
"设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set ignorecase
set smartcase
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]
"allow to paste
"set paste

" 插入模式下使用 ctrl + h/j/k/l 移动光标
imap <c-k> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>

source ~/.vimrc.bundles

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

" file header
autocmd BufNewFile *.py,*.h,*.hpp,*.cc,*.c,*.cxx,*.cpp,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#!/bin/bash")
    call append(line("."), "# Author:xxx")
    call append(line(".")+1, "# Version:0.1")
    "call append(line(".")+2, "# Site:www.t4x.org")
    call append(line(".")+2, "# Contact:xxx@gmail.com")
    call append(line(".")+3, "")
  elseif &filetype == 'cpp' || 'c'
    call setline(1,"// File Name: ".expand("%"))
    call append(line("."), "// Author: xxx")
    call append(line(".")+1, "// Contact:xxx@gmail.com")
    call append(line(".")+2, "// Created Time: ".strftime("%c"))
    call append(line(".")+3, "")
    "call append(line(".")+3, "#include<iostream>")
    "call append(line(".")+4, "#include<string>")
    "call append(line(".")+5, "#include<algorithm>")
    "call append(line(".")+6, "#include<cstdlib>")
    "call append(line(".")+7, "using namespace std;")
    "call append(line(".")+8, "int main(){")
    "call append(line(".")+9, "")
    "call append(line(".")+10, "    return 0")
    "call append(line(".")+11,"}")
  elseif &filetype == 'python'
    call setline(1,"\#!/usr/bin/env python")
    call append(line("."), "# -*- coding:utf-8 -*-")
    call append(line(".")+1, "")
    call append(line(".")+2, "# Author: xxx")
    call append(line(".")+3, "# Created Time: ".strftime("%c"))
    call append(line(".")+4, "# Contact:xxx@gmail.com")
    call append(line(".")+5, "")
  else
    call setline(1,"/*")
    call append(line("."), "* Author: xxx")
    call append(line(".")+1, "* Created Time: ".strftime("%c"))
    call append(line(".")+2, "*/")
    call append(line(".")+3, "")
  endif
endfunc
"新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
    "ts是tabstop的缩写，设TAB宽4个空格
set ts=4
set expandtab

"##################TMUX################
if exists('$TMUX')
set term=screen-256color
endif


if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end
