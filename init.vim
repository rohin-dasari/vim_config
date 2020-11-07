
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-syntastic/syntastic'
call plug#end()

set tabstop=4
set shiftwidth=4
set autoindent
set paste
map <C-J> gT
map <C-K> gt
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-B> <C-V>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
hi clear SignColumn
let g:syntastic_error_symbol = "✘"
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex les b:syntastic_mode = "passive"
augroup END
:tnoremap <Esc> <C-\><C-N>
let g:nerdtree_tabs_open_on_console_startup = 1
let g:python3_host_prog = '~/../../ProgramData/Miniconda3/python.exe'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
