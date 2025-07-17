return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {},
  event = 'VeryLazy',
  keys = {
    { '<leader>psv', '<cmd>VenvSelect<cr>', desc = '[P]ython [S]elect [V]irtual environment' },
    { '<leader>psc', '<cmd>VenvSelectCached<cr>', desc = '[P]ython [S]elect [C]ache' },
  },
}
