local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)  -- remove space
keymap("", "<c-`>", "<Nop>", opts)
keymap("n", "J", "<Nop>", opts)  -- remove key J in normal mode
keymap("n", "K", "<Nop>", opts)  -- remove key K in normal mode

vim.g.mapleader = " "
vim.g.maplocalleader = " "


keymap("i", "jk", "<ESC>", opts)
vim.cmd("nnoremap ; :")

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
keymap("n", "<leader>e", "<cmd>e ./<CR>", opts)
keymap("n", "<leader>x", "<cmd>bd!<CR>", opts)
vim.cmd([[
if has("unix")
  cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit!
endif
]])


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
-- move lines
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move down" })
-- search text with C-f
keymap("v", "<c-f>", 'y<ESC>/<c-r>"<CR>', opts)
-- Vim search and replace selected text
-- https://stackoverflow.com/a/676619
vim.cmd([[vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<left><left><left>]])
-- Select entire line in VIM, without the new line character
-- https://stackoverflow.com/a/61624228
vim.cmd([[
vnoremap il :<C-U>normal mtg_v`t<CR>
omap il :normal vil<CR>
vnoremap ih :<C-U>normal mt^v`t<CR>
omap ih :normal vih<CR>
]])

