return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20, -- Dimensione del terminale
    open_mapping = [[<c-\>]], -- Tasto per aprire/chiudere il terminale
    hide_numbers = true, -- Nasconde la colonna dei numeri nel terminale
    shade_terminals = true, -- Applica un'ombreggiatura al terminale
    shading_factor = 2, -- Intensità dell'ombreggiatura
    start_in_insert = true, -- Inizia in modalità insert
    insert_mappings = true, -- Abilita il mapping in modalità insert
    terminal_mappings = true, -- Abilita i mapping nel terminale
    persist_size = true, -- Mantiene la dimensione tra le sessioni
    direction = 'float', -- Direzione del terminale ('vertical', 'horizontal', 'tab', 'float')
    close_on_exit = true, -- Chiude il terminale alla chiusura del processo
    shell = vim.o.shell, -- Shell predefinita
    float_opts = {
      border = 'curved', -- Stile del bordo della finestra flottante
      winblend = 0, -- Trasparenza della finestra
    },
    highlights = {
      FloatBorder = {
        guifg = '#c4a7e7', -- Cambia il colore del bordo (esempio: rosa in stile Dracula)
        guibg = 'None', -- Mantieni lo sfondo trasparente
      },
      NormalFloat = {
        guifg = '#f8f8f2', -- Colore del testo nel terminale flottante
        guibg = 'None', -- Sfondo trasparente
      },
    },
    winbar = {
      enabled = false, -- Disabilita la winbar
      name_formatter = function(term) -- Funzione per formattare il nome nella winbar
        return term.name
      end,
    },
  },
}
