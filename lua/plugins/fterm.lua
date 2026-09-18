return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local fterm = require('FTerm')

      vim.keymap.set('n', '<leader>tt', function() fterm:toggle() end, {desc = 'fterm: toggle terminal'})
      vim.keymap.set('t', '<leader>tt', function() fterm:toggle() end, {desc = 'fterm: toggle terminal'})

      local lazygit = fterm:new({
        cmd = 'lazygit',
      })

      vim.keymap.set('n', '<leader>lg', function() lazygit:toggle() end, {desc = 'fterm: toggle lazygit'})
      vim.keymap.set('t', '<leader>lg', function() lazygit:toggle() end, {desc = 'fterm: toggle lazygit'})
    end,
  }
}
