local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end
ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'lua',
    'javascript',
    'typescript',
    'python',
    'rust',
  },
  autotag = {
    enable = true,
  }
}
