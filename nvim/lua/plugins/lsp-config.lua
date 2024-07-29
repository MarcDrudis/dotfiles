return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "texlab", "ltex" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.texlab.setup({ capabilities = capabilities })
      lspconfig.ltex.setup({ capabilities = capabilities })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            autoImportCompletion = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
              typeCheckingMode =
              'off'
            }
          }
        }

      })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set({ "n", "v" }, "<leader>k", vim.diagnostic.open_float)
      vim.keymap.set({ "n", "v" }, "<C-k>", vim.diagnostic.goto_next)
      vim.keymap.set({ "n", "v" }, "<C-S-K>", vim.diagnostic.goto_prev)
      -- vim.keymap.set("n", "<leader>f", function()
      --   vim.lsp.buf.format({ async = true })
      -- end)
    end,
  },
}
