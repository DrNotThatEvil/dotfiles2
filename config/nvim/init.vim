"  _     _  ___   ___      __   __        ___   __    _ 
" | | _ | ||   | |   |    |  | |  |      |   | |  |  | |
" | || || ||   | |   |    |  |_|  |      |   | |   |_| |
" |       ||   | |   |    |       |      |   | |       |
" |       ||   | |   |___ |       | ___  |   | |  _    |
" |   _   ||   | |       | |     | |   | |   | | | |   |
" |__| |__||___| |_______|  |___|  |___| |___| |_|  |__|
"
" Author: Willmar Knikker Aka @DrNotThatEvil.
" Reop: https://github.com/drnotthatevil/dotfiles2/
" 

  set nocompatible

  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
    let bundleExists = 0
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  
  call dein#add('Shougo/dein.vim')
  call dein#add('mileszs/ack.vim')

" syntax
  call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
  call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
" 
  call dein#add('moll/vim-node')
  call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
  call dein#add('elzr/vim-json', {'on_ft': 'json'})
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('Shougo/denite.nvim')
  call dein#add('reedes/vim-colors-pencil')
" call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  call dein#add('mhartington/vim-folds')
  call dein#add('Yggdroot/indentLine')
  call dein#add('itmammoth/doorboy.vim')
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
" 
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('jreybert/vimagit')
  call dein#add('airblade/vim-gitgutter')
" call dein#add('Xuyuanp/nerdtree-git-plugin')
" 
  call dein#add('tpope/vim-repeat')
  call dein#add('neomake/neomake')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('ap/vim-css-color')
  call dein#add('Shougo/unite.vim')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('junkblocker/unite-codesearch')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('vim-airline/vim-airline-themes')
" call dein#add('freeo/vim-kalisi')

" deoplete stuff
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('carlitux/deoplete-ternjs')
   
  call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('Konfekt/FastFold')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  call dein#add('heavenshell/vim-jsdoc')
  call dein#add('mhinz/vim-sayonara')
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('junegunn/goyo.vim')
  call dein#add('vim-scripts/SyntaxRange')
  call dein#add('rhysd/nyaovim-popup-tooltip')
  call dein#add('troydm/asyncfinder.vim')
  call dein#add('nelstrom/vim-markdown-folding')
  call dein#add('tyru/markdown-codehl-onthefly.vim')
  call dein#add('rafi/vim-unite-issue')
  call dein#add('tyru/open-browser.vim')
" call dein#add('ryanoasis/vim-devicons')
" call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('Soares/base16.nvim')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif
  
  call dein#end()
  filetype plugin indent on
  
" ENABLING THE BREAKING OF THE HABBIT!
  imap <up> <nop>
  imap <down> <nop>
  imap <left> <nop>
  imap <right> <nop>

  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>

" Theme settings.
  if (has("termguicolors"))
    set termguicolors
  endif
 
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
 
  syntax enable
  colorscheme atelier-cave
  set background=dark

  let g:vim_markdown_folding_disabled = 1
  autocmd FileType markdown,text,html setlocal spell complete+=kspell
  autocmd FileType markdown,text,html hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
  let g:instant_markdown_autostart = 0
  autocmd TermOpen * set bufhidden=hide

" Setting up some stuff.
  
  set t_Co=256
  set pastetoggle=<f6>
  set noshowmode
  set noswapfile
  filetype on
  set number
  set tabstop=4 
  set softtabstop=0 noexpandtab
  set wildmenu
  set laststatus=2
  set wrap linebreak nolist
  set wildmode=full
  let mapleader = ','
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
" center buffer around cursor when opening files
  autocmd BufRead * normal zz
  let g:jsx_ext_required =1
  set complete=.,w,b,u,t,k
  let g:gitgutter_max_signs = 1000
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
  let g:indentLine_char='│'
" enable deoplete 
  let g:deoplete#enable_at_startup = 1
  let g:go_fmt_command = "goimports"
  let g:table_mode_corner="|"
  let g:dein#install_progress_type = 'none'
  
" No need for ex mode
  nnoremap Q <nop>
" recording macros is not my thing
  map q <Nop>
" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
" Navigate between display lines
  noremap  <silent> <Up>   gk
  noremap  <silent> <Down> gj
  noremap  <silent> k gk
  noremap  <silent> j gj
  noremap  <silent> <Home> g<Home>
  noremap  <silent> <End>  g<End>
  inoremap <silent> <Home> <C-o>g<Home>
  inoremap <silent> <End>  <C-o>g<End>
" copy current files path to clipboard
  nmap cp :let @+ = expand("%") <cr>
" Neovim terminal mapping
" terminal 'normal mode'
  tmap <esc> <c-\><c-n><esc><cr>
" ,f to format code, requires formatters: read the docs
  noremap <leader>f :Autoformat<CR>
  noremap <leader>TM :TableModeToggle<CR>
" this is the best, let me tell you why
" how annoying is that everytime you want to do something in vim
" you have to do shift-; to get :, can't we just do ;?
" Plus what does ; do anyways??
" if you do have a plugin that needs ;, you can just wap the mapping
" nnoremap : ;
" give it a try and you will like it
  nnoremap ; :

" Move esc key to fast jk
  imap jk <Esc>

  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'
  
