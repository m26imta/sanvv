local tabsize = 4

-- tab & indent
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.softtabstop = tabsize
vim.opt.autoindent = true  -- keep indent when starting new line <CR>
vim.opt.smartindent = true -- indent after code-block opener `{` followed by an <CR>
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smarttab = true    -- When ON, a <Tab> in front of a line inserts blanks according to `shiftwidth` instead of `tabstop/softtabstop`

-- search
vim.opt.ignorecase = true  -- Ignore case when searching
vim.opt.smartcase = true   -- When searching try to be smart about cases
vim.opt.incsearch = true   -- Makes search act like search in modern browsers
vim.opt.hlsearch = true
vim.opt.showmatch = true

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.ruler = true
vim.cmd([[
set showmode  " noshowmode: no [INSERT] or [VISUAL] anymore
set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c  " Format the status line
]])

-- -----
vim.opt.timeoutlen = 350
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.linebreak = true
--vim.opt.showbreak = "↪"
--vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.shortmess:append("c")
--vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.list = false
vim.opt.listchars = {
  tab = '→ ',
  nbsp = '␣',
  trail = '•',
  -- trail = '~',
  space = "⋅",
  extends = '▶',
  precedes = '◀',
  -- eol = '↲',
  eol = '↴',
}


-- Neovide
if vim.g.neovide then
  local cursor_vfx_mode = {"railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"}
  vim.g.neovide_cursor_vfx_mode = cursor_vfx_mode[6]
  vim.o.guifont = 'JetBrainsMono Nerd Font:h11'
  vim.g.neovide_transparency = 0.95
  -- vim.g.neovide_fullscreen = true  -- windowed fullscreen mode
  vim.cmd([[ nnoremap <C-A-m> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR> ]])
  vim.g.neovide_cursor_animation_length = 0.08  -- 0.06
  vim.g.neovide_cursor_trail_size = 0.8  -- 0.7
  -- vim.g.neovide_cursor_antialiasing = false  -- Disabling may fix some cursor visual issues.
end

