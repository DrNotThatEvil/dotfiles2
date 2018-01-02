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

call dein#add('w0rp/ale')
call dein#add('sbdchd/neoformat')

" End plugin list

" Check Dein install and install if necesarry
if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

" End Dein
call dein#end()

" Begin nvim settings.

" COLOR SCHEME 

"=== SET COLOUR VARIABLES =====================================================

colorscheme turtles

"=== OPTIONS ==================================================================

" disable highlighted CursorLineNr
if exists('g:office_dark_CursorLineNr')
if g:office_dark_CursorLineNr == 'off'
cal <sid>h('CursorLineNr'     , s:g4 , s:g1 , s:t4 , s:t1 , 'none'      , ''  )
endif
endif

" disable LineNr background altogether
if exists('g:office_dark_LineNr')
if g:office_dark_LineNr == 'off'
cal <sid>h('CursorLineNr'     , s:g4 , s:g0 , s:t4 , s:t0 , 'none'      , ''  )
cal <sid>h('LineNr'           , s:g4 , s:g0 , s:t4 , s:t0 , 'none'      , ''  )
endif
endif

" END OF COLORSCHEME

"=== OPTIONS ==================================================================

" disable highlighted CursorLineNr
if exists('g:office_dark_CursorLineNr')
if g:office_dark_CursorLineNr == 'off'
cal <sid>h('CursorLineNr'     , s:g4 , s:g1 , s:t4 , s:t1 , 'none'      , ''  )
endif
endif

" disable LineNr background altogether
if exists('g:office_dark_LineNr')
if g:office_dark_LineNr == 'off'
cal <sid>h('CursorLineNr'     , s:g4 , s:g0 , s:t4 , s:t0 , 'none'      , ''  )
cal <sid>h('LineNr'           , s:g4 , s:g0 , s:t4 , s:t0 , 'none'      , ''  )
endif
endif


" END OF COLORSCHEM

set noshowmode
set noswapfile
filetype on
filetype plugin on
filetype indent on
set number
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set shiftwidth=4
set expandtab
set wildmenu
set expandtab 
set laststatus=2

" Plugin settings

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" NERDTree settings.
map - :NERDTreeToggle<CR>

map + :FZF<CR>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
