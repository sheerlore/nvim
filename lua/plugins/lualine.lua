return function()
  local config = require('lualine').get_config()
  config.options.theme = 'nord'

  require('lualine').setup(config)
end
