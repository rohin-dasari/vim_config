set nocompatible
filetype plugin on
syntax on

let g:python3_host_prog = '/usr/bin/python3'

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

call plug#begin('/home/rdasari5/.config/nvim/plugged')

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
    autocmd BufRead,BufNewFile,InsertEnter ~/vimwiki/diary.md VimwikiDiaryGenerateLinks
augroup end

" vimwiki config
let g:vimwiki_list = [{'path': '~/vimwiki',
            \ 'syntax': 'markdown', 'ext': '.md'}]

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
