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

-- Docker: LazyDocker floating terminal via NvChad native terminal
map("n", "<leader>ld", function()
  require("nvchad.term").toggle { pos = "float", id = "lazydocker", cmd = "lazydocker" }
end, { desc = "docker lazydocker" })

-- C++: Switch between Header and Source (.hpp <-> .cpp)
map("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "switch header / source" })
map("n", "<leader>sh", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "switch header / source" })

-- LSP: Toggle Inlay Hints
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP toggle inlay hints" })

-- CMake: build system actions
map("n", "<leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "CMake generate / configure" })
map("n", "<leader>cb", "<cmd>CMakeBuild<cr>", { desc = "CMake build target" })
map("n", "<leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake run target" })
map("n", "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>", { desc = "CMake select target" })
