local M = {}

M.url = "https://github.com/echasnovski/mini.completion"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    MiniCompletionActiveParameter = "LspSignatureActiveParameter",
    MiniCompletionDeprecated = { fg = c.fg_gutter, strikethrough = true },
  }
end

return M
