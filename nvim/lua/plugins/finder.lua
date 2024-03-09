return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      "debugloop/telescope-undo.nvim"
    },
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
          undo = {}
        }
      }
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("undo")
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', "<cmd> lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", { desc = 'find file' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'find buffer' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find help' })
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'find treesitter' })
      vim.keymap.set('n', '<leader>fu', "<cmd>Telescope undo<cr>", { desc = 'Undo tree' })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["P"] = "nop",
            ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          }
        },
        event_handlers = {
          {
            event = "file_opened",
            ---@diagnostic disable-next-line: unused-local
            handler = function(file_path)
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      })
      vim.keymap.set('n', '<C-p>', ':Neotree toggle source=filesystem reveal=true position=left<CR>',
        { desc = 'file tree' })
    end
  },
}
