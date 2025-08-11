set nocompatible              " be iMproved, required
filetype off                  " required

" Install vim-plug if not exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim'

call plug#end()            " required

let g:dracula_colorterm = 0
colorscheme dracula

if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  " let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  " let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

nnoremap <Tab> <C-w>w

" Tag List 환경설정
filetype on                                 "vim filetype on

" 세부 정보 출력
set nu
set title
set showmatch
set ruler

" 구문 강조 사용
if has("syntax")
 syntax on
endif

" 색깔 설정
set t_Co=256
set hlsearch
set incsearch

" 들여쓰기 설정
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=4
set backspace=2
set smarttab
set expandtab
autocmd FileType c,cpp,java,python setlocal expandtab
autocmd FileType html,php,js,css setlocal tabstop=2 softtabstop=2 shiftwidth=2

" 붙여넣기 설정
set paste
set mouse-=a

" 한글 입력 설정
set encoding=utf-8
set termencoding=utf-8

" 커서가 있는 줄을 강조함
set cursorline

" 상태바 표시를 항상한다
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" 검색 설정
set ignorecase

" 마지막으로 수정된 곳에 커서를 위치함
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END
