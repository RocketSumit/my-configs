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

  -- Smooth scroll
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },

  -- Windsurf plugin
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
  },
  -- avante agentic ai
  {
    "yetone/avante.nvim",
    lazy = "true",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- for example
      provider = "ollama",
      providers = {
        ollama = {
          endpoint = "http://localhost:11434",
          model = "qwen3:32b",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
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
            -- required for Windows users
            use_absolute_path = true,
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
  },
}
