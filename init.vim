if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

set backupcopy=yes
set expandtab
set formatoptions-=cro
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
set clipboard=unnamedplus

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
\ 'coc-go',
\ 'coc-html',
\ 'coc-json',
\ 'coc-lua',
\ 'coc-marketplace',
\ 'coc-prettier',
\ 'coc-project',
\ 'coc-python',
\ 'coc-rls',
\ 'coc-rust-analyzer',
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
Plug 'alaviss/nim.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'francoiscabrol/ranger.vim'
Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascript.jsx','typescript'],
      \ 'do': 'make install'
      \}
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'leafo/moonscript-vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'stephenway/postcss.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'voldikss/vim-floaterm'

call plug#end()
""" END PLUGINS

set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=cyan
colorscheme gruvbox
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

" match escape for terminal as well
tnoremap <silent> jf <C-\><C-n>

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
nmap <leader>gp :Gpush<space>
nmap <leader>gl :Gpull<space>
nmap <leader>gs :Gstatus<CR>

" nerd commenter
let g:NERDSpaceDelims = 1

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
nnoremap <silent> <Leader>pt :NERDTreeToggle<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  au BufWritePre * :call TrimWhitespace()

  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
  augroup END

  au BufNewFile,BufRead *.gohtml set syntax=gohtmltmpl
endif

" indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" ranger
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
nnoremap <silent> <leader>r :FloatermNew --height=0.9 width=0.9 ranger --cmd "set show_hidden=true"<CR>

" Floatterm
let g:floaterm_autoinsert = 0
let g:floaterm_position = 'top'
hi FloatermBorder guibg=#44475a guifg=#ff79cc6
hi FloatermNC guibg=#282a36
nnoremap <leader>at :FloatermNew<CR>
nnoremap <leader>tt :FloatermToggle<CR>
nnoremap <leader>tl :FloatermNext<CR>
nnoremap <leader>th :FloatermPrev<CR>
nnoremap <leader>vaq :FloatermNew vaq<CR>

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" custom files
nnoremap <Leader>nw :e ~/Dropbox/work_notes<CR>
