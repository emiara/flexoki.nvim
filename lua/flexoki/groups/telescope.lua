local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float },
    TelescopeMatching = { fg = c.orange, bold = true },
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopePreviewTitle = { fg = c.blue, bg = c.bg_float, bold = true },
    TelescopePromptBorder = { fg = c.orange, bg = c.bg_float },
    TelescopePromptPrefix = { fg = c.orange },
    TelescopePromptTitle = { fg = c.orange, bg = c.bg_float, bold = true },
    TelescopeResultsComment = { fg = c.dark5 },
    TelescopeSelection = { bg = c.bg_visual },
    TelescopeSelectionCaret = { fg = c.orange },
  }
end

return M
