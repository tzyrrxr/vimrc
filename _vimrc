" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
"************************************************************************************setting myself
""""""""""""""""""""""""""""""""setting number line
set nu
function! NumberToggle()
  if(&rnu == 1 )
	set nornu
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>
""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""close after command line message
"solution:
"""""""""""""""""
"solution 1
set shortmess=a
set cmdheight=2





"set tabstop=2
"tab space length
"let g:tex_indent_items=0   "對齊


"""""""""""""""" Setting vundle install path."
" default:
"set rtp+=$HOME/~/.vim/bundle/Vundle.vim/

" example:
set rtp+=C:/Users/userName/Documents/vim/~/.vim/bundle/Vundle.vim/


" default:
"call vundle#begin('$HOME/.vim/bundle/')

" example:
call vundle#begin('C:/Users/userName/Documents/vim/~/.vim/bundle/')
""""""""""""""""""""""""""""""""""""""""""""""



if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif 
set encoding=utf-8
"解決菜單亂碼
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解決consle輸出亂碼
"language messages zh_CN.utf-8
" 打開語法高亮
"syntax on
"gvim 配色方案
"colorscheme morning
"colorscheme desert
"colorscheme darkblue



" setting pdf viewer path
let g:tex_flavor = 'latex'
"let g:vimtex_compiler_method='pdflatexmk'
"let g:vimtex_view_general_viewer = 'C:\PROGRAM_PATH\SumatraPDF.exe'
"let g:vimtex_view_general_viewer = 'C:\PROGRAM_PATH\EvinceIcon1.exe'
"let g:vimtex_latexmk_enabled = 1  

"原文網址：https://read01.com/D5Q4kg.html
let g:tex_flavor = 'tex' "設定副檔名tex 
let g:html_flavor = 'html'
"hi Search cterm=reverse ctermbg=none ctermfg=none "反白設定
"hi MatchParen term=reverse ctermbg=52 guibg=DarkCyan"反白設定\begin \end 52-->紅色

"*******************************************powershell 亂碼解決
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"*************************************************************************************vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'lervag/vimtex'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mattn/emmet-vim' "html
Plugin 'tmhedberg/SimpylFold'
Plugin 'Lokaltog/powerline'
"Plugin 'ycm-core/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"*********************************************************************************************snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"********************************************un swp
"set noundofile
"set nobackup
"set noswapfile

"set undodir=$HOME/.vim/undo-dir
"set undofile
"********************************************each highlin
"hi Alternate guibg=gray50 guifg=NONE
"execute 'match Alternate /\%(' . join(map(range(1,100), '"\\%" . v:val * 2 . "l"'), '\|') . '\)/'
"********************font size
"set guifont=Fixedsys:h11
"set guifont=:h11

try
	set guifont=Fixedsys:h11
catch
	set guifont=KaiTi:h12
endtry
"********************read file auto
set autoread
