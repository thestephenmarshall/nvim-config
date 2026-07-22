-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--#region
vim.keymap.set("n", "<leader>yg", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return
  end

  local root = vim.fn.systemlist({ "git", "-C", vim.fn.fnamemodify(file, ":h"), "rev-parse", "--show-toplevel" })[1]
  if not root or root == "" or root:match("fatal:") then
    local rel = vim.fn.expand("%")
    vim.fn.setreg("+", rel)
    print("Copied: " .. rel)
    return
  end

  root = root:gsub("/$", "")
  local rel = file:gsub("^" .. vim.pesc(root .. "/"), "")
  vim.fn.setreg("+", rel)
  print("Copied: " .. rel)
end, { desc = "Copy path relative to git root" })
