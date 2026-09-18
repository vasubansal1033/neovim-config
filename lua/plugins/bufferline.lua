return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function close_buffer(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()
      if vim.bo[bufnr].filetype == "neo-tree" then
        return
      end
      for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
        vim.api.nvim_win_call(win, function()
          if vim.fn.bufnr("#") ~= bufnr and vim.fn.buflisted(vim.fn.bufnr("#")) == 1 then
            vim.cmd("buffer #")
          else
            vim.cmd("bnext")
          end
        end)
      end
      if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
        vim.api.nvim_buf_delete(bufnr, {})
      end
    end

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
        close_command = function(bufnum) close_buffer(bufnum) end,
        right_mouse_command = function(bufnum) close_buffer(bufnum) end,
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

    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { silent = true, desc = "bufferline: next buffer" })
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { silent = true, desc = "bufferline: previous buffer" })

    vim.keymap.set('n', '<leader>bc', function() close_buffer() end, { silent = true, desc = "bufferline: close buffer" })

    vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { silent = true, desc = "bufferline: pick buffer" })
  end,
}
