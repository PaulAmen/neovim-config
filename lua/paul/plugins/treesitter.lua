return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"javascript",
				"typescript",
				"json",
				"html",
				"css",
				"lua",
				"vim",
				"python",
				"bash",
				"markdown",
				"markdown_inline",
			},
			highlight = {
				enable = true,
				disable = { "latex", "tex" },
			},
			indent = { enable = true },
		})
	end,
}
