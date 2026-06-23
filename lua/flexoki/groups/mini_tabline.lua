local M = {}

M.url = "https://github.com/echasnovski/mini.tabline"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    MiniTablineCurrent = { fg = c.black, bg = c.blue, bold = true },
    MiniTablineFill = { bg = c.bg_dark },
    MiniTablineHidden = { fg = c.fg_gutter, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.black, bg = c.orange, bold = true },
    MiniTablineModifiedHidden = { fg = c.orange, bg = c.bg_statusline },
    MiniTablineModifiedVisible = { fg = c.orange, bg = c.bg_highlight },
    MiniTablineTabpagesection = { fg = c.black, bg = c.magenta },
    MiniTablineVisible = { fg = c.fg_dark, bg = c.bg_highlight },
  }
end

return M
