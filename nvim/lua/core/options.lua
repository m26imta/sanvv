local tabsize = 4

-- tab & indent
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.softtabstop = tabsize
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.smarttab = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
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
vim.opt.showmode = false  -- no [INSERT] or [VISUAL] anymore

-- -----
vim.opt.timeoutlen = 350
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
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

