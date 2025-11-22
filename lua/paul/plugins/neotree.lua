return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Iconos de carpetas/archivos
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Cierra nvim si solo queda el árbol abierto
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			-- Apariencia visual
			default_component_configs = {
				indent = {
					with_expanders = true, -- Agrega flechitas > para carpetas
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},

			window = {
				position = "right", -- Panel a la izquierda
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["l"] = "open", -- Abrir carpeta/archivo con 'l'
					["h"] = "close_node", -- Cerrar carpeta con 'h'
					["<space>"] = "none", -- Desactivar espacio para evitar conflictos
				},
			},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true, -- El árbol se mueve a donde estés editando
				},
			},
		})

		-- ATAJO DE TECLADO: Espacio + e
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorador de Archivos" })
	end,
}
