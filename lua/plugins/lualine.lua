return function()
  local config = require('lualine').get_config()
  config.options.theme = 'gruvbox'

  require('lualine').setup(config)
end 
