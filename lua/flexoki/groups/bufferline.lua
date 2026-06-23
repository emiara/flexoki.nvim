local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    BufferLineBufferSelected = { fg = c.fg, bg = c.bg, bold = true },
    BufferLineFill = { bg = c.bg_dark },
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferLineSeparator = { fg = c.bg_dark, bg = c.bg_dark },
    BufferLineSeparatorSelected = { fg = c.border, bg = c.bg },
  }
end

return M
