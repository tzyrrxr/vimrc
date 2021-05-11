# Setting pdf viewer path

## setting pdf viewer path
let g:tex_flavor = 'latex'  
"let g:vimtex_compiler_method='pdflatexmk'  

## example:
"let g:vimtex_view_general_viewer = 'C:\PROGRAM_PATH\SumatraPDF.exe'  
"let g:vimtex_view_general_viewer = 'C:\PROGRAM_PATH\EvinceIcon1.exe'  
"let g:vimtex_latexmk_enabled = 1   



## setting neoclide/coc.nvim
Install node from  
[Nodejs download](https://nodejs.org/en/download/)  
let g:coc_node_path = 'WHERE\nodejs\node.exe'  



# Setting vundle install path.



## default:
"set rtp+=$HOME/~/.vim/bundle/Vundle.vim/  

## example:
set rtp+=C:/Users/userName/Documents/vim/~/.vim/bundle/Vundle.vim/  


## default:
"call vundle#begin('$HOME/.vim/bundle/')  

## example:
call vundle#begin('C:/Users/userName/Documents/vim/~/.vim/bundle/')  



# Notice font size

Font name can not contain space and replace space to underline.
