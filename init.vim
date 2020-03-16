" PLUGINS
" I don't have python 2 or 3 installed, so most won't work.
call plug#begin('~/.vim/plugged')

	Plug 'vim-airline/vim-airline' " Sweet Looking Status Line

	Plug 'scrooloose/nerdtree' " File Explorer

	Plug 'Valloric/YouCompleteMe'

	Plug 'vim-scripts/asmx86_64'

call plug#end()

" PLUGIN OPTIONS
" NERDTree Options
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree ~/ | endif

" NEOVIM OPTIONS
syntax enable " Syntax highlighting
set cursorline " Tells you where you are
set autoindent " Indents code for you
set smartindent
" set tabstop=2 " Sets a tab to be 2 spaces
" set shiftwidth=2
" set expandtab
" let g:python3_host_prog = 'C:\Program Files\Python37\python.exe'
" colorscheme molokai
if exists('g:Gui')
	let g:GuiWindowFullScreen=1
endif

" Custom Commands
command! RCedit :e ~/.config/nvim/init.vim " Edits init.vim from anywhere
command! JSrun :!node % "Runs current ECMASCRIPT file with Node.js
command! Wq :wq " Fixes a common typo I make
command! W :w " Fixes another commmon typo
command! Q :q " Fixes yet another command typo

" FUNCTIONS
"Copies all text in file to system clipboard, without moving the cursor from
"its original position.
function! CopyAll()
	let cursor_position = getpos(".")
	normal ggVG"*Y
	call setpos(".", cursor_position)
	unlet cursor_position
endfunction

" KEY MAPPINGS
" Press ctrl-s to save document
map <C-s> :w<CR>
" Press ctrl-a to copy all of document with CopyAll() function
map <C-a> :call CopyAll()<CR>
map <C-p> "*P
