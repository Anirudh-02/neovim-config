MiniMap = require('mini.map')
MiniMap.setup()
local map = require('mini.map')
local diagnostic_integration = map.gen_integration.diagnostic({
  error = 'DiagnosticFloatingError',
  warn  = 'DiagnosticFloatingWarn',
  info  = 'DiagnosticFloatingInfo',
  hint  = 'DiagnosticFloatingHint',
})
map.setup({ integrations = {
  diagnostic_integration,
  map.gen_integration.gitsigns(),
},
symbols = {
  encode = { '▒', '█', resolution = { row = 1, col = 1 } }
},
window = {
  width = 3,
},
})

vim.cmd("autocmd VimEnter * lua MiniMap.open()")


vim.keymap.set('n', '<Leader>mt', MiniMap.toggle)
