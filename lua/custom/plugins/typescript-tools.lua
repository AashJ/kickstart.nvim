return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        settings = {
          -- Spawn additional tsserver instance to calculate diagnostics on it
          separate_diagnostic_server = true,
          -- Determine when the client asks the server about diagnostic
          publish_diagnostic_on = 'insert_leave',
          -- Expose certain commands as code actions
          expose_as_code_action = {},
          -- tsserver_file_preferences and tsserver_format_options
          tsserver_file_preferences = {
            includeInlayParameterNameHints = 'all',
            includeCompletionsForModuleExports = true,
            quotePreference = 'auto',
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
        },
      }
    end,
  },
}
