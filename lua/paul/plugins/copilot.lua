return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",    -- Ctrl + j para aceptar (Tu preferido)
          next = "<C-Right>",  -- Ctrl + Flecha Derecha para siguiente sugerencia
          prev = "<C-Left>",   -- Ctrl + Flecha Izquierda para anterior
          dismiss = "<C-e>",   -- Ctrl + e para cancelar/ocultar sugerencia
        },
      },
      panel = { enabled = false },
    })
  end,
}
