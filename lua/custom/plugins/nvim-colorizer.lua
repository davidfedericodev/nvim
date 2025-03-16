return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      '*', -- Abilita il colorizer per tutti i file
      css = { rgb_fn = true }, -- Supporto per funzioni CSS come `rgb()` o `rgba()`
      html = { names = true }, -- Disabilita i nomi dei colori come `Red`
    }
  end,
}
