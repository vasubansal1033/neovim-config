-- UI Config
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally

-- Tab
vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})
vim.keymap.set('n', '<leader>S', ':w<CR>', {desc = "Save the file"})

vim.keymap.set('n', '<leader><Left>', ':tabprevious<CR>', { silent = true, desc = "Go to previous tab" })
vim.keymap.set('n', '<leader><Right>', ':tabnext<CR>', { silent = true, desc = "Go to next tab" })
