local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    WhichKey = { fg = c.cyan },
    WhichKeyDesc = { fg = c.magenta },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyNormal = { bg = c.bg_sidebar },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyValue = { fg = c.dark5 },
  }
end

return M
