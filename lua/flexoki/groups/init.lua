local Util = require("flexoki.util")

local M = {}

-- stylua: ignore
M.plugins = {
  ["blink.cmp"]       = "blink",
  ["bufferline.nvim"] = "bufferline",
  ["fzf-lua"]         = "fzf",
  ["gitsigns.nvim"]   = "gitsigns",
  ["lazy.nvim"]       = "lazy",
  ["lualine.nvim"]    = "lualine",
  ["mini.clue"]       = "mini_clue",
  ["mini.completion"] = "mini_completion",
  ["mini.diff"]       = "mini_diff",
  ["mini.files"]      = "mini_files",
  ["mini.icons"]      = "mini_icons",
  ["mini.notify"]     = "mini_notify",
  ["mini.pick"]       = "mini_pick",
  ["mini.statusline"] = "mini_statusline",
  ["mini.tabline"]    = "mini_tabline",
  ["neo-tree.nvim"]   = "neo-tree",
  ["noice.nvim"]      = "noice",
  ["nvim-cmp"]        = "cmp",
  ["nvim-notify"]     = "notify",
  ["nvim-tree.lua"]   = "nvim-tree",
  ["telescope.nvim"]  = "telescope",
  ["trouble.nvim"]    = "trouble",
  ["vim-gitgutter"]   = "gitgutter",
  ["which-key.nvim"]  = "which-key",
}

function M.get_group(name)
  return Util.mod("flexoki.groups." .. name)
end

---@param colors ColorScheme
---@param opts flexoki.Config
function M.get(name, colors, opts)
  return M.get_group(name).get(colors, opts)
end

---@param value boolean|{enabled:boolean}|nil
local function enabled(value)
  return type(value) == "table" and value.enabled or value
end

---@param colors ColorScheme
---@param opts flexoki.Config
function M.setup(colors, opts)
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  local plugins = opts.plugins or {}

  if plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif plugins.auto and package.loaded.lazy then
    local ok, lazy_config = pcall(require, "lazy.core.config")
    local lazy_plugins = ok and lazy_config.plugins or {}
    for plugin, group in pairs(M.plugins) do
      if lazy_plugins[plugin] then
        groups[group] = true
      end
    end
    if lazy_plugins["mini.nvim"] then
      for _, group in pairs(M.plugins) do
        if group:find("^mini_") then
          groups[group] = true
        end
      end
    end
  end

  for plugin, group in pairs(M.plugins) do
    local use = plugins[group]
    use = use == nil and plugins[plugin] or use
    if use ~= nil then
      groups[group] = enabled(use) or nil
    end
  end

  local ret = {}
  for group in pairs(groups) do
    for name, hl in pairs(M.get(group, colors, opts)) do
      ret[name] = hl
    end
  end

  Util.resolve(ret)
  opts.on_highlights(ret, colors)

  return ret, groups
end

return M
