local M = {}

---@param style? "light"|"dark"
function M.get(style)
  local colors, config = require("flexoki.colors").setup({ style = style })

  local hl = {
    normal = {
      a = { bg = colors.blue, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.blue },
      c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
    },
    insert = {
      a = { bg = colors.green, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.green },
    },
    command = {
      a = { bg = colors.yellow, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    },
    visual = {
      a = { bg = colors.magenta, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.magenta },
    },
    replace = {
      a = { bg = colors.red, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.red },
    },
    terminal = {
      a = { bg = colors.cyan, fg = colors.black },
      b = { bg = colors.fg_gutter, fg = colors.cyan },
    },
    inactive = {
      a = { bg = colors.bg_statusline, fg = colors.blue },
      b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
      c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
    },
  }

  if config.lualine_bold then
    for _, mode in pairs(hl) do
      mode.a.gui = "bold"
    end
  end

  return hl
end

return M
