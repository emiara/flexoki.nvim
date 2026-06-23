local M = {}

M.url = "https://github.com/echasnovski/mini.clue"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    MiniClueBorder = "FloatBorder",
    MiniClueDescGroup = { fg = c.blue },
    MiniClueDescSingle = { fg = c.fg },
    MiniClueNextKey = { fg = c.magenta },
    MiniClueNextKeyWithPostkeys = { fg = c.orange },
    MiniClueSeparator = { fg = c.comment },
    MiniClueTitle = "FloatTitle",
  }
end

return M
