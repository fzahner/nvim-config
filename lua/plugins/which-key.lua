return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic", -- modern, helix, classic
		win = {
			padding = { 1, 2 },
		},
		triggers = {
			{ "<auto>", mode = "nixo" },
			-- Custom triggers for marks
			{ "m", mode = "n" },
		},
	},
}
