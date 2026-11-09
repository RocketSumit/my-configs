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
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- NvChad/NvChad already declares and configures "mason-org/mason.nvim"
  -- (nvchad.configs.mason, with theme-matching icons); no need to
  -- redeclare it here.
  --
  -- mason.nvim itself has no `ensure_installed` option, so the list below
  -- was previously silently ignored and nothing but a stray pre-existing
  -- `pyright` install ever got installed. This plugin actually installs
  -- missing tools on startup.
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    -- must load before VimEnter fires: it registers its own VimEnter
    -- autocmd to trigger installs, so lazy-loading on an event that
    -- fires after VimEnter (e.g. VeryLazy) means that autocmd never runs
    lazy = false,
    opts = {
      ensure_installed = {
        "basedpyright", -- Python LSP
        "ruff", -- Python linter / formatter
        "black", -- Python formatter (fallback)
        "clangd", -- C/C++ LSP
        "clang-format", -- C/C++ formatter
        "yaml-language-server", -- YAML LSP
        "json-lsp", -- JSON LSP
        "marksman", -- Markdown LSP
        "lua-language-server", -- Lua LSP
        "stylua", -- Lua Formatter
        "html-lsp", -- HTML LSP
        "css-lsp", -- CSS LSP
        "prettier", -- Prettier Formatter
      },
    },
  },

  -- Flash: fast jump motions (replaces vim-easymotion), lazy-loaded on keypress
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- disable native f/F/t/T hijacking so it doesn't override our
      -- own `f`/`s` keymaps below with unlabeled single-char jumps
      modes = { char = { enabled = false } },
    },
    keys = {
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump { search = { multi_window = false } }
        end,
        desc = "Flash jump (current window)",
      },
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump (all windows)",
      },
    },
  },

  -- Load nvim-tree at startup so it can hijack directory buffers
  -- (NvChad's default spec only lazy-loads on NvimTreeToggle/Focus,
  -- so its own auto-open-on-directory autocmd never gets registered)
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
  },

  -- Highlight the active window border with a color
  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinNew" },
    opts = {
      highlight = nil,
      border = "single",
      excluded_ft = { "packer", "TelescopePrompt", "mason", "CompeDocumentation", "noice" },
    },
  },

  -- vim-tmux-navigator: seamless Alt+hjkl navigation between nvim splits and tmux panes
  -- keymaps are set in mappings.lua to run after nvchad.mappings
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
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
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "c",
        "cpp",
        "python",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
      },
    },
  },
}
