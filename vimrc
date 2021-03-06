" ========== Vim Basic Settings ============="

" Make vim incompatbile to vi.
set nocompatible

" Pathogen settings.
filetype off

" load vundle settings file
source ~/.vim/my_vundles.vim

filetype plugin indent on
set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set noshowmode
set showcmd
set hidden
set visualbell

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set number
set relativenumber

set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79

" To  show special characters in Vim
set listchars=tab:▸\ ,eol:¬

" vim handles long lines nicely with these
nnoremap j gj
nnoremap k gk

" enable folding
set foldmethod=indent
set foldlevel=99

"Changing Leader Key
let mapleader = ","
let localleader = "\\"

" Set title to window
set title

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,v Select just pasted text.
nnoremap <leader>v V`]

" jj For Qicker Escaping between normal and editing mode.
inoremap jj <ESC>

" map only command to an easy leader shortcut
nnoremap <leader>o :only<CR>

" easy save file
nnoremap <leader>w :w<CR>

" easy switch to last edited buffer (alternate buffer)
nnoremap <leader>, :b#<CR>

" make word uppercase and continue editing
inoremap <c-u> <esc>gUiw`]a
" make word under the cursor uppercase
nnoremap <c-u> gUiw

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
"set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.beam
set wildignore+=build
set wildignore+=static
set wildignore+=tmp
set wildignore+=node_modules
set wildignore+=*.class

" enable file jump for django template files
set path+=templates " for django versions < 1.4
set path+=*/templates " for django versions 1.4 and higher
set path+=*/*/templates
set path+=*/*/*/templates " specific for polar project structure
set path+=assets " for django versions < 1.4
set path+=*/assets " for django versions 1.4 and higher
set path+=*/*/assets
set path+=*/*/*/assets " specific for polar project structure

set dir=~/.vimtmp
set undodir=~/.vimtmp
set clipboard=unnamed
set suffixesadd+=.html

" Removing scrollbars
if has("gui_running")
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  set guifont=Monaco:h14
endif

" Special Settings for Consoles
if !has("gui_running")
  set t_Co=256
endif

colorscheme hybrid
set background=dark

syntax on

" toggle background color base between dark and light
map <F5> :call ToggleBg()<CR>
function! ToggleBg()
  if &background == 'dark'
    set bg=light
  else
    set bg=dark
  endif
endfunc

" Set vim to save the file on focus out.
augroup file_operation
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup programming_au
  autocmd!
  autocmd FileType ruby,vim,jade,stylus setl ts=2 sts=2 sw=2
  autocmd FileType javascript setl ts=2 sts=2 sw=2
  autocmd FileType html,htmldjango setl nowrap ts=2 sts=2 sw=2
  autocmd FileType snippet,snippets setlocal noexpandtab
  autocmd BufEnter *.rss,*.atom,*.odrl setf xml
  autocmd BufEnter *.pkb,*.pks,*.tpb,*.tps,*.prc set ft=plsql
  autocmd BufEnter plsql setl ts=2 sts=2 sw=2
  autocmd BufEnter volofile setf javascript
  autocmd FileType python set ft=python.django " For SnipMate
  "autocmd FileType python set omnifunc=jedi#complete
  autocmd FileType html set ft=htmldjango " For SnipMate
  autocmd FileType go setlocal noexpandtab ts=4 sts=4 sw=4
augroup END

" ========== Plugin Settings =========="
" Mapping to NERDTree
nnoremap <C-s> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.beam$']

" Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

" syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_go_checkers=['gofmt']
let g:syntastic_javascript_checkers=['jsl']
let g:syntastic_check_on_open=1

" vim-virtualenv plugin settings
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'

" after this command i type the name of virtualenv
nnoremap <leader>V :VirtualEnvActivate 

" ctrl-p plugin options
let g:ctrlp_max_height = 30
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'rw'
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>y :CtrlPBufTag<CR>

" gundo settings
nnoremap <leader>G :GundoToggle<CR>

" enable matchit plugin
runtime macros/matchit.vim

" vim-javascript configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" bufferline
let g:bufferline_solo_highlight = 1
let g:bufferline_echo = 0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = -1 "always last

" airline configuration
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
" unicode symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" vitality
let g:vitality_fix_focus=0

" signify plugin
let g:signify_vcs_list = [ 'git' ]
let g:signify_disable_by_default = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 1

nnoremap <leader>gt :SignifyToggle<CR>
nnoremap <leader>gh :SignifyToggleHighlight<CR>
nnoremap <leader>gr :SignifyRefresh<CR>
nnoremap <leader>gd :SignifyDebug<CR>

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" silver searcher options
let g:agprg="ag --column --smart-case --follow --skip-vcs-ignores"
let g:aghighlight=1

" dash.vim cinfiguration
:nmap <silent> <leader>S <Plug>DashGlobalSearch
:nmap <silent> <leader>s <Plug>DashSearch

augroup go_au
  autocmd!
  autocmd FileType go nmap K <Plug>(go-doc)
  autocmd FileType go nmap <leader>d <Plug>(go-def)
  autocmd FileType haskell set omnifunc=necoghc#omnifunc
augroup END

" YouCompleteMe settings
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_complete_in_strings = 0
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_strings = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'mail' : 1,
        \ 'gitcommit': 1
        \}

" snipmate trigger key modified because conflicts with youcompleteme
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" go-vim plugin
let g:go_disable_autoinstall = 1

" haskell
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
