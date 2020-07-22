if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

set backupcopy=yes
set expandtab
set guicursor=
set hidden
set incsearch
set mouse=
set nobackup
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
set splitbelow
set splitright
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

" CocExtensions
let g:coc_global_extensions = [
\ 'coc-conjure-olical',
\ 'coc-css',
\ 'coc-emmet',
\ 'coc-eslint',
\ 'coc-highlight',
\ 'coc-html',
\ 'coc-json',
\ 'coc-marketplace',
\ 'coc-prettier',
\ 'coc-project',
\ 'coc-python',
\ 'coc-snippets',
\ 'coc-tailwindcss',
\ 'coc-tsserver',
\ 'coc-ultisnips',
\ 'coc-yaml'
\ ]

""" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'Olical/conjure'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ncm2/float-preview.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'

call plug#end()
""" END PLUGINS

set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=cyan
colorscheme dracula
set background=dark

" Rainbow parens
let g:rainbow_active = 1

" Enable ripgrep if available
if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

" Base mappings
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
inoremap jf <esc>

" Buffers mappings
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bd :bd!<CR>
nnoremap <Leader>br :Buffers<CR>
nnoremap <Leader>fs :w<CR>

" Line mappings
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <silent><expr> <C-space> coc#refresh()

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

" nerd commenter
let g:NERDSpaceDelims = 1

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

" markdown preview
let g:mkdp_auto_start = 1

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" term
""" escape
tnoremap <esc> <c-\><c-n>

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

