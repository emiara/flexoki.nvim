local Util = require("flexoki.util")

local M = {}

---@type table<string, Palette|fun(opts:flexoki.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("flexoki.colors." .. style))
  end,
})

---@param opts? flexoki.Config
function M.setup(opts)
  opts = require("flexoki.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts)
  end

  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg
  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.rainbow = {
    colors.red,
    colors.orange,
    colors.yellow,
    colors.green,
    colors.cyan,
    colors.blue,
    colors.purple,
    colors.magenta,
  }

  colors.terminal = {
    black = colors.terminal_black,
    black_bright = colors.terminal_black_bright,
    red = colors.red,
    red_bright = colors.terminal_bright.red,
    green = colors.green,
    green_bright = colors.terminal_bright.green,
    yellow = colors.yellow,
    yellow_bright = colors.terminal_bright.yellow,
    blue = colors.blue,
    blue_bright = colors.terminal_bright.blue,
    magenta = colors.magenta,
    magenta_bright = colors.terminal_bright.magenta,
    cyan = colors.cyan,
    cyan_bright = colors.terminal_bright.cyan,
    white = colors.terminal_white,
    white_bright = colors.terminal_white_bright,
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
