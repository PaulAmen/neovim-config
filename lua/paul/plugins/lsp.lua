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

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Función que se ejecuta cuando un servidor LSP se conecta al buffer
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end

    -- Configuración de servidores
    local servers = { 'ts_ls', 'eslint', 'cssls', 'html', 'jsonls', 'pyright' }

    -- Bucle para servidores estándar
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Configuración MANUAL para Lua (corrige el error de 'vim global')
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
      },
    })
  end,
}
