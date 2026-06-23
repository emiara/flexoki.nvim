local M = {}

M.base = {
  paper = "#FFFCF0",
  [50] = "#F2F0E5",
  [100] = "#E6E4D9",
  [150] = "#DAD8CE",
  [200] = "#CECDC3",
  [300] = "#B7B5AC",
  [400] = "#9F9D96",
  [500] = "#878580",
  [600] = "#6F6E69",
  [700] = "#575653",
  [800] = "#403E3C",
  [850] = "#343331",
  [900] = "#282726",
  [950] = "#1C1B1A",
  black = "#100F0F",
}

M.red = {
  [50] = "#FFE1D5",
  [100] = "#FFCABB",
  [150] = "#FDB2A2",
  [200] = "#F89A8A",
  [300] = "#E8705F",
  [400] = "#D14D41",
  [500] = "#C03E35",
  [600] = "#AF3029",
  [700] = "#942822",
  [800] = "#6C201C",
  [850] = "#551B18",
  [900] = "#3E1715",
  [950] = "#261312",
}

M.orange = {
  [50] = "#FFE7CE",
  [100] = "#FED3AF",
  [150] = "#FCC192",
  [200] = "#F9AE77",
  [300] = "#EC8B49",
  [400] = "#DA702C",
  [500] = "#CB6120",
  [600] = "#BC5215",
  [700] = "#9D4310",
  [800] = "#71320D",
  [850] = "#59290D",
  [900] = "#40200D",
  [950] = "#27180E",
}

M.yellow = {
  [50] = "#FAEEC6",
  [100] = "#F6E2A0",
  [150] = "#F1D67E",
  [200] = "#ECCB60",
  [300] = "#DFB431",
  [400] = "#D0A215",
  [500] = "#BE9207",
  [600] = "#AD8301",
  [700] = "#8E6B01",
  [800] = "#664D01",
  [850] = "#503D02",
  [900] = "#3A2D04",
  [950] = "#241E08",
}

M.green = {
  [50] = "#EDEECF",
  [100] = "#DDE2B2",
  [150] = "#CDD597",
  [200] = "#BEC97E",
  [300] = "#A0AF54",
  [400] = "#879A39",
  [500] = "#768D21",
  [600] = "#66800B",
  [700] = "#536907",
  [800] = "#3D4C07",
  [850] = "#313D07",
  [900] = "#252D09",
  [950] = "#1A1E0C",
}

M.cyan = {
  [50] = "#DDF1E4",
  [100] = "#BFE8D9",
  [150] = "#A2DECE",
  [200] = "#87D3C3",
  [300] = "#5ABDAC",
  [400] = "#3AA99F",
  [500] = "#2F968D",
  [600] = "#24837B",
  [700] = "#1C6C66",
  [800] = "#164F4A",
  [850] = "#143F3C",
  [900] = "#122F2C",
  [950] = "#101F1D",
}

M.blue = {
  [50] = "#E1ECEB",
  [100] = "#C6DDE8",
  [150] = "#ABCFE2",
  [200] = "#92BFDB",
  [300] = "#66A0C8",
  [400] = "#4385BE",
  [500] = "#3171B2",
  [600] = "#205EA6",
  [700] = "#1A4F8C",
  [800] = "#163B66",
  [850] = "#133051",
  [900] = "#12253B",
  [950] = "#101A24",
}

M.purple = {
  [50] = "#F0EAEC",
  [100] = "#E2D9E9",
  [150] = "#D3CAE6",
  [200] = "#C4B9E0",
  [300] = "#A699D0",
  [400] = "#8B7EC8",
  [500] = "#735EB5",
  [600] = "#5E409D",
  [700] = "#4F3685",
  [800] = "#3C2A62",
  [850] = "#31234E",
  [900] = "#261C39",
  [950] = "#1A1623",
}

M.magenta = {
  [50] = "#FEE4E5",
  [100] = "#FCCFDA",
  [150] = "#F9B9CF",
  [200] = "#F4A4C2",
  [300] = "#E47DA8",
  [400] = "#CE5D97",
  [500] = "#B74583",
  [600] = "#A02F6F",
  [700] = "#87285E",
  [800] = "#641F46",
  [850] = "#4F1B39",
  [900] = "#39172B",
  [950] = "#24131D",
}

