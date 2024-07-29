return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort.with({
          extra_args = {},
        }),
        null_ls.builtins.formatting.latexindent,
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}



-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.black,
--         null_ls.builtins.formatting.isort,
--         null_ls.builtins.formatting.latexindent,
--       },
--     })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       pattern = "*",
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--   end,
-- }


-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null_ls")
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.black,
--         -- {
--         --   exe = "isort",
--         --   args = { "--force-single-line-imports" },
--         --   filetypes = { "python" },
--         -- },
--         null_ls.builtins.formatting.latexindent,
--       },
--     })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       pattern = "*",
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--   end,
-- }
