return {
	"ggandor/leap.nvim",
	lazy = false,
	config = function()
		local leap = require("leap")
		leap.setup({
			equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" },
		})
		leap.add_default_mappings()

		require("leap.user").set_repeat_keys("<enter>", "<backspace>")

		leap.opts.preview_filter = function(ch0, ch1, ch2)
			return not (ch1:match("%s") or ch0:match("%a") and ch1:match("%a") and ch2:match("%a"))
		end
	end,
}
