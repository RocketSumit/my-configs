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

-- Helper to open interactive TUIs (lazygit, lazydocker) in a floating window
-- that closes automatically when exiting the TUI (e.g. via 'q')
local function open_tui(cmd, title, on_close)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
    title = title and (" " .. title .. " ") or nil,
    title_pos = "center",
  })

  vim.bo[buf].bufhidden = "wipe"

  vim.fn.termopen(cmd, {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      if on_close then
        on_close()
      end
    end,
  })

  vim.cmd "startinsert"
end

-- Git: LazyGit floating terminal
map("n", "<leader>lg", function()
  open_tui("lazygit", "LazyGit", function()
    pcall(function()
      require("gitsigns").refresh()
    end)
  end)
end, { desc = "git lazygit" })

-- Docker: LazyDocker floating terminal
map("n", "<leader>ld", function()
  open_tui("lazydocker", "LazyDocker")
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
