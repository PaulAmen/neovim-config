vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- General
keymap.set("i", "jk", "<ESC>", { desc = "Salir modo insert rápido" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Limpiar búsqueda" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })

-- Ventanas (Splits)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontal" })
