return {
  -- {
  --   "wincent/base16-nvim",
  --   lazy = false,  -- load at start
  --   priority = 1000, -- load first
  --   config = function()
  --     vim.cmd([[colorscheme base16-default-dark]])
  --     vim.o.background = 'dark'
  --   end
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("everforest").setup({})
  --     -- vim.cmd [[colorscheme everforest]]
  --   end
  -- },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
      vim.cmd [[colorscheme nordic]]
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'nordic',
      },
    }
  },
}
