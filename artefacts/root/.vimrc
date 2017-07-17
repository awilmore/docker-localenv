""
""  awilmore.com
""

" Control
set encoding=utf-8
set nocompatible
set history=50
set ffs=unix

" Colors and highlighting
highlight Normal guifg=white guibg=black
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set guioptions-=T

" Display
set background=dark     
set ruler
set showcmd                         " display incomplete commands
syntax on 
"set nu                              " number lines

" Whitespace
set nowrap                          " don't wrap lines
set tabstop=2                       " a tab is two spaces
set shiftwidth=2                    " an autoindent (with <<) is two spaces
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode

"" Searching
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

" Cut-n-Paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Windowing
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0                           " set other opened files to just show filename

" Autocommands
autocmd FileType json set equalprg=tidyjson         " needs tidyjson.exe and Jayrock.Json.dll in Gvim installation folder, or Cygwin's /bin folder
autocmd FileType xml  set equalprg="xmllint --format --recover - "
"vmap ,x !xmllint --format -<CR>


" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-l> :NERDTreeFind<CR><C-W>w

" Start with NERDTree open
autocmd VimEnter * if !argc() | NERDTree | elseif !&diff | NERDTree | wincmd w | NERDTreeFind | wincmd w | endif

" Close when NERDTree last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" CUSTOM
command CD execute "!cd %:p:h && clear && echo && echo ' *** SPAWNING NEW SHELL IN CURRENT DIRECTORY *** ' && echo && bash"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" EXPERIMENTAL: ESC REMAPING
""

noremap `` <Esc>
inoremap `` <Esc>
nnoremap `` <Esc>
vnoremap `` <Esc>
onoremap `` <Esc>

noremap <Tab><Tab> <Esc>
inoremap <Tab><Tab> <Esc>
nnoremap <Tab><Tab> <Esc>
vnoremap <Tab><Tab> <Esc>
onoremap <Tab><Tab> <Esc>

""
"" EXPERIMENTAL: ESC REMAPING
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
