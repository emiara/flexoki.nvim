local Config = require("flexoki.config")
local Groups = require("flexoki.groups")

local base = { "base", "kinds", "semantic_tokens", "treesitter" }

before_each(function()
  Config.setup()
end)

describe("group modules are valid", function()
  for name in vim.fs.dir("lua/flexoki/groups") do
    name = name:match("(.+)%.lua$")
    if name and name ~= "init" and not vim.list_contains(base, name) then
      it(name .. " has a url", function()
        local group = Groups.get_group(name)
        assert.is_not_nil(group, name)
        assert.is_not_nil(group.url, name)
      end)

      it(name .. " has a plugin mapping", function()
        local mapping = false
        for _, group in pairs(Groups.plugins) do
          if group == name then
            mapping = true
            break
          end
        end
        assert.is_true(mapping, name)
      end)
    end
  end

  for _, name in pairs(Groups.plugins) do
    it(name .. " exists", function()
      local ok = pcall(Groups.get_group, name)
      assert(ok, name)
    end)
  end
end)

describe("group config", function()
  it("enables all plugins", function()
    local opts = Config.extend({ plugins = { all = true } })
    local expected = {}
    for _, name in ipairs(base) do
      expected[name] = true
    end
    for _, name in pairs(Groups.plugins) do
      expected[name] = true
    end

    local colors = require("flexoki.colors").setup(opts)
    local _, groups = Groups.setup(colors, opts)
    assert.same(expected, groups)
  end)

  it("enables base groups only", function()
    local opts = Config.extend({ plugins = { all = false, auto = false } })
    local expected = {}
    for _, name in ipairs(base) do
      expected[name] = true
    end

    local colors = require("flexoki.colors").setup(opts)
    local _, groups = Groups.setup(colors, opts)
    assert.same(expected, groups)
  end)

  it("enables a plugin by group name", function()
    local opts = Config.extend({ plugins = { all = false, auto = false, telescope = true } })
    local expected = {}
    for _, name in ipairs(base) do
      expected[name] = true
    end
    expected.telescope = true

    local colors = require("flexoki.colors").setup(opts)
    local _, groups = Groups.setup(colors, opts)
    assert.same(expected, groups)
  end)

  it("enables a plugin by package name", function()
    local opts = Config.extend({ plugins = { all = false, auto = false, ["telescope.nvim"] = true } })
    local expected = {}
    for _, name in ipairs(base) do
      expected[name] = true
    end
    expected.telescope = true

    local colors = require("flexoki.colors").setup(opts)
    local _, groups = Groups.setup(colors, opts)
    assert.same(expected, groups)
  end)
end)
