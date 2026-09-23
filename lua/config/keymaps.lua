-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "noice: dismiss message" })
vim.keymap.set("n", "<leader>S", ":w<CR>", { desc = "core: save file" })

vim.keymap.set("n", "<leader><Left>", ":tabprevious<CR>", { silent = true, desc = "core: previous tab" })
vim.keymap.set("n", "<leader><Right>", ":tabnext<CR>", { silent = true, desc = "core: next tab" })

-- alias matching old lazygit muscle memory (LazyVim binds lazygit on <leader>gg/<leader>gG by default)
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set("n", "<leader>lg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit (Root Dir)" })
end
