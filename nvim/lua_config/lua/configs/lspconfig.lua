require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "html",
  "cssls",
  "lua_ls",
  "marksman",
  "jsonls",
  "yamlls",
  "clangd",
  "basedpyright",
}

-- Default configs
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })

  vim.lsp.enable(server)
end

-- clangd is very chatty on stderr (build/index progress); Neovim logs all
-- LSP stderr at [ERROR], which was the main driver of a multi-GB lsp.log.
vim.lsp.config("clangd", {
  cmd = { "clangd", "--log=error" },
})
