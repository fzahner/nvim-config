return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		vim.keymap.set({ "i" }, "<A-k>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i" }, "<A-j>", function()
			ls.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		-------------- Custom snippets --------------

		--- class/className completion (HTML, JS)
		ls.add_snippets("html", {
			ls.snippet({
				trig = "%.([%w-]+)",
				regTrig = true,
				name = "div with dynamic class",
				dscr = "Create a div with dynamic class",
			}, {
				ls.function_node(function(_, snip)
					return string.format('<div class="%s">', snip.captures[1])
				end),
				ls.insert_node(0),
				ls.text_node({ "</div>" }),
			}),
		})
		-- TODO: add custom snippets
		-- TODO: allow html snippets in jsx/tsx files
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
