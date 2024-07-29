return {
  -- {
  --   'anufrievroman/vim-angry-reviewer',
  --   config = function()
  --
  --   end
  -- },
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- add which-key mapping descriptions for VimTex
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Set up VimTex Which-Key descriptions",
        group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
        pattern = "tex",
        callback = function(event)
          vim.cmd("set textwidth=80")
        end,

      })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown" },
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = { "latex", "markdown" },
        },
        --other treesitter settings
      })
      -- PDF Viewer:
      -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
      vim.g['vimtex_view_method'] = 'zathura'
      vim.g['vimtex_quickfix_mode'] = 0

      -- Ignore mappings
      vim.g['vimtex_mappings_enabled'] = 1

      -- Auto Indent
      vim.g['vimtex_indent_enabled'] = 1


      -- Syntax highlighting
      vim.g['vimtex_syntax_enabled'] = 1

      -- Error suppression:
      -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

      vim.g['vimtex_log_ignore'] = ({
        'Underfull',
        'Overfull',
        'specifier changed to',
        'Token not allowed in a PDF string',
      })

      vim.g['vimtex_context_pdf_viewer'] = 'okular'

      vim.g['vimtex_complete_enabled'] = 1
      -- vim.g['vimtex_compiler_progname'] = 'nvr'
      -- vim.g['vimtex_complete_close_braces'] = 1

      -- require('cmp_vimtex').setup({
      --   additional_information = {
      --     info_in_menu = true,
      --     info_in_window = true,
      --     info_max_length = 60,
      --     match_against_info = true,
      --     symbols_in_menu = true,
      --   },
      --   bibtex_parser = {
      --     enabled = true,
      --   },
      -- })
    end,
  } }
