return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        separator_style = "slant",
        indicator = { style = "icon", icon = "▎" },
        show_buffer_icons = true,
        color_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        always_show_bufferline = true,
        modified_icon = "●",
        buffer_close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { silent = true, desc = "Go to next buffer" })
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { silent = true, desc = "Go to previous buffer" })
    vim.keymap.set('n', '<leader>bc', '<cmd>bdelete<CR>', { silent = true, desc = "Close current buffer" })
    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { silent = true, desc = "Pick buffer" })
  end,
}
