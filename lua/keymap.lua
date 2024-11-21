--------- general idea of key mapping: --------

-- Define group names
local wk = require("which-key")
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "Find" },
	{ "<leader>w", group = "Window" },
	{ "<leader>e", group = "Explorer" },
	-- TODO: { "<leader>t", group = "Tabs" },
	{ "<leader>p", group = "Editor settings" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>x", group = "Trouble.nvim" },
	{ "<leader>c", group = "File Specific" },
})

-----------------------------------------------

-- set leader key to space
vim.g.mapleader = " "
local map = vim.keymap.set

-- encourage hjkl keys
local function warn_arrow_key()
	print("Use hjkl instead!")
end

vim.keymap.set("", "<Up>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Down>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Left>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Right>", warn_arrow_key, { desc = "Discourage arrow key use" })

-- Custom Vim Commands
map("n", "o", "o<Esc>", { noremap = true, silent = true, desc = "Insert line above without entering Editor mode" })
map(
	"n",
	"O",
	"0i<CR><Esc>k",
	{ noremap = true, silent = true, desc = "Insert line below without entering Editor mode" }
)

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "nvimtree close" })

-- terminal
map("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>wt", "<cmd>:ToggleTerm direction=horizontal<CR>", { desc = "New horizontal terminal" })
map("n", "<leader>ws", "<cmd>:ToggleTerm direction=vertical<CR>", { desc = "New vertical terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

-- windows & window navigation
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>wx", ":close<CR>", { desc = "Close current splitted window" })

map("n", "<leader>w0", "<C-w>=", { desc = "Reset splitted window width / height" })

map("n", "<leader>w1", ":vertical resize +10<CR>", { desc = "Increase width of splitted window" })
map("n", "<leader>w2", ":vertical resize -10<CR>", { desc = "Decrease width of splitted window" })
map("n", "<leader>w3", ":resize +5<CR>", { desc = "Increase height of splitted window" })
map("n", "<leader>w4", ":resize -5<CR>", { desc = "Decrease height of splitted window" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- buffer navigation navigation
map("n", "<leader>bb", ":enew<CR>", { desc = "Open new buffer" })
map("n", "<leader>bx", ":bp|bd #<CR>", { desc = "Close buffer", silent = true })
map("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
map("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "Close all buffers to the right" })
map("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left" })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true }) -- Go to next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true }) -- To go previous buffer

-- editor settings
map("n", "<leader>pw", ":set wrap!<CR>", { desc = "Toggle line wrapping" })
map("n", "<leader>pt", "<cmd>Themery<CR>", { desc = "Change theme" })
map("n", "<leader>pn", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>pr", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
local function toggle_shiftwidth()
	if vim.o.shiftwidth == 4 then
		vim.o.shiftwidth = 2
		vim.o.smarttab = true
		print("Switched to shiftwidth=2 with smarttab")
	else
		vim.o.shiftwidth = 4
		vim.o.smarttab = true
		print("Switched to shiftwidth=4 with smarttab")
	end
end
map("n", "<leader>ps", toggle_shiftwidth, { desc = "Toggle Tabwidth" })

-- Git
map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "Open lazy git" }) -- also configured with plugin

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>gm", "<cmd>Telescope notifications<CR>", { desc = "telescope git status" })

-- File Specific
map("n", "<leader>cf", "<cmd>Format<CR>", { desc = "Format file" })
map("n", "<leader>cF", "<cmd>FormatWrite<CR>", { desc = "Format and Save file" })

-- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
