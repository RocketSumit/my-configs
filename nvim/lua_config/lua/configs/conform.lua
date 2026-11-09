local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "ruff_fix", "ruff_format" },
    javascript = { "prettier" },
    markdown = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    cmake = { "gersemi" },
    yaml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_format = "fallback",
  },
}

return options
