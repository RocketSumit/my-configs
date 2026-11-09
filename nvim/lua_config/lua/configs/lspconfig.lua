require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "marksman",
  "jsonls",
  "yamlls",
  "clangd",
  "basedpyright",
  "dockerls",
  "docker_compose_language_service",
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

-- JSON schema validation & autocompletion via SchemaStore
vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- YAML schema validation & autocompletion via SchemaStore
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

-- Enable configured servers
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
