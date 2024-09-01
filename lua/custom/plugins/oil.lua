return {
  {
    'stevearc/oil.nvim',
    opts = {}, -- You can add your specific options here
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
      -- { "nvim-tree/nvim-web-devicons" }, -- Uncomment this if you prefer nvim-web-devicons
    },
    config = function()
      require('oil').setup {
        -- Add any specific setup options here
        keymaps = {
          ['<leader>\\'] = 'actions.select_vsplit',
          ['<C-l>'] = function()
            vim.cmd 'wincmd l'
          end,
          ['<C-h>'] = function()
            vim.cmd 'wincmd h'
          end,
          ['<C-j>'] = function()
            vim.cmd 'wincmd j'
          end,
          ['<C-k>'] = function()
            vim.cmd 'wincmd k'
          end,
        },
      }
    end,
    vim.keymap.set('n', '<leader>e', ':Oil<CR>', { noremap = true, silent = true }),
    view_options = {
      show_hidden = true,
    },
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
