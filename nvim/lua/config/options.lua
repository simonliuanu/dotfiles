-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  local sysname = vim.uv.os_uname().sysname

  if sysname == "Darwin" then
  elseif sysname == "Linux" then
    vim.o.guifont = "Maple Mono NF CN:h12"
    vim.cmd("cd /home/melopup/Projects/")
  end
end
