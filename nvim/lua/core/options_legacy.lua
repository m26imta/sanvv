vim.cmd([[
if !has('nvim')
    " Change Your Vim Cursor from a Block to Line in Insert Mode
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
    " write as sudo
    "cmap w!! w !sudo tee > /dev/null %
    command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
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
set timeoutlen=400

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
nnoremap <silent> <leader>,oo :e $MYVIMRC<CR>
nnoremap <silent> <leader>,ll :so $MYVIMRC<CR>

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
nnoremap <C-h> <C-w><LEFT>
nnoremap <C-l> <C-w><RIGHT>
nnoremap <C-j> <C-w><DOWN>
nnoremap <C-k> <C-w><UP>

" Indent
vnoremap > >gv
vnoremap < <gv
nnoremap > v><ESC>
nnoremap < v<<ESC>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <A-Down> mz:m+<cr>`z
nmap <A-Up> mz:m-2<cr>`z
vmap <A-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" https://vim.fandom.com/wiki/Moving_lines_up_or_down
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" yank & paste
noremap! <C-r><C-r> <C-r>"
nnoremap ,<C-a> ggVG
"vnoremap p "_dP
nnoremap x "_x

" Status line
set showmode
set laststatus=2
set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
]])

