local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    LazyButton = { bg = c.bg_highlight, fg = c.fg },
    LazyButtonActive = { bg = c.bg_visual, fg = c.blue },
    LazyCommit = { fg = c.green },
    LazyDimmed = { fg = c.comment },
    LazyH1 = { bg = c.blue, fg = c.black, bold = true },
    LazyH2 = { fg = c.blue, bold = true },
    LazyProgressDone = { bold = true, fg = c.magenta2 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
    LazyReasonCmd = { fg = c.cyan },
    LazyReasonEvent = { fg = c.magenta },
    LazySpecial = { fg = c.orange },
  }
end

return M
