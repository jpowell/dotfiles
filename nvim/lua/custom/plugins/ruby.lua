return {
  { 'vim-ruby/vim-ruby' },
  { 'tpope/vim-rails' },
  {
    'thoughtbot/vim-rspec',
    config = function()
      vim.g.rspec_runner = 'os_x_iterm'
      vim.g.rspec_command = ':!docker compose run web ./bin/rspec {spec}'

      vim.keymap.set('n', '<leader>rcs', ':call RunCurrentSpecFile()<CR>', { desc = 'RSpec: current file' })
      vim.keymap.set('n', '<leader>rns', ':call RunNearestSpec()<CR>', { desc = 'RSpec: nearest' })
      vim.keymap.set('n', '<leader>rls', ':call RunLastSpec()<CR>', { desc = 'RSpec: last' })
      vim.keymap.set('n', '<leader>ras', ':call RunAllSpecs()<CR>', { desc = 'RSpec: all' })
    end,
  },
}
