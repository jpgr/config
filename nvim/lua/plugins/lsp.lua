return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "lemminx" }
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.lemminx.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', '<leader>ci', vim.lsp.buf.hover, { desc = 'hover info' })
      vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'go to definition' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action' })
      vim.keymap.set('n', '<leader>cv', vim.diagnostic.open_float, { desc = 'diagnostics' })
    end
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('null-ls').setup({})
      vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'code format' })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      ensure_installed = { 'stylua' },
    }
  }
}
