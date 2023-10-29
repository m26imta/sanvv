local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)  -- remove space
keymap("", "<c-`>", "<Nop>", opts)
keymap("n", "J", "<Nop>", opts)  -- remove key J in normal mode
keymap("n", "K", "<Nop>", opts)  -- remove key K in normal mode

vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.cmd("nnoremap ; :")
keymap("i", "jk", "<ESC>", opts)

-- move around text
keymap({"i", "c", "t"}, "<C-h>", "<LEFT>", { noremap = true })
keymap({"i", "c", "t"}, "<C-l>", "<RIGHT>", { noremap = true })
keymap({"i", "c", "t"}, "<C-j>", "<DOWN>", { noremap = true })
keymap({"i", "c", "t"}, "<C-k>", "<UP>", { noremap = true })

-- window navigation
keymap("n", "<C-h>", "<C-w><LEFT>", opts)
keymap("n", "<C-l>", "<C-w><RIGHT>", opts)
keymap("n", "<C-j>", "<C-w><DOWN>", opts)
keymap("n", "<C-k>", "<C-w><UP>", opts)

-- buffers
keymap("n", "L", ":bn<CR>", opts)
keymap("n", "H", ":bp<CR>", opts)
keymap("n", "<tab>", ":b#<CR>", opts)

-- File
--keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
--keymap("n", "<A-q>", "<cmd>Bwipeout<CR>", opts)
keymap("n", "<leader>LL", ":e $MYVIMRC<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q><C-x>", "<cmd>q!<CR>", opts)
--keymap("n", "<leader>e", "<cmd>e ./<CR>", opts)
keymap("n", "<leader>x", "<cmd>bd!<CR>", opts)

-- -----
keymap("n", "x", '"_x', opts)  -- do not yank with x
keymap("v", "p", '"_dP', opts) -- better paste
keymap({"c", "t", "i"}, "<c-r><c-r>", '<c-r>"', { noremap = true })
keymap("n", "<C-a>", "ggVG", opts)
keymap("n", "-", "<C-x>", opts)
keymap("n", "=", "<C-a>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<", "v<<ESC>")
keymap("n", ">", "v><ESC>")
keymap("n", "<ESC>", ":nohl<CR>", opts)
-- move lines
-- keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })
-- keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })
vim.cmd([[
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
]])
-- search text with C-f
keymap("v", "<c-f>", 'y<ESC>/<c-r>"<CR>', opts)
-- Vim search and replace selected text
-- https://stackoverflow.com/a/676619
vim.cmd([[vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<left><left><left>]])
-- Select entire line in VIM, without the new line character
-- https://stackoverflow.com/a/61624228
vim.cmd([[
vnoremap LL :<C-U>normal mtg_v`t<CR>
omap LL :normal vLL<CR>
vnoremap HH :<C-U>normal mt^v`t<CR>
omap HH :normal vHH<CR>
vnoremap al :<C-U>normal 0v$h<CR>
omap al :normal val<CR>
vnoremap il :<C-U>normal ^vg_<CR>
omap il :normal vil<CR>
]])

M = {}
M.plugins_keymaps = {
  bbye = {
    { "<s-q>", "<cmd>Bdelete!<cr>", desc = "Close current buffer", mode = {"n"}, noremap = true, silent = true },
  },
  neotree = {
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = {"n"} },
  },
  nvimtree = {
      { "<leader>ee", "<cmd>NvimTreeToggle<cr>", silent = true },
      { "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", silent = true },
  },
  telescope = {
    { "<leader>tll", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    { "<leader>tff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files" },
    { "<leader>tlg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Live Grep" },
    { "<leader>tgs", "<cmd>Telescope grep_string<cr>", desc = "Telescope: Grep String" },
    {
      "<leader>tps",
      function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ")  }); end,
      desc = "Telescope: Search string"
    },
  },
  lazygit = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit", mode = {"n"}, noremap = true, silent = true },
  },
}

M.lsp_set_keymaps = function(_, bufnr)
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<c-space><c-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)

  -- Workspace
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end

M.saga_set_keymaps = function(_, bufnr)
  M.lsp_set_keymaps(_, bufnr)
end

return M
