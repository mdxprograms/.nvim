if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

set expandtab
set guicursor=
set hidden
set incsearch
set nobackup
set backupcopy=yes
set noerrorbells
set nohlsearch
set noshowmatch
set noshowmode
set noswapfile
set nowrap
set nu
set relativenumber
set scrolloff=8
set shiftwidth=2
set smartcase
set smartindent
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.config/nvim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

""" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mattn/emmet-vim'
Plug 'Olical/conjure'
Plug 'ncm2/float-preview.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

call plug#end()
""" END PLUGINS

set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=cyan
colorscheme dracula
set background=dark

" Rainbow parens
let g:rainbow_active = 1

if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pp :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pl :CocList project<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Leader> :e ~/.config/nvim/init.vim<CR>

" Buffers
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bd :bd!<CR>
nnoremap <Leader>br :Buffers<CR>
nnoremap <Leader>fs :w<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Coc commands
command! -nargs=0 FmtJS :CocCommand eslint.executeAutofix
autocmd BufWritePre *.js :FmtJS

inoremap <silent><expr> <C-space> coc#refresh()

vnoremap X "_d
inoremap jf <esc>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>


" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gp :Gpush<space>
nmap <leader>gl :Gpull<space>
nmap <leader>gs :Gstatus<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
