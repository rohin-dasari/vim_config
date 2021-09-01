set nocompatible
filetype plugin on
syntax on

let g:python3_host_prog = '/home/rohindasari/miniconda3/bin/python'

map <C-J> gT
map <C-K> gt
nmap <S-J> :bN<CR>
nmap <S-K> :bn<CR>

highlight Pmenu ctermbg=30
:tnoremap <Esc> <C-\><C-N>

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" |set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

set directory=$HOME/.vim/swapfiles

call plug#begin('/home/rohindasari/.config/nvim/plugged')

" code + text completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" markdown editing
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

" Journaling and note-taking
Plug 'vimwiki/vimwiki'

"Theme
Plug 'kyoz/purify', {'rtp': 'vim'}

call plug#end()

" Theme settings
colorscheme purify
let g:airline_theme='purify'

" Vimwiki settings
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links in read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

