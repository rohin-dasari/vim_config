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

augroup markdownformatter
    autocmd!
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave *.md,*.wiki,*.tex
        \ set textwidth=80 |
        \ set wrapmargin=2
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

"markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

"git plugin
Plug 'tpope/vim-fugitive'

call plug#end()

" Theme settings
colorscheme purify
let g:airline_theme='purify'

" Vimwiki settings
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links in read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

let g:vimwiki_list = [{'path': '~/vimwiki/', 
            \ 'links_space_char': '_',
            \ 'syntax': 'markdown', 'ext': '.md'}]

function! g:Open_browser(url)
    
    exec "!brave --new-tab " . a:url
    "echo a.url
    "silent exe 'silent !brave ' . a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
" auto complete paranthesis, quotes, etc.
inoremap ( ()<left>
inoremap < <><left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

