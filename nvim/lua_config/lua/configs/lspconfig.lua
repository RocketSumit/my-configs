require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "marksman",
  "jsonls",
  "yamlls",
  "clangd",
  "basedpyright",
}

-- clangd is very chatty on stderr (build/index progress); Neovim logs all
-- LSP stderr at [ERROR], which was the main driver of a multi-GB lsp.log.
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
    "--log=error",
  },
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
})

-- Enable configured servers
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
