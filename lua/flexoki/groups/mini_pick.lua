local M = {}

M.url = "https://github.com/echasnovski/mini.pick"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    MiniPickBorder = "FloatBorder",
    MiniPickBorderBusy = { fg = c.warning, bg = c.bg_float },
    MiniPickBorderText = "FloatTitle",
    MiniPickCursor = "Cursor",
    MiniPickIconDirectory = "Directory",
    MiniPickIconFile = { fg = c.fg_float },
    MiniPickHeader = { fg = c.magenta },
    MiniPickMatchCurrent = { bg = c.bg_visual },
    MiniPickMatchMarked = { fg = c.orange, bold = true },
    MiniPickMatchRanges = { fg = c.blue1, bold = true },
    MiniPickNormal = "NormalFloat",
    MiniPickPreviewLine = "CursorLine",
    MiniPickPreviewRegion = "IncSearch",
    MiniPickPrompt = { fg = c.blue, bold = true },
  }
end

return M
