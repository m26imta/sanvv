return {
  "nvim-lualine/lualine.nvim",
  --event = "BufEnter", lazy = true,
  event = "VeryLazy",
  enabled = true,
  config = function()
    vim.opt.showmode = false
    require("lualine").setup({})
  end
}
