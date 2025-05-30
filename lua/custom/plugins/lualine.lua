return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local icons = require 'nvim-web-devicons'

    -- Catppuccin Mocha Colors
    local colors = {
      bg = '#1E1E2E',
      fg = '#CDD6F4',
      yellow = '#F9E2AF',
      cyan = '#89DCEB',
      darkblue = '#1E66F5',
      green = '#A6E3A1',
      orange = '#FAB387',
      violet = '#B4BEFE',
      magenta = '#F5C2E7',
      blue = '#89B4FA',
      red = '#F38BA8',
    }

    local mode_colors = {
      n = colors.blue,
      i = colors.green,
      v = colors.magenta,
      [''] = colors.magenta,
      V = colors.magenta,
      c = colors.orange,
      no = colors.red,
      s = colors.yellow,
      S = colors.yellow,
      [''] = colors.yellow,
      ic = colors.cyan,
      R = colors.red,
      Rv = colors.red,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        component_separators = '',
        section_separators = '',
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Funzioni per inserire componenti
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Modalità con colori dinamici
    ins_left {
      function()
        return ' ' .. vim.fn.mode():upper()
      end,
      color = function()
        return { fg = mode_colors[vim.fn.mode()], gui = 'bold' }
      end,
      padding = { left = 1, right = 1 },
    }

    -- Icona del file + Nome
    ins_left {
      function()
        local filename = vim.fn.expand '%:t'
        local extension = vim.fn.expand '%:e'
        local icon, icon_color = icons.get_icon_color(filename, extension, { default = true })
        return icon and (' ' .. icon .. ' ' .. filename) or filename
      end,
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = 'bold' },
    }

    -- Posizione nel file
    ins_left { 'location' }
    ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

    -- LSP attivo
    ins_right {
      function()
        local msg = 'No LSP'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients { bufnr = 0 }

        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.tbl_contains(filetypes, buf_ft) then
            return '  ' .. client.name
          end
        end

        return msg
      end,
      color = { fg = colors.cyan, gui = 'bold' },
    }

    -- Branch Git
    ins_right {
      'branch',
      icon = '',
      color = { fg = colors.violet, gui = 'bold' },
    }

    -- Diff Git
    ins_right {
      'diff',
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }

    -- Formato e Codifica del file
    ins_right {
      function()
        return vim.bo.fileformat:upper()
      end,
      color = { fg = colors.blue, gui = 'bold' },
    }

    ins_right {
      function()
        return vim.bo.fileencoding ~= '' and vim.bo.fileencoding or 'none'
      end,
      color = { fg = colors.blue, gui = 'bold' },
    }

    -- Memoria Neovim
    ins_right {
      function()
        local mem = (collectgarbage 'count') / 1024
        return string.format(' %.2fMB', mem)
      end,
      color = { fg = colors.green, gui = 'bold' },
    }

    -- Fine barra
    ins_right {
      function()
        return '▊'
      end,
      color = { fg = colors.blue },
      padding = { left = 1 },
    }

    -- Avvia lualine con la config finale
    lualine.setup(config)
  end,
}
