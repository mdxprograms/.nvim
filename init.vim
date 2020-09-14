if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

" Initialize minpac on demand
function! PackInit() abort
  source ~/.config/nvim/settings/plugs.vim
endfunction

" minpac commands
command! PackUpdate source ~/.config/nvim/init.vim | call PackInit() | call minpac#update()
command! PackClean  source ~/.config/nvim/init.vim | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" base settings
source ~/.config/nvim/settings/base.vim

" settings
source ~/.config/nvim/settings/coc.vim
source ~/.config/nvim/settings/colors.vim
source ~/.config/nvim/settings/fzf.vim
source ~/.config/nvim/settings/leader-mappings.vim
source ~/.config/nvim/settings/indentguide.vim

