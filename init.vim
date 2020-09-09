if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

source ~/.config/nvim/settings/base.vim
source ~/.config/nvim/settings/plugs.vim
source ~/.config/nvim/settings/coc.vim
source ~/.config/nvim/settings/colors.vim

" Rainbow parens
let g:rainbow_active = 1

" Enable ripgrep if available
if executable('rg')
  let g:rg_derive_root='true'
endif

" Base mappings
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pp :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
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

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Fugitive
nmap <leader>gp :Gpush<space>
nmap <leader>gl :Gpull<space>
nmap <leader>gs :Gstatus<CR>

" nerd commenter
let g:NERDSpaceDelims = 1

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

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }

" custom files
nnoremap <Leader>nw :e ~/Dropbox/work_notes<CR>
