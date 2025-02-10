-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    sources = {
      'filesystem',
      'git_status', -- Aggiunge il supporto Git
    },
    window = {
      position = 'right',
      mappings = {
        ['t'] = 'open_tabnew',
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    git_status = { -- Configura la sezione Git
      window = {
        position = 'float', -- Mostra il pannello Git in una finestra fluttuante
        mappings = {
          ['A'] = 'git_add_all', -- Esempio: aggiunge tutti i file
          ['a'] = 'git_add_file', -- Aggiunge un singolo file
          ['r'] = 'git_revert_file', -- Reverte le modifiche a un file
          ['c'] = 'git_commit', -- Apre il commit
          ['P'] = 'git_push', -- Esegue un push
          ['p'] = 'git_pull', -- Esegue un pull
        },
      },
    },
    default_component_configs = { -- Configurazione per i segni Git
      git_status = {
        symbols = {
          added = '✚', -- Icona per aggiunte
          modified = '', -- Icona per modifiche
          deleted = '✖', -- Icona per eliminazioni
          untracked = '', -- Icona per file non tracciati
          ignored = '', -- Icona per file ignorati
          unstaged = '✗', -- Icona per modifiche non in stage
          staged = '✓', -- Icona per modifiche in stage
          conflict = '', -- Icona per conflitti
        },
      },
    },
  },
}