M.names = { "red", "orange", "yellow", "green", "cyan", "blue", "purple", "magenta" }

local function copy(scale)
  local ret = {}
  for key, value in pairs(scale) do
    ret[key] = value
  end
  return ret
end

local function palette()
  local ret = { base = copy(M.base), accents = {} }
  for _, name in ipairs(M.names) do
    ret.accents[name] = copy(M[name])
  end
  return ret
end

---@param style "light"|"dark"
function M.make(style)
  local dark = style == "dark"
  local syntax = dark and 400 or 600
  local b = M.base

  ---@class Palette
  local ret = {
    style = style,
    palette = palette(),
    base = copy(M.base),
  }

  for _, name in ipairs(M.names) do
    ret[name] = M[name][syntax]
    ret[name .. "_light"] = M[name][400]
    ret[name .. "_dark"] = M[name][600]
  end

  ret.teal = ret.cyan
  ret.black = dark and b.black or b.paper
  ret.paper = b.paper

  if dark then
    ret.bg = b.black
    ret.bg_dark = b[950]
    ret.bg_dark1 = b[900]
    ret.bg_highlight = b[900]
    ret.bg_visual = b[850]
    ret.bg_search = M.yellow[850]
    ret.fg = b[200]
    ret.fg_dark = b[300]
    ret.fg_gutter = b[700]
    ret.comment = b[500]
    ret.border = b[850]
    ret.border_highlight = b[600]
    ret.dark3 = b[700]
    ret.dark5 = b[500]
    ret.terminal_black = b[950]
    ret.terminal_black_bright = b[800]
    ret.terminal_white = b[200]
    ret.terminal_white_bright = b[50]
    ret.terminal_bright = {
      red = M.red[300],
      orange = M.orange[300],
      yellow = M.yellow[300],
      green = M.green[300],
      cyan = M.cyan[300],
      blue = M.blue[300],
      purple = M.purple[300],
      magenta = M.magenta[300],
    }
    ret.diff = {
      add = M.green[950],
      delete = M.red[950],
      change = M.blue[950],
      text = M.blue[850],
    }
    ret.git = {
      add = M.green[400],
      change = M.blue[400],
      delete = M.red[400],
      ignore = b[700],
    }
  else
    ret.bg = b.paper
    ret.bg_dark = b[50]
    ret.bg_dark1 = b[100]
    ret.bg_highlight = b[50]
    ret.bg_visual = b[150]
    ret.bg_search = M.yellow[100]
    ret.fg = b.black
    ret.fg_dark = b[700]
    ret.fg_gutter = b[300]
    ret.comment = b[600]
    ret.border = b[200]
    ret.border_highlight = b[500]
    ret.dark3 = b[300]
    ret.dark5 = b[500]
    ret.terminal_black = b[950]
    ret.terminal_black_bright = b[600]
    ret.terminal_white = b[100]
    ret.terminal_white_bright = b.paper
    ret.terminal_bright = {
      red = M.red[500],
      orange = M.orange[500],
      yellow = M.yellow[500],
      green = M.green[500],
      cyan = M.cyan[500],
      blue = M.blue[500],
      purple = M.purple[500],
      magenta = M.magenta[500],
    }
    ret.diff = {
      add = M.green[50],
      delete = M.red[50],
      change = M.blue[50],
      text = M.blue[100],
    }
    ret.git = {
      add = M.green[600],
      change = M.blue[600],
      delete = M.red[600],
      ignore = b[300],
    }
  end

  ret.red1 = dark and M.red[300] or M.red[700]
  ret.green1 = dark and M.green[300] or M.green[700]
  ret.green2 = dark and M.green[500] or M.green[500]
  ret.blue0 = dark and M.blue[800] or M.blue[100]
  ret.blue1 = dark and M.blue[300] or M.blue[700]
  ret.blue2 = dark and M.blue[400] or M.blue[600]
  ret.blue5 = dark and M.cyan[300] or M.cyan[700]
  ret.blue6 = dark and M.cyan[200] or M.cyan[600]
  ret.blue7 = dark and M.blue[900] or M.blue[100]
  ret.magenta2 = dark and M.magenta[300] or M.magenta[700]

  ret.error = ret.red
  ret.warning = ret.yellow
  ret.info = ret.blue
  ret.hint = ret.cyan
  ret.todo = ret.magenta

  return ret
end

return M
