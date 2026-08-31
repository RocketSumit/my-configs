return {
  {
    "stevearc/conform.nvim",
    event = { "LspAttach", "BufReadPost", "BufNewFile" },
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Markdown render
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- Mason for LSP and Tools Management
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    opts = {
      ensure_installed = {
        "pyright", -- Python
        "clangd", -- C++
        "yaml-language-server", -- YAML
        "json-lsp", -- JSON
        "marksman", -- Markdown
        "lua-language-server", -- Lua
        "stylua", -- Lua Formatter
        "html-lsp", -- HTML
        "css-lsp", -- CSS
        "prettier", -- Prettier Formatter
      },
    },
  },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- Easy motion
  {
    "easymotion/vim-easymotion",
    tag = "v3.0.1",
    lazy = false,
    config = function()
      -- EasyMotion settings
      vim.g.EasyMotion_do_mapping = 0
      vim.g.EasyMotion_smartcase = 1
      vim.g.EasyMotion_use_upper = 1
      vim.g.EasyMotion_keys = "SADFJKLEWCMPGH"
      vim.g.EasyMotion_use_smartsign_us = 1

      -- Key mappings for EasyMotion
      -- Move to character
      vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-bd-w)", {})

      -- `s{char}{char}{label}` for easier two-character motion
      vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", {})

      -- Line motions with 'j' and 'k'
      vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-j)", {})
      vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-k)", {})
    end,
  },

  -- Codium - Auto Complete
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require "configs/codeium"
    end,
  },

  -- Lazy Git
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      require("telescope").load_extension "lazygit"
      vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
      vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
      vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

      vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
      vim.g.lazygit_config_file_path = "" -- custom config file path
      -- OR
      vim.g.lazygit_config_file_path = {} -- table of custom config file paths
    end,
  },

  -- Load nvim-tree at startup so it can hijack directory buffers
  -- (NvChad's default spec only lazy-loads on NvimTreeToggle/Focus,
  -- so its own auto-open-on-directory autocmd never gets registered)
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
  },

  -- Smooth scroll
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    opts = {
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb",
      },

      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      duration_multiplier = 1.0,
      easing = "linear",
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,

      ignored_events = {
        "WinScrolled",
        "CursorMoved",
      },
    },
  },
}
