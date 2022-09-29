local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  ensure_installed = {
    'lua',
    'json',
    'rust',
    'go',
    'javascript',
    'typescript',
  },
}
