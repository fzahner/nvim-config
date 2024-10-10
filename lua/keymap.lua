--------- general idea of key mapping: --------
-- g: Git
-- f: Find
-- w: Window
-- e: Explorer
-- t: Tabs
-- b: Buffers
-- p: Editor settings

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
})

-----------------------------------------------

-- set leader key to space
vim.g.mapleader = " "
local map = vim.keymap.set 


-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "nvimtree close" })

-- terminal
map("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- windows & window navigation
map("n", "<leader>wt", "<cmd>split | term fish<CR>", { desc = "New horizontal terminal"})
map("n", "<leader>ws", "<cmd>vsplit | term fish<CR>", { desc = "New vertical terminal"})
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
map("n", "<leader>bx", ":bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
map("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "Close all buffers to the right" })
map("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left" })
map("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Go to next buffer
map("n", "<C-Tab>", ":BufferLineCyclePrev<CR>") -- To go previous buffer

-- editor settings
map("n", "<leader>pw", ":set wrap!<CR>", { desc = "Toggle line wrapping" })
map("n", "<leader>pt", "<cmd>Themery<CR>", { desc = "Change theme" })
map("n", "<leader>pn", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>pr", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Git
map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "Open lazy git" }) -- also configured with plugin


-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })