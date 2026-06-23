local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    TroubleCount = { fg = c.magenta, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = c.bg_sidebar },
    TroubleText = { fg = c.fg_dark },
  }
end

return M
