return {
	-- 1. Esquema de Colores (Híbrido: Código transparente, UI Sólida)
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = false, -- El fondo principal sigue siendo transparente
				terminal_colors = true,
				styles = {
					-- Aquí está el truco: cambiamos "transparent" por "dark"
					sidebars = "dark", -- El árbol de carpetas tendrá fondo oscuro
					floats = "dark", -- Las ventanas de ayuda/autocompletado tendrán fondo oscuro
				},
				-- Opcional: Oscurecer un poco el fondo transparente (simulación)
				-- Tokyonight permite 'dim_inactive' para ventanas no activas
				dim_inactive = true,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	-- 2. Barra de estado estilo "Bubble" (Similar a tu prompt)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Definimos un estilo personalizado "Burbuja"
			local custom_theme = require("lualine.themes.tokyonight")

			-- Hacemos que el fondo de la barra sea transparente también
			custom_theme.normal.c.bg = "None"

			require("lualine").setup({
				options = {
					theme = custom_theme,
					component_separators = "",
					section_separators = { left = "", right = "" }, -- Bordes redondos
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "filename", "branch" },
					lualine_c = {
						"%=", -- Esto centra lo que sigue
						-- Llama a la función pero con icono o estilo si quieres
					},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- 3. Iconos mejorados (Opcional pero recomendado)
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
