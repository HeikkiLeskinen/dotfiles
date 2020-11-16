set nocompatible
filetype off

set encoding=utf-8
set nu
set tabstop=4
set expandtab

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'dyng/ctrlsf.vim'

call vundle#end()

" set up the file expolorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

set noswapfile
filetype plugin indent on
syntax enable
highlight BadWhitespace ctermbg=red guibg=red

set foldmethod=indent
set foldlevel=99

" set up filetypes
nnoremap <space> za

au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

syntax on

call togglebg#map("<F5>") " toggle solarized dark to light theme

""" airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

""" Set up moving between the splits
map <C-n> :NERDTreeToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" CtrlP
let g:ctrlp_working_path_mode='a'
set wildignore+=**/bower_components/*,**/node_modules/*,**/tmp/*,**/assets/images/*,**/assets/fonts/*,**/public/images/*

""" Set up relative numbering
set rnu

function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction

function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction

autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

""" System clipboard copy & paste support
set clipboard=unnamed

set pastetoggle=<F2> "F2 before pasting to preserve indentation
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"



