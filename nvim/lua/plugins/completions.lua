return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",

      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets/" })
    end,
  },
  {
    "micangl/cmp-vimtex",
    lazy = false,
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = { hint_enable = false, },
  --   config = function(_, opts)
  --     require 'lsp_signature'.setup(opts)
  --   end,
  -- },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "hrsh7th/cmp-path",
    lazy = false,
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    lazy = false,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      -- { "kdheepak/cmp-latex-symbols" },
    },
    lazy = false,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "vimtex" },
          { name = "nvim_lsp_signature_help" },
          -- {
          --   name = "latex_symbols",
          --   option = {
          --     strategy = 0, -- mixed
          --   },
          -- }
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
