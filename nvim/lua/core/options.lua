local tabsize = 4

-- tab & indent
vim.opt.tabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.softtabstop = tabsize  -- default = 0
vim.opt.expandtab = true  -- default = false
vim.opt.smartindent = true  -- default = false

vim.opt.smarttab = true  -- default = true
vim.opt.autoindent = true  -- default = true

-- search
vim.opt.ignorecase = true  -- default = true
vim.opt.smartcase = true  -- default = false
vim.opt.incsearch = true  -- default = true
vim.opt.hlsearch = false  -- default = true
vim.opt.showmatch = true  -- default = false

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true  -- default = false
vim.opt.termguicolors = true  -- default = false
vim.opt.cmdheight = 1  -- default = 1
vim.opt.scrolloff = 5  -- default = 0
vim.opt.sidescrolloff = 5  -- default = 0
vim.opt.ruler = true
vim.opt.showmode = false  -- no [INSERT] or [VISUAL] anymore

-- -----
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = true
vim.opt.linebreak = true
--vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.shortmess:append("c")
--vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.timeoutlen = 350
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

