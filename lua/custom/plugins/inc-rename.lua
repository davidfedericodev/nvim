return {
  -- Incremental rename
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = true,
    keys = {
      {
        '<leader>rn',
        mode = 'n',
        function()
          require('inc-rename').rename()
        end,
        desc = 'Incremental Rename',
      },
    },
  },
}
