return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "clangd", "elixirls", "html", "ts_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "lsp: goto definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "lsp: goto declaration" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "lsp: goto implementation" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "lsp: goto references" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "lsp: hover docs" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "lsp: rename symbol" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "lsp: code action" })
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "lsp: previous diagnostic" })
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "lsp: next diagnostic" })
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr, desc = "lsp: show diagnostic" })
        end,
      })
    end,
  },
}
