return {
  'xiyaowong/transparent.nvim',
  config = function()
    require('transparent').setup {
      groups = { -- gruppi highlight da rendere trasparenti
        'Normal',
        'NormalNC',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        'CursorLineNr',
        'EndOfBuffer',
        'VertSplit',
        'StatusLine',
        'StatusLineNC',
        'WinSeparator',
        'TelescopeNormal',
        'TelescopeBorder',
      },
      extra_groups = {}, -- puoi aggiungere gruppi personalizzati
      exclude_groups = {}, -- o escludere alcuni gruppi
    }

    -- Attiva la trasparenza
    require('transparent').clear_prefix 'Telescope'
    vim.cmd 'TransparentEnable'
  end,
}
