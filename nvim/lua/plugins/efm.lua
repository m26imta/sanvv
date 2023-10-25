local config = function()
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")

  require("lspconfig").efm.setup({
    filetypes = {
      "lua",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = {
          luacheck,
          stylua,
        }
      },
    },
  })

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
  dependencies = {
    { 'creativenull/efmls-configs-nvim' },
  },
  config = config,
}
