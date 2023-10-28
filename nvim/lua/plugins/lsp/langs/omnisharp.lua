local M = {}
M.options = {}

-- load omnisharp_extend_lsp
local _ok, _ = pcall(require, "omnisharp_extended")
if _ok then
  print("omnisharp extend ok")
  M.options = vim.tbl_deep_extend("force", M.options,
    {
      handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
      },
    })
end

M.on_attach = function(client, _)
  -- print("on_attach " .. client.name)
end

return M
