set tabstop=4
set shiftwidth=4
set autoindent
set paste
map <C-J> gT
map <C-K> gt
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-B> <C-V>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
let g:python3_host_prog = '~/anaconda3/python.exe'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
call plug#end()
