return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>a", group = "avante (ai)" },
      { "<leader>b", group = "buffer / neo-tree" },
      { "<leader>f", group = "telescope (find)" },
      { "<leader>t", group = "fterm (terminal)" },
      { "<leader>l", group = "fterm (lazygit)" },
    },
  },
}
