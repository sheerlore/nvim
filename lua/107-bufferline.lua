local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup {
  options = {
    color_icons = true,
--    get_element_icon = function(element)
--      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
--      return icon, hl
--    end,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
