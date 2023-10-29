local config = function()
  require("code_runner").config({
    filetype = {
      java = { "cd $dir &&", "javac $fileName &&", "java $fileNameWithoutExt" },
      python = "python3 -u",
      typescript = "deno run",
      rust = { "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt"
      },
      cs = function(...)
        local root_dir = require("lspconfig").util.root_pattern "*.csproj"(vim.loop.cwd())
        return "cd " .. root_dir .. " && dotnet run$end"
      end,
    }
  })
end

return {
  { "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
    init = function ()
      vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
    end,
    config = true,
  },
}
