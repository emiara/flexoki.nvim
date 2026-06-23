local M = {}

M.url = "https://github.com/echasnovski/mini.diff"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    MiniDiffOverAdd = { bg = c.diff.add },
    MiniDiffOverChange = { bg = c.diff.change },
    MiniDiffOverContext = { bg = c.bg_highlight },
    MiniDiffOverDelete = { bg = c.diff.delete },
    MiniDiffSignAdd = { fg = c.git.add },
    MiniDiffSignChange = { fg = c.git.change },
    MiniDiffSignDelete = { fg = c.git.delete },
  }
end

return M
