return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Configura Chromium como visor de PDF
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "chromium"
    
    -- Usa latexmk para compilar automáticamente
    vim.g.vimtex_compiler_method = "latexmk"
    
    -- Oculta la ventana emergente de advertencias menores
    vim.g.vimtex_quickfix_mode = 0
  end,
}
