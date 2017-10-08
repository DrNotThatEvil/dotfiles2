"
"  __    __  ____  _      __ __     ____  ____       ____  ____   ____  ______   __ __  ____  ___ ___ 
" |  |__|  ||    || |    |  |  |   |    ||    \     |    ||    \ |    ||      | |  |  ||    ||   |   |
" |  |  |  | |  | | |    |  |  |    |  | |  _  |     |  | |  _  | |  | |      | |  |  | |  | | _   _ |
" |  |  |  | |  | | |___ |  |  |    |  | |  |  |     |  | |  |  | |  | |_|  |_| |  |  | |  | |  \_/  |
" |  `  '  | |  | |     ||  :  |__  |  | |  |  |     |  | |  |  | |  |   |  | __|  :  | |  | |   |   |
"  \      /  |  | |     | \   /|  | |  | |  |  |     |  | |  |  | |  |   |  ||  |\   /  |  | |   |   |
"   \_/\_/  |____||_____|  \_/ |__||____||__|__|    |____||__|__||____|  |__||__| \_/  |____||___|___|
"   
"   Version 2.0  04/10/2017

set nocompatible

" Setting up Dein
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
    let bundleExists = 0
endif

" Adding dein to runtime path
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
set runtimepath+=~/.fzf

" Begin dein
call dein#begin(expand('~/.config/nvim'))

" Begin plugin list

" colorscheme
call dein#add('beigebrucewayne/Turtles')

" Denite (unite all interfaces)
call dein#add('Shougo/denite.nvim')

" fzf.vim 
call dein#add('junegunn/fzf.vim')

" Nerdtree directory explorer
call dein#add('scrooloose/nerdtree')

" Deoplete - Autocomplete
call dein#add('Shougo/deoplete.nvim')

" Deoplete - CLang
call dein#add('tweekmonster/deoplete-clang2')

" Supertab
call dein#add('ervandew/supertab')

" End plugin list

" Check Dein install and install if necesarry
if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

" End Dein
call dein#end()

" Begin nvim settings.
colorscheme turtles

" Plugin settings

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" NERDTree settings.
map - :NERDTreeToggle<CR>

map + :FZF<CR>
