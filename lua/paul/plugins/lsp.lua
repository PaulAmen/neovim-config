return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp'
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'ts_ls', 'eslint', 'cssls', 'html', 'jsonls', 'lua_ls', 'pyright' }
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Keymaps globales para LSP (se activan automáticamente con LspAttach)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local opts = { buffer = args.buf, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end,
    })

    -- Configuración base para todos los servidores
    vim.lsp.config['*'] = {
      capabilities = capabilities,
    }

    -- Servidores estándar
    local servers = { 'ts_ls', 'eslint', 'cssls', 'html', 'jsonls', 'pyright' }

    -- Configuración específica para lua_ls
    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
      },
    }

    -- Habilitar todos los servidores
    vim.lsp.enable(servers)
    vim.lsp.enable('lua_ls')
  end,
}
