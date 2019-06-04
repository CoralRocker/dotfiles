" NEOVIM_PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

"Plug 'arakashic/chromatica.nvim'
"let g:chromatica#enable_at_startup = 1
"let g:chromatia#responsive_mode = 1

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
let g:deoplete#enable_at_startup = 1
"call deoplete#enable()


"Plug 'Valloric/YouCompleteMe'
"let g:ycm_show_diagnostics_ui = 0



Plug 'vim-airline/vim-airline'

call plug#end()

filetype plugin indent on
syntax enable	

set number

"set cursorline
set autoindent
set smartindent


