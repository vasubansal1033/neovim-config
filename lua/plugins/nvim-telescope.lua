return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {},
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "telescope: find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope: live grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "telescope: recent files" })
      vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "telescope: fuzzy find word under cursor" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope: buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope: help tags" })
      vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "telescope: lsp definitions" })
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "telescope: lsp references" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "telescope: lsp document symbols" })
      vim.keymap.set("n", "<leader>fW", builtin.lsp_dynamic_workspace_symbols, { desc = "telescope: lsp workspace symbols" })
      vim.keymap.set("n", "<leader>fx", builtin.diagnostics, { desc = "telescope: diagnostics" })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
