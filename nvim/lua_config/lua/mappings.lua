require "nvchad.mappings"

-- vim-tmux-navigator: override NvChad's <A-h> terminal toggle and set Alt+hjkl navigation
pcall(vim.keymap.del, { "n", "t" }, "<A-h>")
vim.keymap.set({ "n", "t" }, "<A-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<A-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<A-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set({ "n", "t" }, "<A-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true })

-- add yours here
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
vim.api.nvim_set_keymap("v", "L", "g_", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
