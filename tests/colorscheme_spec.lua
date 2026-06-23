local Config = require("flexoki.config")
local Init = require("flexoki")

before_each(function()
  vim.cmd("hi clear")
  vim.g.colors_name = nil
  vim.o.background = "dark"
  Config.setup()
  Init.styles = {}
end)

it("setup defaults load without explicit options", function()
  Init.setup()
  local colors = Init.load()
  assert.same("dark", colors.style)
  assert.same("flexoki-dark", vim.g.colors_name)
end)

describe("loading respects vim.o.background", function()
  it("dark background", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("flexoki")
    assert.same("dark", vim.o.background)
    assert.same("flexoki-dark", vim.g.colors_name)
  end)

  it("light background", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("flexoki")
    assert.same("light", vim.o.background)
    assert.same("flexoki-light", vim.g.colors_name)
  end)

  it("flexoki-light sets light background", function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("flexoki-light")
    assert.same("light", vim.o.background)
    assert.same("flexoki-light", vim.g.colors_name)
  end)

  it("flexoki-dark sets dark background", function()
    vim.o.background = "light"
    vim.cmd.colorscheme("flexoki-dark")
    assert.same("dark", vim.o.background)
    assert.same("flexoki-dark", vim.g.colors_name)
  end)
end)

it("on_colors and on_highlights hooks can override values", function()
  local colors, groups = Init.load({
    style = "dark",
    on_colors = function(c)
      c.red = "#123456"
    end,
    on_highlights = function(hl, c)
      hl.FlexokiTest = { fg = c.red }
    end,
  })

  assert.same("#123456", colors.red)
  assert.same({ fg = "#123456" }, groups.FlexokiTest)
end)
