return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	build = "make",
	opts = {
		provider = "ollama",
		providers = {
			ollama = {
				endpoint = "http://localhost:11434",
				model = "qwen2.5-coder:0.5b",
			},
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	config = function()
		-- Function which allows switching of ollama model
		local function switch_ollama_model()
			local models = {
				{ name = "Local fast Qwen2", endpoint = "http://localhost:11434", model = "qwen2.5-coder:0.5b" },
				{ name = "Local GPT-OSS 20B", endpoint = "http://localhost:11434", model = "gpt-oss:20b" },
				-- TODO	{ name = "Remote Powerful", endpoint = "http://192.168.1.100:11434", model = "gpt-oss:120b" },
			}

			vim.ui.select(models, {
				prompt = "Select Ollama Model:",
				format_item = function(item)
					return item.name
				end,
			}, function(choice)
				if choice then
					require("avante.config").override({
						providers = {
							ollama = {
								endpoint = choice.endpoint,
								model = choice.model,
							},
						},
					})
					print("Switched to: " .. choice.name)
				end
			end)
		end

		-- vim.keymap.set("n", "<leader>am", switch_ollama_model, { desc = "Switch Avante model" })
	end,
}
