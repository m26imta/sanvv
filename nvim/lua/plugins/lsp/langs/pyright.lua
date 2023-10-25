local M = {}
M.options = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}

M.on_attach = function(client, _)
  print("on_attach " .. client.name)
end

return M
