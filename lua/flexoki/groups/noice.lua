local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  local ret = {
    NoiceCmdlineIcon = { fg = c.blue },
    NoiceCmdlineIconInput = { fg = c.yellow },
    NoiceCmdlineIconLua = { fg = c.blue1 },
    NoiceCmdlinePopupBorder = { fg = c.border_highlight },
    NoiceCmdlinePopupBorderInput = { fg = c.yellow },
    NoiceCmdlinePopupBorderLua = { fg = c.blue1 },
    NoiceCmdlinePopupTitle = { fg = c.blue },
    NoiceCmdlinePopupTitleInput = { fg = c.yellow },
    NoiceCmdlinePopupTitleLua = { fg = c.blue1 },
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
  }

  require("flexoki.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M
