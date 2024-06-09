require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.o.autoread = true
vim.cmd([[
  autocmd CursorHold * checktime
]])
vim.wo.relativenumber = true
