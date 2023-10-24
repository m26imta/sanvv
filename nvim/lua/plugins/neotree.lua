local config = function()
  -- Disable netrw
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrw = 1

  local options = {
    window = {
      width = 20,
      mappings = {
        ['h'] = "close_node",
        ['l'] = "open",
      },
    },
  }

  require("neo-tree").setup(options)
end

return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = config,
} 
