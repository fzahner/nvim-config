return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- configure nvim-tree
		require("nvim-tree").setup({
			view = {
				width = 40,
				side = "left",
				relativenumber = true,
			},
		})
	end,
}
