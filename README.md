# flexoki.nvim

A Neovim colorscheme plugin for [Flexoki](https://github.com/kepano/flexoki), Steph Ango's inky color scheme for prose and code.

`flexoki.nvim` ships light and dark variants and defaults to the current `background` value, so this works without setup:

```lua
vim.cmd.colorscheme("flexoki")
```

## Palette Preview

| Role | Light | Dark |
| --- | --- | --- |
| Background | `#FFFCF0` | `#100F0F` |
| Foreground | `#100F0F` | `#CECDC3` |
| Red | `#AF3029` | `#D14D41` |
| Orange | `#BC5215` | `#DA702C` |
| Yellow | `#AD8301` | `#D0A215` |
| Green | `#66800B` | `#879A39` |
| Cyan | `#24837B` | `#3AA99F` |
| Blue | `#205EA6` | `#4385BE` |
| Purple | `#5E409D` | `#8B7EC8` |
| Magenta | `#A02F6F` | `#CE5D97` |

## Requirements

- Neovim 0.8 or newer
- `termguicolors` is enabled automatically when the theme loads

## Installation

With `vim.pack` (Neovim 0.12+):

```lua
vim.pack.add({
  "https://github.com/emiara/flexoki.nvim",
})

require("flexoki").setup({})
vim.cmd.colorscheme("flexoki")
```

To pin to a specific tag or branch:

```lua
vim.pack.add({
  { src = "https://github.com/emiara/flexoki.nvim", version = "v1.0.0" },
})
```

Update plugins with `:h vim.pack.update()` and inspect installed plugins with `:h vim.pack.get()`. See this great [vim.pack guide](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack) for details.

With `lazy.nvim`:

```lua
{
  "emiara/flexoki.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("flexoki").setup(opts)
    vim.cmd.colorscheme("flexoki")
  end,
}
```

## Usage

```lua
vim.cmd.colorscheme("flexoki")
vim.cmd.colorscheme("flexoki-light")
vim.cmd.colorscheme("flexoki-dark")
```

The default `flexoki` entry follows `vim.o.background`. `flexoki-light` and `flexoki-dark` force the matching background value.

## Configuration

```lua
require("flexoki").setup({
  style = vim.o.background == "light" and "light" or "dark",
  light_style = "light",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "normal",
    floats = "normal",
  },
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
    telescope = true,
    ["nvim-cmp"] = true,
  },
})
```

### Override Colors

```lua
require("flexoki").setup({
  on_colors = function(colors)
    colors.bg = colors.palette.base[50]
    colors.blue = colors.palette.accents.blue[700]
  end,
})
```

### Override Highlights

```lua
require("flexoki").setup({
  on_highlights = function(hl, c)
    hl.CursorLineNr = { fg = c.magenta, bold = true }
    hl["@keyword"] = { fg = c.red, italic = true }
  end,
})
```

## Plugin Groups

Core Vim, diagnostics, native LSP, Treesitter captures, semantic tokens, and completion kinds are always enabled. Plugin groups are enabled automatically when `lazy.nvim` is present, enabled all at once outside lazy by default, or controlled manually with `plugins`.

Included plugin groups: `telescope`, `fzf`, `cmp`, `blink`, `gitsigns`, `gitgutter`, `which-key`, `lazy`, `noice`, `notify`, `trouble`, `nvim-tree`, `neo-tree`, `bufferline`, `lualine`, and selected `mini.*` modules.

## Attribution

The palette is from [kepano/flexoki](https://github.com/kepano/flexoki). This plugin keeps the official base scale and accent scales intact and uses Flexoki's standard syntax strength: accent `600` for light backgrounds and accent `400` for dark backgrounds.
