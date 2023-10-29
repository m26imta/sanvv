vim.cmd([[
if !has('nvim')
    " Change Your Vim Cursor from a Block to Line in Insert Mode
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif
if has('win32')
    set ff=dos
endif

color habamax
set number relativenumber cursorline
set ts=4 sw=4 sts=4 autoindent smartindent expandtab smarttab
set ignorecase smartcase incsearch hlsearch showmatch
set enc=utf-8 fenc=utf-8
set mouse=a clipboard=unnamedplus
set wrap linebreak iskeyword+=- backspace=indent,eol,start

let mapleader = " "
let localmapleader = " "
nnoremap ; :
inoremap jk <ESC>
nmap J <Nop>
nmap K <Nop>
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <C-q><C-x> :q!<CR>
nnoremap <silent> <leader>fe :e .<CR>

" Buffer
nnoremap <silent> <leader>x :bd!<CR>
nnoremap <silent> Q :bd!<CR>
nnoremap <silent> L :bn<CR>
nnoremap <silent> H :bn<CR>

" Move around text in InsertMode & CommandMode
noremap! <C-h> <LEFT>
noremap! <C-l> <RIGHT>
noremap! <C-j> <DOWN>
noremap! <C-k> <UP>

" Move around windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Indent
vnoremap > >gv
vnoremap < <gv
nmap > v><ESC>
nmap < v<<ESC>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" yank & paste
noremap! <C-r><C-r> <C-r>"
nnoremap g<C-a> ggVG
"vnoremap p "_dP
nnoremap x "_x

" Status line
set showmode
set laststatus=2
set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
]])

