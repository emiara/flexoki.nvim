local Util = require("flexoki.util")

local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type flexoki.HighlightsFn
function M.get(c, opts)
  local bg = opts.transparent and c.none or c.bg
  return {
    NotifyBackground = { fg = c.fg, bg = c.bg },
    NotifyDEBUGBody = { fg = c.fg, bg = bg },
    NotifyDEBUGBorder = { fg = Util.blend_bg(c.comment, 0.3), bg = bg },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyERRORBody = { fg = c.fg, bg = bg },
    NotifyERRORBorder = { fg = Util.blend_bg(c.error, 0.3), bg = bg },
    NotifyERRORIcon = { fg = c.error },
    NotifyERRORTitle = { fg = c.error },
    NotifyINFOBody = { fg = c.fg, bg = bg },
    NotifyINFOBorder = { fg = Util.blend_bg(c.info, 0.3), bg = bg },
    NotifyINFOIcon = { fg = c.info },
    NotifyINFOTitle = { fg = c.info },
    NotifyTRACEBody = { fg = c.fg, bg = bg },
    NotifyTRACEBorder = { fg = Util.blend_bg(c.purple, 0.3), bg = bg },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyTRACETitle = { fg = c.purple },
    NotifyWARNBody = { fg = c.fg, bg = bg },
    NotifyWARNBorder = { fg = Util.blend_bg(c.warning, 0.3), bg = bg },
    NotifyWARNIcon = { fg = c.warning },
    NotifyWARNTitle = { fg = c.warning },
  }
end

return M
