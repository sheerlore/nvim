local status, telescope = pcall(require, "telescope")
if (not status) then return end
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
        },
        ["n"] = {
        }
      }
    }
  }
}
telescope.load_extension("file_browser")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true, pwd = telescope_buffer_dir()})<CR>',
  { noremap = true }
)
