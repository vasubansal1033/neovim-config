# Neovim config setup

Place this inside `~/.config/nvim/`

## Requirements

- Neovim **0.11+** (LSP setup uses `vim.lsp.config`/`vim.lsp.enable`, native API added in 0.11)
- `git` (plugin installs/updates)
- `ripgrep` (Telescope live grep)
- A C compiler (treesitter parser builds)
- Node.js (needed by some LSP servers, e.g. `ts_ls`, `html`)

Check your version: `nvim --version`. On macOS: `brew upgrade neovim`.

## Plugin manager: lazy.nvim

Plugins live under `lua/plugins/`, one file per plugin (or group). `lazy.nvim` bootstraps itself on first launch (see `init.lua`).

Open the plugin manager UI:

```
:Lazy
```

Useful keys inside `:Lazy`:

| Key | Action |
|-----|--------|
| `S` | Sync — install missing, update, clean removed |
| `U` | Update installed plugins |
| `X` | Clean plugins no longer in config |
| `R` | Restore to versions in `lazy-lock.json` |
| `L` | View log |

**Run `:Lazy sync` periodically** (weekly-ish) to keep plugins current. `lazy-lock.json` pins exact commits — commit that file to git so config stays reproducible across machines.

## LSP

`lua/plugins/lsp.lua` sets up `mason.nvim` + `mason-lspconfig.nvim` + `nvim-lspconfig`. Servers listed in `ensure_installed` are installed automatically and enabled via `vim.lsp.enable()`.

Current servers: `lua_ls`, `clangd`, `elixirls`, `html`, `ts_ls` (matches languages in `neovim-treesitter.lua`).

Add a language:
1. Add its parser to `ensure_installed` in `lua/plugins/neovim-treesitter.lua`
2. Add its LSP server name to `ensure_installed` in `lua/plugins/lsp.lua`
3. Restart nvim — Mason installs it in the background

### Using an installed server

Two ways to get a server installed, both end up working with no extra config:

- **Via `:Mason` UI** (press `i` on a server): enabled automatically — `mason-lspconfig`'s `automatic_enable` calls `vim.lsp.enable()` for every Mason-installed server, not just ones listed in `ensure_installed`.
- **Via `ensure_installed` in `lsp.lua`**: restart nvim so Mason installs the binary, then it's enabled the same way.

Once installed, just open a file of that language — the client attaches to the buffer on its own. Confirm with `:LspInfo`, then use the keymaps below.

> Gotcha: a server installed only through the `:Mason` UI isn't recorded in this repo. It works on this machine, but a fresh clone of this config elsewhere won't have it until you also add it to `ensure_installed` in `lsp.lua`.

Useful commands:

| Command | What |
|---------|------|
| `:Mason` | Browse/install/remove LSP servers, formatters, linters |
| `:LspInfo` | See which LSP clients are attached to current buffer |
| `:checkhealth` | General config/plugin health check |

LSP keymaps (active once a server attaches to a buffer):

| Key | Action |
|-----|--------|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gi` | Goto implementation |
| `gr` | Goto references |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` / `]d` | Prev/next diagnostic |
| `<leader>e` | Show diagnostic under cursor |

## Keybindings

Leader key is `<Space>`. Every custom keymap has a `desc` set — press `<leader>` and wait a moment to bring up a **which-key** popup showing all available bindings, so this list is a quick reference, not the source of truth.

| Key | Action |
|-----|--------|
| `<leader>S` | Save file |
| `<leader>nd` | Dismiss Noice message |
| `<leader><Left>` / `<leader><Right>` | Prev/next tab |
| `<C-n>` | Toggle file explorer (Neo-tree) |
| `<leader>bf` | Buffer list (floating Neo-tree) |
| `<C-p>` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader><leader>` | Recent files (Telescope) |

## Troubleshooting

**Plugin git errors** (e.g. `fatal: not a git repository`, submodule checkout failures): the plugin's local clone under `~/.local/share/nvim/lazy/<plugin>/` got corrupted (interrupted update, broken submodule). Fix by deleting that plugin's directory and re-syncing:

```sh
rm -rf ~/.local/share/nvim/lazy/<PluginName>
nvim --headless "+Lazy! sync" +qa
```

**LSP server not attaching**: run `:Mason` and confirm the server shows installed; run `:LspInfo` in the relevant buffer to see attach errors.
