local opt = vim.opt

-- Números de línea
opt.relativenumber = true
opt.number = true

-- Tabulación e Indentación
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- === AQUÍ ESTÁ EL CAMBIO ===
opt.wrap = true          -- ACTIVADO: Las líneas largas bajan
opt.linebreak = true     -- No corta palabras a la mitad, baja la palabra completa
opt.breakindent = true   -- Mantiene la indentación visual en la línea que baja
opt.showbreak = "↳ "     -- Pone un pequeño icono para indicar que es continuación
-- ===========================

opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8 
opt.signcolumn = "yes"

-- Sistema
opt.swapfile = false
opt.backup = false
opt.clipboard = "unnamedplus"
