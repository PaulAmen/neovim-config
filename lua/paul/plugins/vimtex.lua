return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Visor de PDF
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "chromium"
    
    -- Motor de compilación
    vim.g.vimtex_compiler_method = "latexmk"
    
    -- Ocultar advertencias menores
    vim.g.vimtex_quickfix_mode = 0

    -- Tabla completa para asegurar el ciclo continuo y forzar la compilación
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-f", -- CRÍTICO: Fuerza a latexmk a continuar aunque el primer paso falle
      },
    }
  end,
}
