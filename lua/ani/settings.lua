vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local o = vim.o
local wo = vim.wo

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.hlsearch = false
wo.number = true
wo.relativenumber = true
o.mouse = 'a'
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 150
o.timeout = true
o.timeoutlen = 500
o.termguicolors = true
o.wrap = false

vim.g.undodir = "~/.vim/undo"

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


o.incsearch = true
