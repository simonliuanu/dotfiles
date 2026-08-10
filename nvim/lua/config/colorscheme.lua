local M = {}

M.default = "gruvbox-light"

-- Keep this deliberately curated: these are the only entries shown by the
-- picker, even though Neovim's built-in colorschemes remain available.
M.schemes = {
  "gruvbox-light",
  "gruvbox-dark",
  "tokyonight-night",
  "tokyonight-storm",
  "tokyonight-moon",
  "tokyonight-day",
  "catppuccin-mocha",
  "catppuccin-macchiato",
  "catppuccin-frappe",
  "catppuccin-latte",
  "rose-pine",
  "rose-pine-moon",
  "rose-pine-dawn",
  "kanagawa-wave",
  "kanagawa-dragon",
  "kanagawa-lotus",
  "nightfox",
  "duskfox",
  "nordfox",
  "dayfox",
  "dawnfox",
  "github_dark_default",
  "github_light_default",
  "oxocarbon",
  "everforest-light",
  "everforest-dark",
}

local state_file = vim.fn.stdpath("state") .. "/colorscheme"

local variants = {
  ["gruvbox-light"] = { scheme = "gruvbox", background = "light" },
  ["gruvbox-dark"] = { scheme = "gruvbox", background = "dark" },
  ["everforest-light"] = { scheme = "everforest", background = "light" },
  ["everforest-dark"] = { scheme = "everforest", background = "light" },
}

local function is_allowed(name)
  return vim.tbl_contains(M.schemes, name)
end

function M.saved()
  local lines = vim.fn.readfile(state_file, "", 1)
  local name = lines[1]
  return name and is_allowed(name) and name or M.default
end

function M.save(name)
  vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
  vim.fn.writefile({ name }, state_file)
end

local function apply(name)
  local variant = variants[name]
  if variant then
    vim.opt.background = variant.background
    name = variant.scheme
  end
  vim.cmd.colorscheme(name)
end

function M.load()
  apply(M.saved())
end

function M.pick()
  local items = vim.tbl_map(function(name)
    return { text = name }
  end, M.schemes)

  Snacks.picker.colorschemes({
    finder = function()
      return items
    end,
    preview = function(ctx)
      if not ctx.preview.state.colorscheme then
        ctx.preview.state.colorscheme = vim.g.colors_name or "default"
        ctx.preview.state.background = vim.o.background
        ctx.preview.win:on("WinClosed", function()
          vim.schedule(function()
            if not ctx.preview.state.colorscheme then
              return
            end
            vim.o.background = ctx.preview.state.background
            vim.cmd.colorscheme(ctx.preview.state.colorscheme)
          end)
        end, { win = true })
      end
      vim.schedule(function()
        apply(ctx.item.text)
      end)
      Snacks.picker.preview.file(ctx)
    end,
    confirm = function(picker, item)
      picker:close()
      if not item then
        return
      end
      picker.preview.state.colorscheme = nil
      M.save(item.text)
      vim.schedule(function()
        apply(item.text)
      end)
    end,
  })
end

return M
