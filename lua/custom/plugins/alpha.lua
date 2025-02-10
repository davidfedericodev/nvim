return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Catppuccin Mocha Colors
    local colors = {
      blue = '#89B4FA',
      lavender = '#B4BEFE',
      pink = '#F5C2E7',
      flamingo = '#F2CDCD',
      text = '#CDD6F4',
    }

    -- Set Header (con gradienti Catppuccin Mocha)
    dashboard.section.header.val = {
      '                                                     ',
      '  󰀘  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  󰀘  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  󰀘  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  󰀘  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  󰀘  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  󰀘  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- Set Menu (con più opzioni)
    dashboard.section.buttons.val = {
      dashboard.button('n', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('SPC ff', '󰱼  > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC fo', '󰈙  > Recent Files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('SPC fg', '  > Find in Git Repo', '<cmd>Telescope git_files<CR>'),
      dashboard.button('SPC ss', '󰁯  > Restore Session', '<cmd>lua require("persistence").load()<CR>'),
      dashboard.button('SPC ec', '  > Edit Config', '<cmd>e $MYVIMRC<CR>'),
      dashboard.button('q', '  > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Info di sistema e Neovim
    local function info_section()
      local total_plugins = #vim.tbl_keys(require('lazy').plugins())
      local v = vim.version()
      local version = string.format('NVIM v%d.%d.%d', v.major, v.minor, v.patch)
      local memory = string.format(' %.2f MB', collectgarbage 'count' / 1024)
      return {
        '',
        '󰨞 ' .. version .. '  |   ' .. total_plugins .. ' plugins  |  ' .. memory,
        '',
      }
    end

    dashboard.section.footer.val = info_section()

    -- Stili & Setup
    dashboard.section.header.opts.hl = { { 'Keyword', 0, -1 }, { 'Keyword', 1, -1 }, { 'Keyword', 2, -1 } }
    dashboard.section.buttons.opts.hl = 'Function'
    dashboard.section.footer.opts.hl = 'Comment'

    alpha.setup(dashboard.opts)

    -- Disabilita folding in Alpha
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
