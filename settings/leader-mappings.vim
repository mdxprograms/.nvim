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

" Buffers mappings
nnoremap <Leader><tab> :b#<CR>
nnoremap <Leader>bd :bd!<CR>
nnoremap <Leader>br :Buffers<CR>
nnoremap <Leader>fs :w<CR>

" Fugitive
nmap <Leader>gp :Gpush<space>
nmap <Leader>gl :Gpull<space>
nmap <Leader>gs :Gstatus<CR>

" Merginal
nmap <Leader>gm :MerginalToggle<CR>

" custom files
nnoremap <Leader>nw :e ~/Dropbox/work_notes<CR>
