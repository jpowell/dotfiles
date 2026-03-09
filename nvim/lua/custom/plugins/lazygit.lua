return {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>gs', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
  },
}
