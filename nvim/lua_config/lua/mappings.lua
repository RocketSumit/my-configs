require "nvchad.mappings"

local map = vim.keymap.set

-- vim-tmux-navigator: override NvChad's <A-h> terminal toggle and set Alt+hjkl navigation
pcall(vim.keymap.del, { "n", "t" }, "<A-h>")
map({ "n", "t" }, "<A-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "window navigate left (tmux)", silent = true })
map({ "n", "t" }, "<A-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "window navigate down (tmux)", silent = true })
map({ "n", "t" }, "<A-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "window navigate up (tmux)", silent = true })
map({ "n", "t" }, "<A-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "window navigate right (tmux)", silent = true })

-- Custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "kj", "<ESC>", { desc = "Escape insert mode" })
map("x", "L", "g_", { desc = "Jump to end of line" })

-- Telescope custom alias (<leader>fw is also available via NvChad)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })

-- Git: LazyGit floating terminal via NvChad native terminal
map("n", "<leader>lg", function()
  require("nvchad.term").toggle { pos = "float", id = "lazygit", cmd = "lazygit" }
end, { desc = "git lazygit" })
