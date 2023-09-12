 require("nvim-tree").setup({
  view = {
    width = 40,
  },
})

vim.keymap.set('n', '<leader>ex', vim.cmd.NvimTreeFindFile)
