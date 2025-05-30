return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000, -- Assicura che venga caricato prima degli altri plugin
  config = function()
    require('rose-pine').setup {
      variant = 'main', -- Scegli tra: 'main', 'moon', 'dawn'
      styles = {
        transparency = false,
        bold = true,
        italic = true,
      },
      dark_variant = 'main',
      disable_background = false,
      disable_float_background = false,
      bold_vert_split = false,
      dim_nc_background = true,
    }

    vim.cmd.colorscheme 'rose-pine' -- Usa 'rose-pine-moon' o 'rose-pine-dawn' se preferisci
  end,
}
