-- Main Neovim configuration entry point
-- Author: Stephen Marshall
-- Description: Personal Neovim configuration with modern plugin setup

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Load core configurations
require("core.options")
require("core.keymaps")

-- Setup plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
