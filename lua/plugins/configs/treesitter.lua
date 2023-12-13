local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
    enable = true,
    hlgroups = {
              'TSRainbowYellow',
               'TSRainbowBlue',
               'TSRainbowOrange',
               'TSRainbowGreen',
               'TSRainbowViolet',
               'TSRainbowCyan'
            },

    -- list of languages you want to disable the plugin for
    -- disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    -- query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    -- strategy = require 'ts-rainbow.strategy.global',
    -- Do not enable for files with more than n lines
    -- max_file_lines = 3000
  },
  autotag = {
    enable = true,
  },

  indent = { enable = true },
}

return options
