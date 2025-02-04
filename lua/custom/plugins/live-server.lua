return {
  'barrett-ruth/live-server.nvim',
  build = 'npm add -g live-server',
  cmd = { 'LiveServerStart', 'LiveServerStop' },
  config = true,

  keys = {
    { '<leader>ls', '<cmd>LiveServerStart<cr>', desc = 'Start live server' },
    { '<leader>lS', '<cmd>LiveServerStop<cr>', desc = 'Stop live server' },
  },
}
