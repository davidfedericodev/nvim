return {
  {
    'github/copilot.vim',
    config = function()
      -- Configura una scorciatoia personalizzata per accettare suggerimenti
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<C-J>', "copilot#Accept('<CR>')", { silent = true, expr = true, noremap = true })
    end,
  },
}
