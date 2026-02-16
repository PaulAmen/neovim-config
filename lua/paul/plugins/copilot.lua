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
				-- Prompt específico para Commits en Español
				Commit = {
					prompt = "> #git:staged\n\nEscribe un mensaje de commit para los cambios en stage. Usa el formato Conventional Commits (feat, fix, chore, etc). Escribe el título y la descripción en ESPAÑOL.",
				},
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			-- Atajo: <leader>cc (Commit Copilot)
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
		end,
	},
}
