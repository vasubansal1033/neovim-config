return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "html" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
      },
    },
  },
}
