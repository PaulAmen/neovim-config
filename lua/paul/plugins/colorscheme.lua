return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Prioridad alta para que el tema se cargue antes que la UI
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Puedes cambiarlo a "latte", "frappe" o "macchiato"
      term_colors = true,
      integrations = {
        treesitter = false, -- Desactivamos la dependencia de treesitter
      },
    })    
    -- Habilitar la sintaxis clásica y aplicar el tema
    vim.cmd("syntax enable")
    vim.cmd.colorscheme("catppuccin")
  end,
}
