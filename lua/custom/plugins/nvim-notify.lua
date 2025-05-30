-- plugins/notify.lua
return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require 'notify'
    notify.setup {
      timeout = 1000,
      background_colour = '#1f1d2e', -- colore base rose-pine o usa "#000000"
    }
    vim.notify = notify -- questo è fondamentale per noice
  end,
}
