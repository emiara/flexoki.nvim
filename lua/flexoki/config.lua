local M = {}

M.version = "0.1.0"

---@return flexoki.Config
local function defaults()
  return {
    style = vim.o.background == "light" and "light" or "dark",
    light_style = "light",
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    lualine_bold = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "normal",
      floats = "normal",
    },
    ---@param colors ColorScheme
    on_colors = function(colors) end,
    ---@param highlights flexoki.Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
    ---@type table<string, boolean|{enabled:boolean}>
    plugins = {
      all = package.loaded.lazy == nil,
      auto = true,
    },
  }
end

M.defaults = defaults()

---@type flexoki.Config?
M.options = nil

---@param options? flexoki.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults(), options or {})
end

---@param opts? flexoki.Config
---@return flexoki.Config
function M.extend(opts)
  if not M.options then
    M.setup()
  end
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or vim.tbl_deep_extend("force", {}, M.options)
end

setmetatable(M, {
  __index = function(_, key)
    if key == "options" then
      return defaults()
    end
  end,
})

return M
