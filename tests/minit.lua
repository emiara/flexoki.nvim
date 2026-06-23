#!/usr/bin/env -S nvim -l

local cwd = vim.uv.cwd()
vim.opt.runtimepath:append(cwd)
vim.opt.packpath:append(cwd)
package.path = cwd .. "/lua/?.lua;" .. cwd .. "/lua/?/init.lua;" .. package.path

local tests = {}
local before = nil
local assert_function = _G.assert

local function fail(message, level)
  error(message or "assertion failed", (level or 1) + 1)
end

_G.before_each = function(fn)
  before = fn
end

_G.describe = function(_, fn)
  fn()
end

_G.it = function(name, fn)
  tests[#tests + 1] = { name = name, fn = fn, before = before }
end

_G.assert = setmetatable({
  same = function(expected, actual, message)
    if not vim.deep_equal(expected, actual) then
      fail(
        message
          or ("expected " .. vim.inspect(expected) .. "\nactual   " .. vim.inspect(actual)),
        2
      )
    end
  end,
  is_true = function(value, message)
    if value ~= true then
      fail(message or ("expected true, got " .. vim.inspect(value)), 2)
    end
  end,
  is_not_nil = function(value, message)
    if value == nil then
      fail(message or "expected non-nil value", 2)
    end
  end,
  is_nil = function(value, message)
    if value ~= nil then
      fail(message or ("expected nil, got " .. vim.inspect(value)), 2)
    end
  end,
}, {
  __call = function(_, condition, message)
    return assert_function(condition, message)
  end,
})

for _, file in ipairs(arg or {}) do
  if file:match("%.lua$") and file ~= "tests/minit.lua" then
    dofile(file)
  end
end

local failures = 0

for _, test in ipairs(tests) do
  local ok, err = xpcall(function()
    if test.before then
      test.before()
    end
    test.fn()
  end, debug.traceback)

  if ok then
    print("ok - " .. test.name)
  else
    failures = failures + 1
    print("not ok - " .. test.name)
    print(err)
  end
end

if failures > 0 then
  io.stdout:write("\n")
  io.stdout:flush()
  os.exit(1)
end

io.stdout:write("\n")
io.stdout:flush()
os.exit(0)
