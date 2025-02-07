return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- Usa i TAB invece dei buffer (se vuoi gestire buffer metti "buffers")
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thin',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
      },
    }
  end,
}
