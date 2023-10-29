local config = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "html", "css", "javascript", "json",
      "bash", "vim", "lua",
      "c", "cpp",
      "c_sharp",
      "python",
      "java",
      "typescript",
      "tsx",
      "rust",
      "yaml",
      "markdown",
      "markdown_inline"
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
    },
    autopairs = { enable = true }, -- enable plugin nvim-autopairs
    autotag = { enable = true },  -- enable plugin nvim-ts-autotag
    indent = {
      enable = true,
      disable = {
        "python",  -- fix: not indent in funtion()
        "css",
      },
    },
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufEnter", "BufReadPost", "BufNewFile" },
    config = config,
    dependencies = {
      {"windwp/nvim-ts-autotag" },
      {"windwp/nvim-autopairs", opts = {} },
      {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {
          padding = true,     -- Add a space b/w comment and the line
          sticky = true,      -- Whether the cursor should stay at its position
          mappings = {
            basic = true,     -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
            extra = true,     -- Includes `gco`, `gcO`, `gcA`
            extended = false, -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
          },
        },
      }
    },
  },
}

