return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim', -- Necessario per i popup
    'rcarriga/nvim-notify', -- Opzionale, per notifiche avanzate
  },
  config = function()
    require('noice').setup {
      -- Configura la barra dei comandi
      cmdline = {
        enabled = true,
        view = 'cmdline_popup', -- Mostra la barra come un popup
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { pattern = '^/', icon = '🔍 ', lang = 'regex' },
          search_up = { pattern = '^%?', icon = '🔍 ', lang = 'regex' },
        },
      },
      -- Configurazioni richieste aggiuntive
      redirect = { view = 'popup' },
      commands = {}, -- Necessario per configurare comandi personalizzati
      notify = { enabled = true }, -- Abilita notifiche migliorate
      markdown = { hover = true, highlights = { ['@text'] = 'Title' } },
      health = { checker = true }, -- Controllo di salute per Noice
      presets = {
        bottom_search = false, -- Usa il popup per la ricerca
        command_palette = true, -- Abilita la palette dei comandi
        long_message_to_split = true, -- Mostra messaggi lunghi in un buffer separato
        inc_rename = false, -- Disabilita l'incremental renaming
        lsp_doc_border = false, -- Disabilita il bordo nei popup LSP
      },
      throttle = 1000 / 30, -- Limita la velocità degli aggiornamenti
      views = {}, -- Configura viste personalizzate, se necessario
      routes = {}, -- Configura percorsi personalizzati, se necessario
      status = {}, -- Configura lo stato, se necessario
    }
  end,
}
