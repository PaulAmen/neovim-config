return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-j>", -- Mantenemos tu Ctrl + j
						next = "<C-Right>", -- Mantenemos tu Ctrl + Flecha Derecha
						prev = "<C-Left>", -- Mantenemos tu Ctrl + Flecha Izquierda
						dismiss = "<C-e>", -- Mantenemos tu Ctrl + e
					},
				},
				panel = { enabled = false },
				-- AÑADIDO: Asegurar explícitamente la activación en LaTeX
				filetypes = {
					markdown = true,
					tex = true,
					latex = true,
					["."] = false,
				},
			})
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- Depende del plugin de arriba
			{ "nvim-lua/plenary.nvim" }, -- Librería de utilidades estándar
		},
		build = "make tiktoken", -- Optimización para Arch
		opts = {
			show_help = "yes",
			prompts = {
				-- Tu prompt original para Commits
				Commit = {
					prompt = "> #git:staged\n\nEscribe un mensaje de commit para los cambios en stage. Usa el formato Conventional Commits (feat, fix, chore, etc). Escribe el título y la descripción en ESPAÑOL.",
				},
				-- AÑADIDO: Prompt para revisar redacción doctoral
				TesisRevisar = {
					prompt = "> /COPILOT_GENERATE\n\nActúa como un revisor académico estricto. Revisa el texto seleccionado de mi investigación doctoral. Mejora la claridad, el vocabulario técnico y asegura un tono formal en ESPAÑOL, manteniendo el sentido original de mis ideas.",
				},
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			-- Atajo original: <leader>cc (Commit Copilot)
			vim.keymap.set("n", "<leader>cc", function()
				chat.open({
					window = {
						layout = "float",
						title = " Generando Commit... ",
						width = 0.8,
						height = 0.6,
					},
				})
				-- Forzar la ejecución inmediata del comando Commit configurado arriba
				vim.cmd("CopilotChatCommit")
			end, { desc = "Copilot: Generar mensaje de commit" })

			-- AÑADIDO: Atajo visual <leader>cr para revisar párrafos de la tesis
			vim.keymap.set("v", "<leader>cr", function()
				chat.open({
					window = {
						layout = "float",
						title = " Revisión Académica... ",
						width = 0.8,
						height = 0.6,
					},
				})
				vim.cmd("CopilotChatTesisRevisar")
			end, { desc = "Copilot: Revisar redacción de tesis (Visual)" })
		end,
	},
}
