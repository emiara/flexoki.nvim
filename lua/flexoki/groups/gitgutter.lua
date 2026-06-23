local M = {}

M.url = "https://github.com/airblade/vim-gitgutter"

---@type flexoki.HighlightsFn
function M.get(c)
  return {
    GitGutterAdd = { fg = c.git.add },
    GitGutterAddLineNr = { fg = c.git.add },
    GitGutterChange = { fg = c.git.change },
    GitGutterChangeLineNr = { fg = c.git.change },
    GitGutterDelete = { fg = c.git.delete },
    GitGutterDeleteLineNr = { fg = c.git.delete },
  }
end

return M
