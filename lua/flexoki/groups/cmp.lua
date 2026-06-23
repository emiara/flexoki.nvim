local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@type flexoki.HighlightsFn
function M.get(c)
  local ret = {
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
    CmpGhostText = { fg = c.dark5 },
    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },
    CmpItemKindCopilot = { fg = c.teal, bg = c.none },
    CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },
    CmpItemKindTabNine = { fg = c.teal, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },
  }

  require("flexoki.groups.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M
