# Neovim config (NvChad-based)

Personal Neovim setup built on top of [NvChad](https://github.com/NvChad/NvChad).
NvChad's core (`nvchad.options`, `nvchad.mappings`, `nvchad.autocmds`, and its
default plugin set) is pulled in as a plugin via `lazy.nvim`; everything in
this repo layers custom plugins, LSP servers, formatters and keymaps on top.

- `init.lua` — bootstraps `lazy.nvim` and loads NvChad + this repo's plugins
- `lua/options.lua` — `vim.opt` settings (loads `nvchad.options` first)
- `lua/mappings.lua` — custom keymaps (loads `nvchad.mappings` first)
- `lua/chadrc.lua` — NvChad UI config (theme, etc.)
- `lua/plugins/init.lua` — this repo's plugin specs
- `lua/configs/` — per-plugin config modules (`conform`, `lspconfig`, `lazy`)

## Setup

1. **Requirements**
   - Neovim >= 0.11 (uses the native `vim.lsp.config` / `vim.lsp.enable` API)
   - `git`
   - A [Nerd Font](https://www.nerdfonts.com/) in your terminal (icons)
   - `ripgrep` and `fd` (Telescope file/grep search)
   - `node` + `npm` (for `prettier`, LSP servers installed via Mason)
   - A C compiler (`make`/`gcc`) for Treesitter parsers and `clangd`

2. **Install**
   ```sh
   git clone <this-repo-url> ~/.config/nvim
   nvim
   ```
   On first launch, `lazy.nvim` bootstraps itself and installs every plugin
   automatically. Wait for the install popup to finish, then restart nvim.

3. **LSP servers / formatters**
   Mason installs these automatically on first launch (`lua/plugins/init.lua`):
   `pyright`, `clangd`, `yaml-language-server`, `json-lsp`, `marksman`,
   `lua-language-server`, `stylua`, `html-lsp`, `css-lsp`, `prettier`.
   Run `:Mason` to check status or add more.

4. **Keeping it up to date**
   - `:Lazy sync` — update all plugins and prune anything no longer declared
   - `:Mason` → `U` — update LSP servers/formatters
   If `:Lazy sync` reports a plugin has "local changes" it can't reconcile
   (usually build artifacts left behind, e.g. LuaSnip's `deps/jsregexp`),
   remove that plugin's folder under `~/.local/share/nvim/lazy/<plugin>` and
   reinstall with `:Lazy install`.

## Keybindings cheatsheet

Leader key is `,` (comma), set in `lua/options.lua`. `<leader>ch` opens
NvChad's own searchable cheatsheet (`:NvCheatsheet`) inside nvim; the list
below covers this config's most-used bindings.

### General

| Key | Mode | Action |
|---|---|---|
| `;` | n | Enter command mode (`:`) |
| `jk` / `kj` | i | Escape insert mode |
| `L` | v | Jump to end of line (excl. trailing whitespace) |
| `<C-s>` | n | Save file |
| `<C-c>` | n | Copy whole file to clipboard |
| `<Esc>` | n | Clear search highlight |
| `<leader>n` | n | Toggle line numbers |
| `<leader>rn` | n | Toggle relative line numbers |
| `<leader>ch` | n | Open NvChad cheatsheet |
| `<leader>/` | n, v | Toggle comment |

### Windows & buffers

| Key | Mode | Action |
|---|---|---|
| `<C-h/j/k/l>` | n | Move focus between splits |
| `<Tab>` / `<S-Tab>` | n | Next / previous buffer |
| `<leader>b` | n | New empty buffer |
| `<leader>x` | n | Close current buffer |

### Jump motion — [flash.nvim](https://github.com/folke/flash.nvim)

Replaces the old `vim-easymotion` setup. Native `F`/`t`/`T`/`;`/`,` are left
as plain vim (flash's own auto-hijack of those is disabled in
`lua/plugins/init.lua`); only `f`/`s` are repurposed:

| Key | Mode | Action |
|---|---|---|
| `f` | n, x, o | Flash jump — current window, type chars, press the label to jump |
| `s` | n, x, o | Flash jump — across all visible windows |

### File explorer — nvim-tree

| Key | Mode | Action |
|---|---|---|
| `<C-n>` | n | Toggle file tree |
| `<leader>e` | n | Focus file tree |

Opening nvim directly on a directory (`nvim .`) auto-opens the tree
(`hijack_directories`, forced eager-load in `lua/plugins/init.lua`).

### Fuzzy finder — Telescope

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files (incl. hidden/ignored) |
| `<leader>fg` | Live grep *(custom, same as NvChad's `<leader>fw`)* |
| `<leader>fw` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Search help tags |
| `<leader>fo` | Recently opened files |
| `<leader>fz` | Fuzzy find in current buffer |
| `<leader>ma` | Find marks |
| `<leader>cm` | Git commits |
| `<leader>gt` | Git status |
| `<leader>th` | Pick colorscheme |

### Git

| Key | Action |
|---|---|
| `<leader>lg` | Open LazyGit |

Gitsigns is enabled for gutter change markers only (no custom hunk keymaps
configured).

### LSP (active once a server attaches)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `<leader>D` | Go to type definition |
| `<leader>ra` | Rename symbol |
| `<leader>ds` | Diagnostics list |
| `<leader>wa` / `<leader>wr` / `<leader>wl` | Add / remove / list workspace folders |
| `<leader>fm` | Format file ([conform.nvim](https://github.com/stevearc/conform.nvim), formatters in `lua/configs/conform.lua`) |

Neovim 0.11+ also ships built-in LSP defaults on top of these: `K` (hover),
`grn` (rename), `gra` (code action), `grr` (references), `gri`
(implementation), `gO` (document symbols).

### Terminal

| Key | Action |
|---|---|
| `<leader>h` | New horizontal terminal |
| `<leader>v` | New vertical terminal |
| `<A-h>` | Toggle horizontal terminal |
| `<A-v>` | Toggle vertical terminal |
| `<A-i>` | Toggle floating terminal |
| `<C-x>` | Escape terminal mode |

### Which-key

| Key | Action |
|---|---|
| `<leader>wK` | Show all keymaps |
| `<leader>wk` | Query a specific keymap |
