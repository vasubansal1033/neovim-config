# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Customizations

On top of LazyVim's defaults:

- **Colorscheme**: [catppuccin](https://github.com/catppuccin/nvim) (mocha)
- **AI**: [avante.nvim](https://github.com/yetone/avante.nvim), Claude Code ACP provider
- **Surround**: [nvim-surround](https://github.com/kylechui/nvim-surround)
- **Language extras enabled**: clangd, elixir, typescript, plus a manually added `html` LSP server

### Custom keymaps

| Keymap | Mode | Action |
| --- | --- | --- |
| `<leader>lg` | n | Lazygit (root dir) — alias for `<leader>gg` |
| `<leader>nd` | n | Dismiss Noice message |
| `<leader>S` | n | Save file |
| `<leader><Left>` | n | Previous tab |
| `<leader><Right>` | n | Next tab |

### Surround (nvim-surround)

| Keymap | Mode | Action |
| --- | --- | --- |
| `ys` | n | Add surround |
| `yss` | n | Add surround (line) |
| `yS` | n | Add surround (new lines) |
| `ySS` | n | Add surround (line, indent) |
| `ds` | n | Delete surround |
| `cs` | n | Change surround |
| `cS` | n | Change surround (new lines) |
| `S` | v | Add surround (visual) |
| `gS` | v | Add surround (visual, line) |
| `<C-g>s` | i | Add surround (insert) |
| `<C-g>S` | i | Add surround (insert, new lines) |

### Stock LazyVim keymaps worth knowing

These come from LazyVim itself (see its [keymaps docs](https://www.lazyvim.org/keymaps)), not this config:

| Keymap | Action |
| --- | --- |
| `<leader>gg` / `<leader>gG` | Lazygit (root dir / cwd) |
| `<C-p>` / `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>e` | Toggle file explorer (neo-tree) |
| `<S-h>` / `<S-l>` | Previous / next buffer |
