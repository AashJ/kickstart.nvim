return {
  {
    'stevearc/oil.nvim',
    opts = {}, -- You can add your specific options here
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
      { 'christoomey/vim-tmux-navigator', lazy = false },
      -- { "nvim-tree/nvim-web-devicons" }, -- Uncomment this if you prefer nvim-web-devicons
    },
    config = function()
      require('oil').setup {
        -- Add any specific setup options here
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
          ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
          ['<C-p>'] = 'actions.preview',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
          ['<leader>\\'] = 'actions.select_vsplit',
          ['<C-c>'] = nil,
          ['<c-h>'] = '<cmd>TmuxNavigateLeft<cr>',
          ['<c-j>'] = '<cmd>TmuxNavigateDown<cr>',
          ['<c-k>'] = '<cmd>TmuxNavigateUp<cr>',
          ['<c-l>'] = '<cmd>TmuxNavigateRight<cr>',
          ['<c-\\>'] = '<cmd>TmuxNavigatePrevious<cr>',
          ['yp'] = {
            desc = 'Copy filepath to system clipboard',
            callback = function()
              require('oil.actions').copy_entry_path.callback()
              vim.fn.setreg('+', vim.fn.getreg(vim.v.register))
            end,
          },
        },
        view_options = {
          show_hidden = true,
        },
        use_default_keymaps = false,
      }
    end,
    vim.keymap.set('n', '<leader>o', ':Oil<CR>', { noremap = true, silent = true, desc = '[O]il' }),
    vim.keymap.set('n', '<leader>scd', function()
      local oil = require 'oil'
      local dir = oil.get_current_dir()

      require('telescope.builtin').live_grep {
        cwd = dir,
        prompt_title = 'Fuzzy find in Oil Directory',
      }
    end, { desc = '[S]earch in [C]urrent [D]irectory' }),
  },
}
