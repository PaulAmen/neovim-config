return {
  'mhartington/formatter.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('formatter').setup({
      filetype = {
        javascript = { require('formatter.filetypes.javascript').prettier },
        typescript = { require('formatter.filetypes.typescript').prettier },
        json = { require('formatter.filetypes.json').prettier },
        lua = { require('formatter.filetypes.lua').stylua },
      },
    })
    
    -- Autoformato al guardar
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*',
      command = 'FormatWrite'
    })
  end,
}
