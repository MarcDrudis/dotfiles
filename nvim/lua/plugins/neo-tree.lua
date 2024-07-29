return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {

        {
          event = "file_opened",
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },

      },
      filesystem = {
        filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true, },
        commands = {
          -- Override delete to use trash instead of rm
          delete = function(state)
            local path = state.tree:get_node().path
            vim.fn.system({ "trash", vim.fn.fnameescape(path) })
            require("neo-tree.sources.manager").refresh(state.name)
          end,
        },
        -- commands = {
        --   -- Override delete to use trash instead of rm
        --   delete = function(state)
        --     local path = state.tree:get_node().path
        --     vim.fn.system({ "trash", vim.fn.fnameescape(path) })
        --   end,
        -- },
      }

    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
  end
}