" Fold, gets it's own section  ----------------------------------------------{{{

  function! MyFoldText() " {{{
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
  endfunction " }}}

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99
  " Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

  autocmd FileType html setlocal fdl=99

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
  autocmd FileType css,scss,json setlocal foldmethod=marker
  autocmd FileType css,scss,json setlocal foldmarker={,}

  autocmd FileType coffee setl foldmethod=indent
  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}
" NERDTree ------------------------------------------------------------------{{{

" vimfiler
  set fillchars=vert:│,fold:─
  let g:vimfiler_tree_leaf_icon = ""
  let g:vimfiler_tree_opened_icon = "▼"
  let g:vimfiler_tree_closed_icon = "▷"
  " call vimfiler#custom#profile('default', 'context', {
  "       \ 'safe' : 0,
  "       \ 'explorer': 1
  "       \ })
  "
   map - :NERDTreeToggle<CR>
  " map <c-\> :NERDTreeToggle<cr>
  " map <c-\> :e .<cr>
  " let g:NERDTreeHijackNetrw = 1
  " map <c-\> :VimFilerExplorer<CR>
  " map <C-\> :<C-u>Unite -start-insert -no-split -buffer-name=file_vcs file/vcs<CR>
  autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let g:NERDTreeAutoDeleteBuffer=1
" }}}

" Snipppets -----------------------------------------------------------------{{{

" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets, ~/Github/ionic-snippets, ~/.config/repos/github.com/matthewsimo/angular-vim-snippets/snippets'

" SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" }}}

" Emmet customization -------------------------------------------------------{{{
" Enable Emmet in all modes
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction

  autocmd FileType html,markdown imap <buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
"}}}

" unite ---------------------------------------------------------------------{{{
"
  let g:unite_data_directory='~/.nvim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='❯ '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']

  nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright file_rec/neovim<CR>
  nnoremap <silent> <leader>c :Unite -auto-resize -start-insert -direction=botright colorscheme<CR>
  nnoremap <silent> <leader>u :call dein#update()<CR>
  nnoremap <silent> <leader>m :Unite -auto-resize -start-insert -direction=botright redismru<CR>

  nnoremap <silent> <leader>o :Unite -winwidth=45 -vertical -direction=botright outline<CR>
  nnoremap <leader>I :Unite -no-split -vertical -direction=topleft issue:github:driftyco/
  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()

function! s:unite_settings() "{{{
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction "}}}

" Git from unite...ERMERGERD ------------------------------------------------{{{
let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
let g:unite_source_menu_menus.git = {
  \ 'description' : 'Fugitive interface',
  \}
let g:unite_source_menu_menus.git.command_candidates = [
  \[' git status', 'Gstatus'],
  \[' git diff', 'Gvdiff'],
  \[' git commit', 'Gcommit'],
  \[' git stage/add', 'Gwrite'],
  \[' git checkout', 'Gread'],
  \[' git rm', 'Gremove'],
  \[' git cd', 'Gcd'],
  \[' git push', 'exe "Git! push " input("remote/branch: ")'],
  \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
  \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
  \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
  \[' git fetch', 'Gfetch'],
  \[' git merge', 'Gmerge'],
  \[' git browse', 'Gbrowse'],
  \[' git head', 'Gedit HEAD^'],
  \[' git parent', 'edit %:h'],
  \[' git log commit buffers', 'Glog --'],
  \[' git log current file', 'Glog -- %'],
  \[' git log last n commits', 'exe "Glog -" input("num: ")'],
  \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
  \[' git log until date', 'exe "Glog --until=" input("day: ")'],
  \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
  \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
  \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
  \[' git mv', 'exe "Gmove " input("destination: ")'],
  \[' git grep',  'exe "Ggrep " input("string: ")'],
  \[' git prompt', 'exe "Git! " input("command: ")'],
  \] " Append ' --' after log to get commit info commit buffers
nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
" }}}
" }}}

" Navigate between vim buffers and tmux panels ------------------------------{{{
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
  tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
  tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
  tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
  tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>
" }}}

" vim-airline ---------------------------------------------------------------{{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_skip_empty_sections = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  " let g:airline_powerline_fonts = 1
  let g:airline_theme='jellybeans'
  " let g:airline_theme='base16_solarized'
  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>t :term<cr>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
  tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
  tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
  tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
  tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
  tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
  tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
  tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
  tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
"}}}

" Linting -------------------------------------------------------------------{{{

  let g:neomake_warning_sign = {'text': '?', 'texthl': 'NeomakeWarningSign'}
function! neomake#makers#ft#typescript#tsc()
    return {
        \ 'args': [
            \ '-m', 'commonjs', '--target', 'es5', '--emitDecoratorMetadata', 'true', '--experimentalDecorators', 'true'
        \ ],
        \ 'errorformat':
            \ '%f %#(%l\,%c): error %m,'
        \ }
endfunction


    let g:neomake_typescript_tslint = {
        \ 'args': ['%:p', '--format verbose'],
        \ 'errorformat': 'f:%l:%c: %m'
        \ }


  let g:neomake_open_list = 2

  let g:neomake_markdown_alex_maker = {
    \ 'exe': 'alex',
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
  let g:neomake_markdown_enabled_makers = ['alex']

  autocmd! BufWritePost * Neomake
" }}} 
