local M = {}

M.url = "https://github.com/lewis6991/gitsigns.nvim"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.git.delete },
  }
end

return M
