local M = {}

M.url = "https://github.com/nvim-lualine/lualine.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    lualine_a_normal = { bg = c.blue, fg = c.black, bold = true },
    lualine_a_insert = { bg = c.green, fg = c.black, bold = true },
    lualine_a_visual = { bg = c.magenta, fg = c.black, bold = true },
    lualine_a_replace = { bg = c.red, fg = c.black, bold = true },
    lualine_a_command = { bg = c.yellow, fg = c.black, bold = true },
    lualine_a_inactive = { bg = c.bg_statusline, fg = c.fg_gutter },
    lualine_b_normal = { bg = c.fg_gutter, fg = c.blue },
    lualine_c_normal = { bg = c.bg_statusline, fg = c.fg_sidebar },
  }
end

return M
