local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls'
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "<leader>vca", function ()
    vim.lsp.buf.code_action()
  end)
  vim.keymap.set("n", "<leader>vrn", function ()
    vim.lsp.buf.rename()
  end)
end)

lsp.format_mapping('<leader>fp', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {'javascript', 'typescript', 'gopls', 'css', 'scss', 'sass', },
  }
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {'gopls', 'go', 'golang', 'javascript', 'javascriptreact',  'typescriptreact','typescript', 'css', 'scss', 'sass' },
  }
})

-- (Optional) Configure lua language server for neovim
local lspConfig = require("lspconfig")
lspConfig.lua_ls.setup(lsp.nvim_lua_ls())

lspConfig.gopls.setup{}

lsp.setup()

local cmp = require("cmp")

local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
  preselect = 'item',
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    {name = 'path'},
    {name = 'luasnip'},
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping  = {
    ['<CR>'] =  cmp.mapping.confirm({select = false}),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }

})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    --- Replace these with the tools you have installed
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
  }
})
