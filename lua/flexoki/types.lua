---@class flexoki.Config
---@field style? "light"|"dark"
---@field light_style? "light"
---@field transparent? boolean
---@field terminal_colors? boolean
---@field dim_inactive? boolean
---@field lualine_bold? boolean
---@field styles? table<string, vim.api.keyset.highlight|string>
---@field on_colors? fun(colors: ColorScheme)
---@field on_highlights? fun(highlights: flexoki.Highlights, colors: ColorScheme)
---@field plugins? table<string, boolean|{enabled:boolean}>

---@alias flexoki.Highlights table<string, vim.api.keyset.highlight|string>
---@alias flexoki.HighlightsFn fun(colors: ColorScheme, opts: flexoki.Config): flexoki.Highlights

---@class ColorScheme
---@field style "light"|"dark"
---@field none string
---@field bg string
---@field fg string
---@field palette table

return {}
