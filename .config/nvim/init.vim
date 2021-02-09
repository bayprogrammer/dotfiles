call plug#begin('~/.config/nvim/plugged')
  Plug 'christoomey/vim-tmux-navigator', { 'commit': '6a1e58c3ca3bc7acca36c90521b3dfae83b2a602' }
  Plug 'elixir-lang/vim-elixir', { 'commit': '1ad996e64dadf0d2a65c8a079d55a0ad057c08b4' }
  Plug 'junegunn/fzf', { 'commit': '6654239c94667fefb38d76cfc47b6abf5ced8149' }
  Plug 'junegunn/fzf.vim', { 'commit': '02a192ea0bed22a015e005b281e55e0da2a8e496' }
  Plug 'preservim/nerdtree', { 'commit': '1b19089917cc3e0a81d3294fead2424c419d545c' }
call plug#end()

" Configure netrw
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.[^\.]\S\+,\~$,^\.\/$,\.pyc$'
"let g:netrw_list_hide = '^\.\/$,\.pyc$'
"let g:netrw_banner = 0
"let g:netrw_cursor = 0
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" FZF
autocmd! FileType fzf
autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
autocmd FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=1 showmode ruler
let g:fzf_preview_window = []
"let g:fzf_layout = {'down': '40%'}

" Set up colorscheme & visuals
set background=dark
syntax on
set fillchars=vert:\│
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set notermguicolors
colorscheme sixtones
"set lazyredraw
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Misc. settings
set mouse=a
set noswapfile
set nobackup
set scrolljump=-50

" Configure indentation & formatting
set textwidth=0
set formatoptions-=t
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
filetype plugin indent off
filetype plugin on

" Configure other visual information
set nowrap
set ruler
set showmode
set list
set listchars=trail:∙,tab:»\ 
set laststatus=1

set colorcolumn=0
set nonumber
set nocursorline
set hlsearch
set incsearch
set noshowmatch "parens flashing
"let g:loaded_matchparen = 1

" Other settings:
set hidden

" Custom clipboard provider
let g:clipboard = {
      \   'name': 'clipcClipp',
      \   'copy': {
      \      '+': 'clipc',
      \      '*': 'clipc',
      \    },
      \   'paste': {
      \      '+': 'clipp',
      \      '*': 'clipp',
      \   },
      \   'cache_enabled': 1,
      \ }
nnoremap ; :
set clipboard+=unnamedplus

" Custom keybinding settings
inoremap kj <ESC>
inoremap ,w <C-o>:w<CR>

let mapleader = ','
map <silent> <Leader>w :w<CR>
map <silent> <Leader>, :Files<CR>
map <silent> <Leader>e :GFiles<CR>
map <silent> <Leader>b :Buffers<CR>
map <silent> <Leader>g :Ag<CR>
map <silent> <Leader>T :Tags<CR>
map <silent> <Leader>B :BTags<CR>
map <silent> <Leader>t :tabe %<CR>

map <Leader>m :NERDTreeToggle<CR>
map <Leader>M :NERDTreeMirror<CR>
map <Leader>. :NERDTreeFind<CR>

map <silent> <Leader>s :sp<CR>
map <silent> <Leader>v :vsp<CR>
map <silent> <Leader>c :close<CR>
map <silent> <Leader>o :only<CR>

map <silent> <Leader>r :set number<CR>:set cursorline<CR>:set colorcolumn=79<CR>
map <silent> <Leader>R :set nonumber<CR>:set nocursorline<CR>:set colorcolumn=0<CR>

map <silent> <Leader>/ :noh<CR>

map <silent> <Leader>h :wincmd h<CR>
map <silent> <Leader>j :wincmd j<CR>
map <silent> <Leader>k :wincmd k<CR>
map <silent> <Leader>l :wincmd l<CR>
map <silent> <Leader>n :tabnext<CR>
map <silent> <Leader>p :tabprev<CR>

map <silent> <Leader>H :wincmd H<CR>
map <silent> <Leader>J :wincmd J<CR>
map <silent> <Leader>K :wincmd K<CR>
map <silent> <Leader>L :wincmd L<CR>
map <silent> <Leader>N :tabmove+1<CR>
map <silent> <Leader>P :tabmove-1<CR>

" Additional tmux/vim pane navigation keybinds
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
inoremap <silent> <M-h> <C-o>:TmuxNavigateLeft<CR>
inoremap <silent> <M-j> <C-o>:TmuxNavigateDown<CR>
inoremap <silent> <M-k> <C-o>:TmuxNavigateUp<CR>
inoremap <silent> <M-l> <C-o>:TmuxNavigateRight<CR>

" Make escape behave
tnoremap <silent> <Esc> <C-\><C-n>
inoremap <silent> <Esc> <C-\><C-n>
vnoremap <silent> <Esc> <C-\><C-n>

" TODO(zmd): move tmux helpers into plugin
" TODO(zmd): have tmux helpers use fzf when available

function! TmuxDebugPrint(mesg)
  call inputsave()

  redraw
  echo a:mesg

  call inputrestore()
endfunction

function! TmuxClear()
  call inputsave()

  redraw
  echo ""

  call inputrestore()
endfunction

function! TmuxSend(tmux_address, cmd)
  call inputsave()

  let vim_cmd = "silent ! tmux send-keys -t '" . a:tmux_address . "' '^w' '" . a:cmd . "' '^j'"
  execute vim_cmd

  call inputrestore()
endfunction

function! TmuxMakeFKey(f_key_n)
  call inputsave()

  return "<F" . a:f_key_n . ">"

  call inputrestore()
endfunction

function! TmuxMapKey(key, tmux_address, cmd)
  call inputsave()

  let tmux_call = ":call TmuxSend('" . a:tmux_address . "', '" . a:cmd . "')"
  let vim_cmd = "map <silent> " . a:key . " " . tmux_call . "<CR>"
  execute vim_cmd

  call inputrestore()
endfunction

function! TmuxMap()
  call inputsave()

  let tmux_address = input('$session:window.pane? ')
  let cmd = input('command? ')
  let key = input('F-? ')
  let f_key = TmuxMakeFKey(key)

  call TmuxMapKey(f_key, tmux_address, cmd)

  call TmuxClear()

  call inputrestore()
endfunction
command! TmuxMap call TmuxMap()

function! TmuxMapBangBang()
  call inputsave()

  let tmux_address = input('$session:window.pane? ')
  let key = input('F-? ')
  let f_key = TmuxMakeFKey(key)
  call TmuxMapKey(f_key, tmux_address, '\!\!')

  call TmuxClear()

  call inputrestore()
endfunction
command! TmuxMapBangBang call TmuxMapBangBang()

function! TmuxMapByebug()
  call inputsave()

  let tmux_address = input('$session:window.pane? ')
  call TmuxMapKey("<F9>", tmux_address, "list=")
  call TmuxMapKey("<F10>", tmux_address, "next")
  call TmuxMapKey("<F11>", tmux_address, "step")
  call TmuxMapKey("<F12>", tmux_address, "finish")

  call TmuxClear()

  call inputrestore()
endfunction
command! TmuxMapByebug call TmuxMapByebug()
