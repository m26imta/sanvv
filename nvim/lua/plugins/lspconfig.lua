local config = function()
  local lspconfig = require('lspconfig')
  local mason_ensured_installed = {
    "efm",
    "lua_ls",
    "jsonls",
    -- "omnisharp",
    -- "mypy",
    -- "ruff",
    -- "black",
    -- "debugpy",
    -- "pyright",
  }
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = mason_ensured_installed,
    automatic_installed = true,
  })

  local set_keymaps = function(...)
    local _ok, _ = pcall(require, "lspsaga")
    if _ok then
      require("core.keymaps").saga_set_keymaps(...)
    else
      require("core.keymaps").lsp_set_keymaps(...)
    end
  end

  local get_capabilities = function()
    local capabilities = {}
    capabilities = vim.lsp.protocol.make_client_capabilities()
    --capabilities.textDocument.completion.completionItem.snippetSupport = true
    local ok, cmp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp.default_capabilities(capabilities)
    end
    return capabilities
  end

  for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    local options = {
      --on_attach = on_attach,
      capabilities = get_capabilities(),
    }
    -- load custom lsp_server config located in plugins/lsp/langs folder
    local has_custom_config, lsp_server_config = pcall(require, "plugins.lsp.langs." .. server )
    if has_custom_config then
      if lsp_server_config.options ~= nil then
        options = vim.tbl_deep_extend("force", options, lsp_server_config.options )
        options.on_attach = function(...)
          set_keymaps(...)
          if lsp_server_config.on_attach~=nil and type(lsp_server_config.on_attach)=="function" then
            lsp_server_config.on_attach(...)
          end
        end
      end
    else
      options.on_attach = function(...)
        set_keymaps(...)
      end
    end
    lspconfig[server].setup(options)
  end
end


return{
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPost", "BufNewFile", "BufEnter" },
    config = config,
    dependencies = {
      { 'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
          require("fidget").setup()
        end,
      },
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "VeryLazy",
        enabled = false,
        config = function()
          require("lsp_lines").register_lsp_virtual_lines()
          -- Disable virtual_text since it's redundant due to lsp_lines.
          vim.diagnostic.config({virtual_text = false })
        end,
      },
      { "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        event = "VeryLazy",
        enabled = true,
        config = function()
          require("toggle_lsp_diagnostics").init()
          vim.cmd([[
            " nmap <leader>tlu <Plug>(toggle-lsp-diag-underline)
            " nmap <leader>tls <Plug>(toggle-lsp-diag-signs)
            " nmap <leader>tlv <Plug>(toggle-lsp-diag-vtext)
            " nmap <leader>tlp <Plug>(toggle-lsp-diag-update_in_insert)
            "
            " nmap <leader>tld  <Plug>(toggle-lsp-diag)
            " nmap <leader>tldd <Plug>(toggle-lsp-diag-default)
            " nmap <leader>tldo <Plug>(toggle-lsp-diag-off)
            " nmap <leader>tldf <Plug>(toggle-lsp-diag-on)

            "" Toggle: Ctrl+F8
            nmap <F32> <Plug>(toggle-lsp-diag)
          ]])
        end,
      }
    },
  },
}

