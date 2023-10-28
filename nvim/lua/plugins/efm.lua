local config = function()
  local opts = {
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    filetypes = { },
    settings = {
      languages = { },
    },
  }

  -- lua
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  opts = vim.tbl_deep_extend("force", opts, {
    filetypes = { "lua" },
    settings = {
      languages = {
        lua = { luacheck, stylua },
      },
    },
  })

  -- python
  local black = require("efmls-configs.formatters.black")
  local flake8 = require("efmls-configs.linters.flake8")
  opts = vim.tbl_deep_extend("force", opts, {
    filetypes = { "python" },
    settings = {
      languages = {
        python = { black, flake8 }
      }
    }
  })

  -- call efm setup
  require("lspconfig").efm.setup({ opts })

  -- format on Save
  local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = lsp_fmt_group,
    callback = function()
      local efm = vim.lsp.get_active_clients({ name = "efm" })
      if vim.tbl_isempty(efm) then
        return
      end
    end,
  })
end

return {
  'mattn/efm-langserver',
  event = "VeryLazy",
  dependencies = {
    { 'creativenull/efmls-configs-nvim' },
  },
  enabled = false,
  config = config,
}

