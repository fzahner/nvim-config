return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		-- Manual which-key defines
		local wk = require("which-key")
		wk.add({
			-- Main marks group
			{ "m", group = "Marks" },
			{ "mx", desc = "Set mark x" },
			{ "m,", desc = "Set next available mark" },
			{ "m;", desc = "Toggle next available mark" },
			{ "m]", desc = "Move to next mark" },
			{ "m[", desc = "Move to previous mark" },
			{ "m:", desc = "Preview mark" },
			{ "m}", desc = "Next bookmark (same type)" },
			{ "m{", desc = "Previous bookmark (same type)" },
			{ "m0", desc = "Add bookmark group 0" },
			{ "m1", desc = "Add bookmark group 1" },
			{ "m2", desc = "Add bookmark group 2" },
			{ "m3", desc = "Add bookmark group 3" },
			{ "m4", desc = "Add bookmark group 4" },
			{ "m5", desc = "Add bookmark group 5" },
			{ "m6", desc = "Add bookmark group 6" },
			{ "m7", desc = "Add bookmark group 7" },
			{ "m8", desc = "Add bookmark group 8" },
			{ "m9", desc = "Add bookmark group 9" },

			-- Delete marks group
			{ "dm", group = "Delete Marks" },
			{ "dmx", desc = "Delete mark x" },
			{ "dm-", desc = "Delete all marks on current line" },
			{ "dm<space>", desc = "Delete all marks in buffer" },
			{ "dm=", desc = "Delete bookmark under cursor" },
			{ "dm0", desc = "Delete bookmark group 0" },
			{ "dm1", desc = "Delete bookmark group 1" },
			{ "dm2", desc = "Delete bookmark group 2" },
			{ "dm3", desc = "Delete bookmark group 3" },
			{ "dm4", desc = "Delete bookmark group 4" },
			{ "dm5", desc = "Delete bookmark group 5" },
			{ "dm6", desc = "Delete bookmark group 6" },
			{ "dm7", desc = "Delete bookmark group 7" },
			{ "dm8", desc = "Delete bookmark group 8" },
			{ "dm9", desc = "Delete bookmark group 9" },
		})
		require("marks").setup({
			-- whether to map keybinds or not. default true
			default_mappings = true,
			-- which builtin marks to show. default {}
			builtin_marks = { ".", "<", ">", "^" },
			refresh_interval = 250,
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
			-- sign/virttext. Bookmarks can be used to group together positions and quickly move
			-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
			-- default virt_text is "".
			bookmark_0 = {
				sign = "⚑",
				virt_text = "hello world",
				-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
				-- defaults to false.
				annotate = false,
			},
		})
	end,
}
