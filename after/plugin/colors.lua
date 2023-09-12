function MakeTransparent (color)
  color = color or "kanagawa"
  vim.cmd.colorscheme(color)
  vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd('highlight LineNr ctermbg=none guibg=none')
  vim.cmd('highlight SignColumn ctermbg=none guibg=none')

  if color == "nightfly" then
    -- @lsp.mod.readonly group's symantic highlighting is causing issues for some reason 
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      -- local colorOfGroup = vim.api.nvim_get_hl_by_name(group, true).foreground
      --
      -- if colorOfGroup == 8379338 then
      --   print(group)
      -- end
      --
      -- local list = {
        --   "@lsp.mod.deprecated",
        --   "@lsp.mod.readonly",
        --   "@lsp.type.enumMember",
        --   "@lsp.type.namespace",
        --   "@lsp.type.property",
        --   "@lsp.typemod.variable.global",
        --   "@lsp.typemod.variable.readonly",
        --   "@lsp.typemod.variable.static",
        -- }
        --
        -- local isGroupInList = false
        -- for _, listItem in ipairs(list) do
        --   if listItem == group then
        --     isGroupInList = true
        --     break
        --   end
        -- end
        --
        --
        -- if isGroupInList then
        --   vim.api.nvim_set_hl(0, group, {})
        -- end

        if group == "@lsp.mod.readonly" then
          vim.api.nvim_set_hl(0, group, {})
        end

        if group == "@lsp.typemod.variable.readonly" then
          vim.api.nvim_set_hl(0, group, {fg = "#19d2c6"})
        end
      end
    end
  end

  MakeTransparent()
