return {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim", -- optional
  config = function()
    vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)

    -- When used in visual mode prefills the selection as body.
    vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)
    require("scissors").setup {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
      editSnippetPopup = {
        height = 0.4, -- relative to the window, number between 0 and 1
        width = 0.6,
        border = "rounded",
        keymaps = {
          cancel = "q",
          saveChanges = "<CR>", -- alternatively, can also use `:w`
          goBackToSearch = "<BS>",
          deleteSnippet = "<C-BS>",
          duplicateSnippet = "<C-d>",
          openInFile = "<C-o>",
          insertNextToken = "<C-t>",     -- insert & normal mode
          jumpBetweenBodyAndPrefix = "<C-Tab>", -- insert & normal mode
        },
      },
      telescope = {
        -- By default, the query only searches snippet prefixes. Set this to
        -- `true` to also search the body of the snippets.
        alsoSearchSnippetBody = false,
      },
      -- `none` writes as a minified json file using `vim.encode.json`.
      -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
      -- you version control your snippets.
      jsonFormatter = "none", -- "yq"|"jq"|"none"
    }
  end
}
