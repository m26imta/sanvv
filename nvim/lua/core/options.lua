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
vim.opt.showmode = false  -- no [INSERT] or [VISUAL] anymore

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
  vim.o.guifont = 'JetBrains Mono Nerd Font:h14'
  vim.g.neovide_transparency = 0.95
  -- vim.g.neovide_fullscreen = true  -- windowed fullscreen mode
  vim.cmd([[ nnoremap <C-A-m> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR> ]])
  vim.g.neovide_cursor_animation_length = 0.08  -- 0.06
  vim.g.neovide_cursor_trail_size = 0.8  -- 0.7
  -- vim.g.neovide_cursor_antialiasing = false  -- Disabling may fix some cursor visual issues.
end

