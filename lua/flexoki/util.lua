local M = {}

M.bg = "#100F0F"
M.fg = "#CECDC3"

---@param c string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param modname string
function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  local ok, ret = pcall(require, modname)
  if not ok then
    error(ret)
  end
  return ret
end

---@param foreground string
---@param alpha number|string
---@param background string
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local function blend_channel(i)
    local ret = alpha * fg[i] + (1 - alpha) * bg[i]
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blend_channel(1), blend_channel(2), blend_channel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end

M.darken = M.blend_bg

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end

M.lighten = M.blend_fg

function M.brighten(color, amount)
  amount = amount or 0.24
  return vim.o.background == "light" and M.blend_bg(color, 1 - amount, "#100F0F")
    or M.blend_fg(color, 1 - amount, "#FFFCF0")
end

---@param groups flexoki.Highlights
---@return flexoki.Highlights
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for key, value in pairs(hl.style) do
        hl[key] = value
      end
      hl.style = nil
    end
  end
  return groups
end

return M
