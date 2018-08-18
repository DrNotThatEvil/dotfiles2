"content
"  __    __  ____  _      __ __     ____  ____       ____  ____   ____  ______   __ __  ____  ___ ___ 
" |  |__|  ||    || |    |  |  |   |    ||    \     |    ||    \ |    ||      | |  |  ||    ||   |   |
" |  |  |  | |  | | |    |  |  |    |  | |  _  |     |  | |  _  | |  | |      | |  |  | |  | | _   _ |
" |  |  |  | |  | | |___ |  |  |    |  | |  |  |     |  | |  |  | |  | |_|  |_| |  |  | |  | |  \_/  |
" :  `  '  | |  | |     ||  :  |__  |  | |  |  |     |  | |  |  | |  |   |  | __|  :  | |  | |   |   |
"  \      /  |  | |     | \   /|  | |  | |  |  |     |  | |  |  | |  |   |  ||  |\   /  |  | |   |   |
"   \_/\_/  |____||_____|  \_/ |__||____||__|__|    |____||__|__||____|  |__||__| \_/  |____||___|___|
"   
"   Version 2.0  04/10/2017


let mapleader=" "
let maplocalleader = "\\"

" Setting up Dein
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim"
                \ + " $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
    let bundleExists = 0
endif


" Adding dein to runtime path
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
set runtimepath+=~/.fzf

" Begin dein
call dein#begin(expand('~/.config/nvim'))

" Begin plugin list

" Nvim yarp
call dein#add('roxma/nvim-yarp')

" colorscheme
call dein#add('beigebrucewayne/Turtles')

" Denite (unite all interfaces)
call dein#add('Shougo/denite.nvim')

" Nerdtree directory explorer
call dein#add('scrooloose/nerdtree')

" Deoplete - Autocomplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/deoplete.nvim')

" Deoplete - CLang
call dein#add('tweekmonster/deoplete-clang2')

" Django+
call dein#add('tweekmonster/django-plus.vim')

" Supertab
call dein#add('ervandew/supertab')

" Airline
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Local vim rc
call dein#add('embear/vim-localvimrc')

call dein#add('w0rp/ale')
call dein#add('sbdchd/neoformat')

" ctrlp vim
call dein#add('kien/ctrlp.vim')

" surround.vim
call dein#add('tpope/vim-surround')

" Git gutter.
call dein#add('airblade/vim-gitgutter')

" Love2d 
call dein#add('davisdude/vim-love-docs')

" Vue.js
call dein#add('posva/vim-vue')

" colorschemes
call dein#add('flazz/vim-colorschemes')
call dein#add('dylanaraps/wal.vim')

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

colorscheme wal

"=== OPTIONS ==================================================================
" vim-airline section
  let g:airline#extensions#tabline#enabled = 2
  let g:airline_skip_empty_sections = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='base16'
  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 
        \ 'Sayonara' : 'x'
  tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>t :term<cr>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab
"  set guifont="Fira Mono for Powerline"
"=== OPTIONS ==================================================================

" Enter: complete&close popup if visible (so next Enter works);
" else: break undo
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"

" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()

" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

"disable clang_completion on . and ->
let g:clang_complete_auto=1

set colorcolumn=80
set noshowmode
set ruler
set nolazyredraw
set noswapfile
set showmatch
set ignorecase
filetype on
filetype plugin on
filetype indent on
set wildmenu
set wildmode=full
set number relativenumber
set nostartofline
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set shiftwidth=4
set expandtab
set wildmenu
set expandtab 
set laststatus=2
set mouse-=a
set updatetime=500
let g:gitgutter_max_signs=10000


" Keymappings
noremap <Leader>d dd

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Plugin settings

let g:SuperTabDefaultCompletionType = "<c-n>"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose!

let g:clang2_placeholder_next = ''
let g:ale_cpp_cppcheck_options = '--enable=style --suppress=missingIncludeSystem'
let g:ale_linters = {
  \ 'python': ['pycodestyle'] ,
  \ }

" NERDTree settings.
map - :NERDTreeToggle<CR>

map + :FZF<CR>

"augroup fmt
"  autocmd!
"  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
"augroup END

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Deoplete 
let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
let g:deopelete#sources#clang#clang_header="/usr/lib/clang"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#max_list = 300
let g:deoplete#auto_complete_delay = 150
let deoplete#tag#cache_limit_size = 5000000

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
