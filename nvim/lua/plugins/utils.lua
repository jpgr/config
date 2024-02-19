return {
  { "ThePrimeagen/vim-be-good" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 150
      require('which-key').register {
        ['<leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
      }
    end,
    opts = {}
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = '│'
      }
    }
  }
}
